{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}

-- Module      : Network.AWS.IAM.GetAccountAuthorizationDetails
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

-- | Retrieves information about all IAM users, groups, roles, and policies
-- in your account, including their relationships to one another. Use this
-- API to obtain a snapshot of the configuration of IAM permissions (users,
-- groups, roles, and policies) in your account.
--
-- You can optionally filter the results using the @Filter@ parameter. You
-- can paginate the results using the @MaxItems@ and @Marker@ parameters.
--
-- <http://docs.aws.amazon.com/IAM/latest/APIReference/API_GetAccountAuthorizationDetails.html>
module Network.AWS.IAM.GetAccountAuthorizationDetails
    (
    -- * Request
      GetAccountAuthorizationDetails
    -- ** Request constructor
    , getAccountAuthorizationDetails
    -- ** Request lenses
    , gaadMaxItems
    , gaadMarker
    , gaadFilter

    -- * Response
    , GetAccountAuthorizationDetailsResponse
    -- ** Response constructor
    , getAccountAuthorizationDetailsResponse
    -- ** Response lenses
    , gaadrRoleDetailList
    , gaadrGroupDetailList
    , gaadrUserDetailList
    , gaadrMarker
    , gaadrIsTruncated
    , gaadrPolicies
    , gaadrStatus
    ) where

import           Network.AWS.IAM.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'getAccountAuthorizationDetails' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'gaadMaxItems'
--
-- * 'gaadMarker'
--
-- * 'gaadFilter'
data GetAccountAuthorizationDetails = GetAccountAuthorizationDetails'
    { _gaadMaxItems :: !(Maybe Nat)
    , _gaadMarker   :: !(Maybe Text)
    , _gaadFilter   :: !(Maybe [EntityType])
    } deriving (Eq,Read,Show)

-- | 'GetAccountAuthorizationDetails' smart constructor.
getAccountAuthorizationDetails :: GetAccountAuthorizationDetails
getAccountAuthorizationDetails =
    GetAccountAuthorizationDetails'
    { _gaadMaxItems = Nothing
    , _gaadMarker = Nothing
    , _gaadFilter = Nothing
    }

-- | Use this only when paginating results to indicate the maximum number of
-- items you want in the response. If there are additional items beyond the
-- maximum you specify, the @IsTruncated@ response element is @true@. This
-- parameter is optional. If you do not include it, it defaults to 100.
gaadMaxItems :: Lens' GetAccountAuthorizationDetails (Maybe Natural)
gaadMaxItems = lens _gaadMaxItems (\ s a -> s{_gaadMaxItems = a}) . mapping _Nat;

-- | Use this only when paginating results, and only in a subsequent request
-- after you\'ve received a response where the results are truncated. Set
-- it to the value of the @Marker@ element in the response you just
-- received.
gaadMarker :: Lens' GetAccountAuthorizationDetails (Maybe Text)
gaadMarker = lens _gaadMarker (\ s a -> s{_gaadMarker = a});

-- | A list of entity types (user, group, role, local managed policy, or AWS
-- managed policy) for filtering the results.
gaadFilter :: Lens' GetAccountAuthorizationDetails [EntityType]
gaadFilter = lens _gaadFilter (\ s a -> s{_gaadFilter = a}) . _Default;

instance AWSRequest GetAccountAuthorizationDetails
         where
        type Sv GetAccountAuthorizationDetails = IAM
        type Rs GetAccountAuthorizationDetails =
             GetAccountAuthorizationDetailsResponse
        request = post
        response
          = receiveXMLWrapper
              "GetAccountAuthorizationDetailsResult"
              (\ s h x ->
                 GetAccountAuthorizationDetailsResponse' <$>
                   (x .@? "RoleDetailList" .!@ mempty >>=
                      may (parseXMLList "member"))
                     <*>
                     (x .@? "GroupDetailList" .!@ mempty >>=
                        may (parseXMLList "member"))
                     <*>
                     (x .@? "UserDetailList" .!@ mempty >>=
                        may (parseXMLList "member"))
                     <*> (x .@? "Marker")
                     <*> (x .@? "IsTruncated")
                     <*>
                     (x .@? "Policies" .!@ mempty >>=
                        may (parseXMLList "member"))
                     <*> (pure (fromEnum s)))

instance ToHeaders GetAccountAuthorizationDetails
         where
        toHeaders = const mempty

