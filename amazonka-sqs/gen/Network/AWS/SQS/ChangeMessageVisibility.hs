{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}

-- Module      : Network.AWS.SQS.ChangeMessageVisibility
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

-- | Changes the visibility timeout of a specified message in a queue to a
-- new value. The maximum allowed timeout value you can set the value to is
-- 12 hours. This means you can\'t extend the timeout of a message in an
-- existing queue to more than a total visibility timeout of 12 hours. (For
-- more information visibility timeout, see
-- <http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/AboutVT.html Visibility Timeout>
-- in the /Amazon SQS Developer Guide/.)
--
-- For example, let\'s say you have a message and its default message
-- visibility timeout is 30 minutes. You could call
-- @ChangeMessageVisiblity@ with a value of two hours and the effective
-- timeout would be two hours and 30 minutes. When that time comes near you
-- could again extend the time out by calling ChangeMessageVisiblity, but
-- this time the maximum allowed timeout would be 9 hours and 30 minutes.
--
-- There is a 120,000 limit for the number of inflight messages per queue.
-- Messages are inflight after they have been received from the queue by a
-- consuming component, but have not yet been deleted from the queue. If
-- you reach the 120,000 limit, you will receive an OverLimit error message
-- from Amazon SQS. To help avoid reaching the limit, you should delete the
-- messages from the queue after they have been processed. You can also
-- increase the number of queues you use to process the messages.
--
-- If you attempt to set the @VisibilityTimeout@ to an amount more than the
-- maximum time left, Amazon SQS returns an error. It will not
-- automatically recalculate and increase the timeout to the maximum time
-- remaining.
--
-- Unlike with a queue, when you change the visibility timeout for a
-- specific message, that timeout value is applied immediately but is not
-- saved in memory for that message. If you don\'t delete a message after
-- it is received, the visibility timeout for the message the next time it
-- is received reverts to the original timeout value, not the value you set
-- with the @ChangeMessageVisibility@ action.
--
-- <http://docs.aws.amazon.com/AWSSimpleQueueService/latest/APIReference/API_ChangeMessageVisibility.html>
module Network.AWS.SQS.ChangeMessageVisibility
    (
    -- * Request
      ChangeMessageVisibility
    -- ** Request constructor
    , changeMessageVisibility
    -- ** Request lenses
    , cmvQueueURL
    , cmvReceiptHandle
    , cmvVisibilityTimeout

    -- * Response
    , ChangeMessageVisibilityResponse
    -- ** Response constructor
    , changeMessageVisibilityResponse
    ) where

import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response
import           Network.AWS.SQS.Types

-- | /See:/ 'changeMessageVisibility' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'cmvQueueURL'
--
-- * 'cmvReceiptHandle'
--
-- * 'cmvVisibilityTimeout'
data ChangeMessageVisibility = ChangeMessageVisibility'
    { _cmvQueueURL          :: !Text
    , _cmvReceiptHandle     :: !Text
    , _cmvVisibilityTimeout :: !Int
    } deriving (Eq,Read,Show)

-- | 'ChangeMessageVisibility' smart constructor.
changeMessageVisibility :: Text -> Text -> Int -> ChangeMessageVisibility
changeMessageVisibility pQueueURL pReceiptHandle pVisibilityTimeout =
    ChangeMessageVisibility'
    { _cmvQueueURL = pQueueURL
    , _cmvReceiptHandle = pReceiptHandle
    , _cmvVisibilityTimeout = pVisibilityTimeout
    }

-- | The URL of the Amazon SQS queue to take action on.
cmvQueueURL :: Lens' ChangeMessageVisibility Text
cmvQueueURL = lens _cmvQueueURL (\ s a -> s{_cmvQueueURL = a});

-- | The receipt handle associated with the message whose visibility timeout
-- should be changed. This parameter is returned by the ReceiveMessage
-- action.
cmvReceiptHandle :: Lens' ChangeMessageVisibility Text
cmvReceiptHandle = lens _cmvReceiptHandle (\ s a -> s{_cmvReceiptHandle = a});

-- | The new value (in seconds - from 0 to 43200 - maximum 12 hours) for the
-- message\'s visibility timeout.
cmvVisibilityTimeout :: Lens' ChangeMessageVisibility Int
cmvVisibilityTimeout = lens _cmvVisibilityTimeout (\ s a -> s{_cmvVisibilityTimeout = a});

instance AWSRequest ChangeMessageVisibility where
        type Sv ChangeMessageVisibility = SQS
        type Rs ChangeMessageVisibility =
             ChangeMessageVisibilityResponse
        request = post
        response
          = receiveNull ChangeMessageVisibilityResponse'

instance ToHeaders ChangeMessageVisibility where
        toHeaders = const mempty

instance ToPath ChangeMessageVisibility where
        toPath = const "/"

instance ToQuery ChangeMessageVisibility where
        toQuery ChangeMessageVisibility'{..}
          = mconcat
              ["Action" =:
                 ("ChangeMessageVisibility" :: ByteString),
               "Version" =: ("2012-11-05" :: ByteString),
               "QueueUrl" =: _cmvQueueURL,
               "ReceiptHandle" =: _cmvReceiptHandle,
               "VisibilityTimeout" =: _cmvVisibilityTimeout]

-- | /See:/ 'changeMessageVisibilityResponse' smart constructor.
data ChangeMessageVisibilityResponse =
    ChangeMessageVisibilityResponse'
    deriving (Eq,Read,Show)

-- | 'ChangeMessageVisibilityResponse' smart constructor.
changeMessageVisibilityResponse :: ChangeMessageVisibilityResponse
changeMessageVisibilityResponse = ChangeMessageVisibilityResponse'
