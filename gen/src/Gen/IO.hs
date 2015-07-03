{-# LANGUAGE FlexibleContexts  #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TupleSections     #-}

-- Module      : Gen.IO
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla xtPublic License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

module Gen.IO where

import           Control.Error
import           Control.Monad.Except
import           Control.Monad.State
import           Data.ByteString           (ByteString)
import           Data.Text                 (Text)
import qualified Data.Text                 as Text
import qualified Data.Text.Lazy            as LText
import           Data.Text.Lazy.Builder    (toLazyText)
import qualified Data.Text.Lazy.IO         as LText
import qualified Filesystem                as FS
import           Filesystem.Path.CurrentOS
import           Gen.Formatting
import           Gen.Types
import           System.IO
import qualified Text.EDE                  as EDE

run :: ExceptT Error IO a -> IO a
run = runScript . fmapLT LText.unpack

io :: MonadIO m => IO a -> ExceptT Error m a
io = fmapLT (LText.pack . show) . syncIO

title :: MonadIO m => Format (ExceptT Error m ()) a -> a
title m = runFormat m (io . LText.putStrLn . toLazyText)

say :: MonadIO m => Format (ExceptT Error m ()) a -> a
say = title . (" -> " %)

done :: MonadIO m => ExceptT Error m ()
done = title ""

isFile :: MonadIO m => Path -> ExceptT Error m Bool
isFile = io . FS.isFile

listDir :: MonadIO m => Path -> ExceptT Error m [Path]
listDir = io . FS.listDirectory

readBSFile :: MonadIO m => Path -> ExceptT Error m ByteString
readBSFile f = do
    p <- isFile f
    if p
        then say ("Reading "  % path) f >> io (FS.readFile f)
        else failure ("Missing " % path) f

writeLTFile :: MonadIO m => Path -> LText.Text -> ExceptT Error m ()
writeLTFile f t = do
    say ("Writing " % path) f
    io . FS.withFile f FS.WriteMode $ \h -> do
        hSetEncoding  h utf8
        LText.hPutStr h t

touchFile :: MonadIO m => Path -> ExceptT Error m ()
touchFile f = do
    p <- isFile f
    unless p $
        writeLTFile f mempty

createDir :: MonadIO m => Path -> ExceptT Error m ()
createDir d = do
    p <- io (FS.isDirectory d)
    unless p $ do
        say ("Creating " % path) d
        io (FS.createTree d)

copyDir :: MonadIO m => Path -> Path -> ExceptT Error m ()
copyDir src dst = io (FS.listDirectory src >>= mapM_ copy)
  where
    copy f = do
        let p = dst </> filename f
        fprint (" -> Copying " % path % " to " % path % "\n") f (directory p)
        FS.copyFile f p

readTemplate :: MonadIO m
             => Path
             -> Path
             -> StateT (Map Text (EDE.Result EDE.Template)) (ExceptT Error m) EDE.Template
readTemplate d f = do
    let tmpl = d </> f
    lift (readBSFile tmpl)
        >>= EDE.parseWith EDE.defaultSyntax (load d) (toTextIgnore tmpl)
        >>= EDE.result (throwError . LText.pack . show) return
  where
    load p o k _ = lift (readBSFile x) >>= EDE.parseWith o (load (directory x)) k
      where
        x | Text.null k = fromText k
          | otherwise   = p </> fromText k