instance ToPath GetAccountAuthorizationDetails where
        toPath = const "/"

instance ToQuery GetAccountAuthorizationDetails where
        toQuery GetAccountAuthorizationDetails'{..}
          = mconcat
              ["Action" =:
                 ("GetAccountAuthorizationDetails" :: ByteString),
               "Version" =: ("2010-05-08" :: ByteString),
               "MaxItems" =: _gaadMaxItems, "Marker" =: _gaadMarker,
               "Filter" =:
                 toQuery (toQueryList "member" <$> _gaadFilter)]

-- | Contains the response to a successful GetAccountAuthorizationDetails
-- request.
--
-- /See:/ 'getAccountAuthorizationDetailsResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'gaadrRoleDetailList'
--
-- * 'gaadrGroupDetailList'
--
-- * 'gaadrUserDetailList'
--
-- * 'gaadrMarker'
--
-- * 'gaadrIsTruncated'
--
-- * 'gaadrPolicies'
--
-- * 'gaadrStatus'
data GetAccountAuthorizationDetailsResponse = GetAccountAuthorizationDetailsResponse'
    { _gaadrRoleDetailList  :: !(Maybe [RoleDetail])
    , _gaadrGroupDetailList :: !(Maybe [GroupDetail])
    , _gaadrUserDetailList  :: !(Maybe [UserDetail])
    , _gaadrMarker          :: !(Maybe Text)
    , _gaadrIsTruncated     :: !(Maybe Bool)
    , _gaadrPolicies        :: !(Maybe [ManagedPolicyDetail])
    , _gaadrStatus          :: !Int
    } deriving (Eq,Read,Show)

-- | 'GetAccountAuthorizationDetailsResponse' smart constructor.
getAccountAuthorizationDetailsResponse :: Int -> GetAccountAuthorizationDetailsResponse
getAccountAuthorizationDetailsResponse pStatus =
    GetAccountAuthorizationDetailsResponse'
    { _gaadrRoleDetailList = Nothing
    , _gaadrGroupDetailList = Nothing
    , _gaadrUserDetailList = Nothing
    , _gaadrMarker = Nothing
    , _gaadrIsTruncated = Nothing
    , _gaadrPolicies = Nothing
    , _gaadrStatus = pStatus
    }

-- | A list containing information about IAM roles.
gaadrRoleDetailList :: Lens' GetAccountAuthorizationDetailsResponse [RoleDetail]
gaadrRoleDetailList = lens _gaadrRoleDetailList (\ s a -> s{_gaadrRoleDetailList = a}) . _Default;

-- | A list containing information about IAM groups.
gaadrGroupDetailList :: Lens' GetAccountAuthorizationDetailsResponse [GroupDetail]
gaadrGroupDetailList = lens _gaadrGroupDetailList (\ s a -> s{_gaadrGroupDetailList = a}) . _Default;

-- | A list containing information about IAM users.
gaadrUserDetailList :: Lens' GetAccountAuthorizationDetailsResponse [UserDetail]
gaadrUserDetailList = lens _gaadrUserDetailList (\ s a -> s{_gaadrUserDetailList = a}) . _Default;

-- | If @IsTruncated@ is @true@, this element is present and contains the
-- value to use for the @Marker@ parameter in a subsequent pagination
-- request.
gaadrMarker :: Lens' GetAccountAuthorizationDetailsResponse (Maybe Text)
gaadrMarker = lens _gaadrMarker (\ s a -> s{_gaadrMarker = a});

-- | A flag that indicates whether there are more items to return. If your
-- results were truncated, you can make a subsequent pagination request
-- using the @Marker@ request parameter to retrieve more items.
gaadrIsTruncated :: Lens' GetAccountAuthorizationDetailsResponse (Maybe Bool)
gaadrIsTruncated = lens _gaadrIsTruncated (\ s a -> s{_gaadrIsTruncated = a});

-- | A list containing information about managed policies.
gaadrPolicies :: Lens' GetAccountAuthorizationDetailsResponse [ManagedPolicyDetail]
gaadrPolicies = lens _gaadrPolicies (\ s a -> s{_gaadrPolicies = a}) . _Default;

-- | FIXME: Undocumented member.
gaadrStatus :: Lens' GetAccountAuthorizationDetailsResponse Int
gaadrStatus = lens _gaadrStatus (\ s a -> s{_gaadrStatus = a});
