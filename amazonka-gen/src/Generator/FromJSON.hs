{-# LANGUAGE DeriveGeneric        #-}
{-# LANGUAGE FlexibleContexts     #-}
{-# LANGUAGE FlexibleInstances    #-}
{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE RecordWildCards      #-}
{-# LANGUAGE TupleSections        #-}

{-# OPTIONS_GHC -fno-warn-orphans #-}

-- Module      : Generator.FromJSON
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

module Generator.FromJSON where

import           Control.Applicative
import           Control.Error
import           Control.Monad
import           Data.Aeson                 hiding (Error)
import           Data.Aeson.Types           hiding (Error)
import qualified Data.ByteString.Char8      as BS
import qualified Data.ByteString.Lazy       as LBS
import           Data.Default
import qualified Data.HashMap.Strict        as Map
import           Data.Monoid                hiding (Sum)
import           Data.String.CaseConversion
import           Data.Text                  (Text)
import qualified Data.Text                  as Text
import qualified Data.Text.Encoding         as Text
import qualified Data.Text.Unsafe           as Text
import           GHC.Generics
import           Generator.AST
import           Generator.Log
import           Generator.Models
import           Generator.Transform
import           Network.HTTP.Types.Method

parseModel :: Model -> Script Service
parseModel Model{..} = do
    r <- scriptIO $ say "Parse Service" modPath >> LBS.readFile modPath
    hoistEither (eitherDecode r)

instance FromJSON Abbrev where
    parseJSON = withText "abbrev" (return . abbrev)

instance FromJSON Doc where
    parseJSON = withText "documentation" (return . documentation)

instance FromJSON Time where
    parseJSON = fromCtor lowered

instance FromJSON Checksum where
    parseJSON = fromCtor lowered

instance FromJSON ServiceType where
    parseJSON = fromCtor (recase Camel Hyphen)

instance FromJSON Signature where
    parseJSON = withText "signature" $ \t ->
        return $ case t of
            "v2"      -> V2
            "v3"      -> V3
            "v3https" -> V3
            _         -> V4

instance FromJSON JSONV where
    parseJSON (String t) = return (JSONV t)
    parseJSON (Number n) = return . JSONV . Text.pack $ show n
    parseJSON e          = fail $ "Unrecognised JSONV field: " ++ show e

instance FromJSON Service where
    parseJSON = withObject "service" $ \o -> do
        n   <- o .:  "service_full_name"
        a   <- o .:  "service_abbreviation" .!= abbrev n
        rv  <- o .:  "api_version"
        t   <- o .:! "type"
        ops <- o .:  "operations"

        let ver = version rv
            vNS = namespace a ver
            typ | a == "S3" = RestS3
                | otherwise = t
            sEr = serviceError a ops

        Service a n (rootNS vNS) vNS (typeNS vNS) ver rv typ sEr
            <$> o .:? "result_wrapped" .!= False
            <*> o .:  "signature_version"
            <*> o .:! "documentation"
            <*> o .:  "endpoint_prefix"
            <*> o .:? "global_endpoint"
            <*> o .:? "xmlnamespace"
            <*> o .:! "timestamp_format"
            <*> o .:! "checksum_format"
            <*> o .:! "json_version"
            <*> o .:? "target_prefix"
            <*> pure ops

instance FromJSON [Operation] where
    parseJSON = withObject "operations" (mapM parseJSON . Map.elems)

instance FromJSON Operation where
    parseJSON = withObject "operation" $ \o -> do
        n <- o .:  "name"
        Operation n
            <$> pure def
            <*> o .:? "alias"
            <*> pure def
            <*> pure def
            <*> pure def
            <*> pure def
            <*> o .:  "documentation"
            <*> o .:? "documentation_url"
            <*> parseJSON (Object o)
            <*> parseJSON (Object o)
            <*> o .:  "errors"
            <*> o .:? "pagination"

instance FromJSON Request where
    parseJSON = withObject "request" $ \o ->
        Request "Request" "Request" def def def def
            <$> o .:! "input"
            <*> o .:! "http"

instance FromJSON Response where
    parseJSON = withObject "response" $ \o ->
        Response "Response" def
            <$> o .:! "output"

instance FromJSON Location where
    parseJSON = fromCtor (lowered . drop 1)

instance FromJSON Common where
    parseJSON = withObject "common" $ \o -> do
        n <- o .:  "shape_name" <|> o .: "alias" <|> o .: "name" <|> return Nothing
        x <- o .:? "xmlname" .!= n
        l <- o .:! "location"
        Common n x l
            <$> o .:? "location_name" .!= n
            <*> o .:? "required"      .!= (if l == LBody then True else False)
            <*> o .:? "documentation"
            <*> o .:? "streaming"     .!= False

instance FromJSON Shape where
    parseJSON = withObject "shape" $ \o -> do
        c <- parseJSON (Object o)
        o .: "type" >>= f c o
      where
        f c o "structure" = do
            xs <- o .:? "members"      .!= mempty
            ys <- o .:? "member_order" .!= Map.keys xs :: Parser [Text]

            let fs = Map.fromList $ mapMaybe (\y -> (y,) <$> Map.lookup y xs) ys

            return . SStruct $ Struct fs c

        f c o "list" = fmap SList $ List
            <$> o .:  "members"
            <*> o .:? "flattened"  .!=  False
            <*> o .:? "min_length" .!= 0
            <*> o .:? "max_length" .!= 0
            <*> pure c

        f c o "map" = fmap SMap $ Map
            <$> o .: "keys"
            <*> o .: "members"
            <*> pure c

        f c o typ = do
            ms <- o .:? "enum"

            let enum = shapeEnums (_cmnName c) <$> ms

            case enum of
                Just vs -> return . SSum $ Sum vs c
                Nothing -> fmap SPrim $ Prim
                    <$> parseJSON (String typ)
                    <*> o .:? "min_length" .!= 0
                    <*> o .:? "max_length" .!= 0
                    <*> o .:? "pattern"
                    <*> pure c

instance FromJSON Primitive where
    parseJSON = withText "type" $ \t ->
        case t of
            "string"    -> return PText
            "integer"   -> return PInteger
            "long"      -> return PInteger
            "double"    -> return PDouble
            "float"     -> return PDouble
            "boolean"   -> return PBool
            "blob"      -> return PByteString
            "timestamp" -> return PUTCTime
            _           -> fail $ "Unable to parse Prim from: " ++ Text.unpack t

instance FromJSON Pagination where
    parseJSON = withObject "pagination" $ \o -> do
        let f k = o .: k <|> ((:[]) <$> o .: k)

        x <- f "input_token"
        y <- f "output_token"

        unless (length x == length y) $
            fail "input_token and output_token don't contain same number of keys."

        Pagination (zipWith Token x y) <$> o .:? "more_results"

instance FromJSON HTTP where
    parseJSON = withObject "http" $ \o -> HTTP
        <$> (o .: "method" >>= method)
        <*> o .: "uri"
        <*> o .: "uri"
      where
        method = either (fail . BS.unpack) return
            . parseMethod
            . Text.encodeUtf8

instance FromJSON [PathPart] where
    parseJSON = withText "uri" $ return . path
       where
        path = filter (/= PConst "") . go . Text.takeWhile (/= '?')

        go x | Text.null s = [PConst l]
             | otherwise   = PConst l : PVar m : go (Text.unsafeTail t)
          where
            (m, t) = Text.span (/= '}') $ Text.unsafeTail s
            (l, s) = Text.span (/= '{') x

instance FromJSON [QueryPart] where
    parseJSON = withText "uri" $ return . query
      where
        query = map (uncurry QueryPart) . go . Text.dropWhile (/= '?')

        go x | Text.null s
             , Text.null l = []
             | Text.null s = [(Text.tail l, Nothing)]
             | otherwise   = brk : go (Text.unsafeTail t)
          where
            (m, t) = Text.span (/= '}') $ Text.unsafeTail s
            (l, s) = Text.span (/= '{') x

            brk | '=' <- Text.last l = (Text.init $ Text.tail l, Just m)
                | otherwise          = (Text.tail l, Nothing)

(.:!) :: (Default a, FromJSON a) => Object -> Text -> Parser a
(.:!) o k = o .:? k .!= def

fromField :: (Generic a, GFromJSON (Rep a))
          => (String -> String)
          -> Value
          -> Parser a
fromField f = genericParseJSON $ defaultOptions { fieldLabelModifier = f }

fromCtor :: (Generic a, GFromJSON (Rep a))
         => (String -> String)
         -> Value
         -> Parser a
fromCtor f = genericParseJSON $ defaultOptions
    { constructorTagModifier = f
    , allNullaryToStringTag  = True
    }
