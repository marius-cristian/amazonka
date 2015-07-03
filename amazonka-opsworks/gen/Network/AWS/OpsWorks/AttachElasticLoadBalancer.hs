{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}

-- Module      : Network.AWS.OpsWorks.AttachElasticLoadBalancer
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

-- | Attaches an Elastic Load Balancing load balancer to a specified layer.
-- For more information, see
-- <http://docs.aws.amazon.com/opsworks/latest/userguide/load-balancer-elb.html Elastic Load Balancing>.
--
-- You must create the Elastic Load Balancing instance separately, by using
-- the Elastic Load Balancing console, API, or CLI. For more information,
-- see
-- <http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/Welcome.html Elastic Load Balancing Developer Guide>.
--
-- __Required Permissions__: To use this action, an IAM user must have a
-- Manage permissions level for the stack, or an attached policy that
-- explicitly grants permissions. For more information on user permissions,
-- see
-- <http://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html Managing User Permissions>.
--
-- <http://docs.aws.amazon.com/opsworks/latest/APIReference/API_AttachElasticLoadBalancer.html>
module Network.AWS.OpsWorks.AttachElasticLoadBalancer
    (
    -- * Request
      AttachElasticLoadBalancer
    -- ** Request constructor
    , attachElasticLoadBalancer
    -- ** Request lenses
    , aelbElasticLoadBalancerName
    , aelbLayerId

    -- * Response
    , AttachElasticLoadBalancerResponse
    -- ** Response constructor
    , attachElasticLoadBalancerResponse
    ) where

import           Network.AWS.OpsWorks.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'attachElasticLoadBalancer' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'aelbElasticLoadBalancerName'
--
-- * 'aelbLayerId'
data AttachElasticLoadBalancer = AttachElasticLoadBalancer'
    { _aelbElasticLoadBalancerName :: !Text
    , _aelbLayerId                 :: !Text
    } deriving (Eq,Read,Show)

-- | 'AttachElasticLoadBalancer' smart constructor.
attachElasticLoadBalancer :: Text -> Text -> AttachElasticLoadBalancer
attachElasticLoadBalancer pElasticLoadBalancerName pLayerId =
    AttachElasticLoadBalancer'
    { _aelbElasticLoadBalancerName = pElasticLoadBalancerName
    , _aelbLayerId = pLayerId
    }

-- | The Elastic Load Balancing instance\'s name.
aelbElasticLoadBalancerName :: Lens' AttachElasticLoadBalancer Text
aelbElasticLoadBalancerName = lens _aelbElasticLoadBalancerName (\ s a -> s{_aelbElasticLoadBalancerName = a});

-- | The ID of the layer that the Elastic Load Balancing instance is to be
-- attached to.
aelbLayerId :: Lens' AttachElasticLoadBalancer Text
aelbLayerId = lens _aelbLayerId (\ s a -> s{_aelbLayerId = a});

instance AWSRequest AttachElasticLoadBalancer where
        type Sv AttachElasticLoadBalancer = OpsWorks
        type Rs AttachElasticLoadBalancer =
             AttachElasticLoadBalancerResponse
        request = postJSON
        response
          = receiveNull AttachElasticLoadBalancerResponse'

instance ToHeaders AttachElasticLoadBalancer where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("OpsWorks_20130218.AttachElasticLoadBalancer" ::
                       ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON AttachElasticLoadBalancer where
        toJSON AttachElasticLoadBalancer'{..}
          = object
              ["ElasticLoadBalancerName" .=
                 _aelbElasticLoadBalancerName,
               "LayerId" .= _aelbLayerId]

instance ToPath AttachElasticLoadBalancer where
        toPath = const "/"

instance ToQuery AttachElasticLoadBalancer where
        toQuery = const mempty

-- | /See:/ 'attachElasticLoadBalancerResponse' smart constructor.
data AttachElasticLoadBalancerResponse =
    AttachElasticLoadBalancerResponse'
    deriving (Eq,Read,Show)

-- | 'AttachElasticLoadBalancerResponse' smart constructor.
attachElasticLoadBalancerResponse :: AttachElasticLoadBalancerResponse
attachElasticLoadBalancerResponse = AttachElasticLoadBalancerResponse'
