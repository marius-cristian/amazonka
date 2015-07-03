{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}

-- Module      : Network.AWS.Route53Domains.ListTagsForDomain
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- | This operation returns all of the tags that are associated with the
-- specified domain.
--
-- All tag operations are eventually consistent; subsequent operations may
-- not immediately represent all issued operations.
--
-- <http://docs.aws.amazon.com/Route53/latest/APIReference/api-ListTagsForDomain.html>
module Network.AWS.Route53Domains.ListTagsForDomain
    (
    -- * Request
      ListTagsForDomain
    -- ** Request constructor
    , listTagsForDomain
    -- ** Request lenses
    , ltfdDomainName

    -- * Response
    , ListTagsForDomainResponse
    -- ** Response constructor
    , listTagsForDomainResponse
    -- ** Response lenses
    , ltfdrStatus
    , ltfdrTagList
    ) where

import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response
import           Network.AWS.Route53Domains.Types

-- | The ListTagsForDomainRequest includes the following elements.
--
-- /See:/ 'listTagsForDomain' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'ltfdDomainName'
newtype ListTagsForDomain = ListTagsForDomain'
    { _ltfdDomainName :: Text
    } deriving (Eq,Read,Show)

-- | 'ListTagsForDomain' smart constructor.
listTagsForDomain :: Text -> ListTagsForDomain
listTagsForDomain pDomainName =
    ListTagsForDomain'
    { _ltfdDomainName = pDomainName
    }

-- | The domain for which you want to get a list of tags.
ltfdDomainName :: Lens' ListTagsForDomain Text
ltfdDomainName = lens _ltfdDomainName (\ s a -> s{_ltfdDomainName = a});

instance AWSRequest ListTagsForDomain where
        type Sv ListTagsForDomain = Route53Domains
        type Rs ListTagsForDomain = ListTagsForDomainResponse
        request = postJSON
        response
          = receiveJSON
              (\ s h x ->
                 ListTagsForDomainResponse' <$>
                   (pure (fromEnum s)) <*> (x .?> "TagList" .!@ mempty))

instance ToHeaders ListTagsForDomain where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("Route53Domains_v20140515.ListTagsForDomain" ::
                       ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON ListTagsForDomain where
        toJSON ListTagsForDomain'{..}
          = object ["DomainName" .= _ltfdDomainName]

instance ToPath ListTagsForDomain where
        toPath = const "/"

instance ToQuery ListTagsForDomain where
        toQuery = const mempty

-- | The ListTagsForDomain response includes the following elements.
--
-- /See:/ 'listTagsForDomainResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'ltfdrStatus'
--
-- * 'ltfdrTagList'
data ListTagsForDomainResponse = ListTagsForDomainResponse'
    { _ltfdrStatus  :: !Int
    , _ltfdrTagList :: ![Tag]
    } deriving (Eq,Read,Show)

-- | 'ListTagsForDomainResponse' smart constructor.
listTagsForDomainResponse :: Int -> ListTagsForDomainResponse
listTagsForDomainResponse pStatus =
    ListTagsForDomainResponse'
    { _ltfdrStatus = pStatus
    , _ltfdrTagList = mempty
    }

-- | FIXME: Undocumented member.
ltfdrStatus :: Lens' ListTagsForDomainResponse Int
ltfdrStatus = lens _ltfdrStatus (\ s a -> s{_ltfdrStatus = a});

-- | A list of the tags that are associated with the specified domain.
--
-- Type: A complex type containing a list of tags
--
-- Each tag includes the following elements.
--
-- -   Key
--
--     The key (name) of a tag.
--
--     Type: String
--
-- -   Value
--
--     The value of a tag.
--
--     Type: String
--
ltfdrTagList :: Lens' ListTagsForDomainResponse [Tag]
ltfdrTagList = lens _ltfdrTagList (\ s a -> s{_ltfdrTagList = a});
