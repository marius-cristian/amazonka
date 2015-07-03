-- Module      : Test.AWS.Gen.ImportExport
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

module Test.AWS.Gen.ImportExport where

import Data.Proxy
import Test.AWS.Fixture
import Test.Tasty
import Network.AWS.ImportExport

-- Auto-generated: the actual test selection needs to be manually placed into
-- the top-level so that real test data can be incrementally added.
--
-- This commented snippet is what the entire set should look like:

-- fixtures :: TestTree
-- fixtures =
--     [ testGroup "request"
--         [ testGetShippingLabel $
--             getShippingLabel
--
--         , testCreateJob $
--             createJob
--
--         , testListJobs $
--             listJobs
--
--         , testUpdateJob $
--             updateJob
--
--         , testGetStatus $
--             getStatus
--
--         , testCancelJob $
--             cancelJob
--
--           ]

--     , testGroup "response"
--         [ testGetShippingLabelResponse $
--             getShippingLabelResponse
--
--         , testCreateJobResponse $
--             createJobResponse
--
--         , testListJobsResponse $
--             listJobsResponse
--
--         , testUpdateJobResponse $
--             updateJobResponse
--
--         , testGetStatusResponse $
--             getStatusResponse
--
--         , testCancelJobResponse $
--             cancelJobResponse
--
--           ]
--     ]

-- Requests

testGetShippingLabel :: GetShippingLabel -> TestTree
testGetShippingLabel = undefined

testCreateJob :: CreateJob -> TestTree
testCreateJob = undefined

testListJobs :: ListJobs -> TestTree
testListJobs = undefined

testUpdateJob :: UpdateJob -> TestTree
testUpdateJob = undefined

testGetStatus :: GetStatus -> TestTree
testGetStatus = undefined

testCancelJob :: CancelJob -> TestTree
testCancelJob = undefined

-- Responses

testGetShippingLabelResponse :: GetShippingLabelResponse -> TestTree
testGetShippingLabelResponse = resp
    "GetShippingLabelResponse"
    "fixture/GetShippingLabelResponse"
    (Proxy :: Proxy GetShippingLabel)

testCreateJobResponse :: CreateJobResponse -> TestTree
testCreateJobResponse = resp
    "CreateJobResponse"
    "fixture/CreateJobResponse"
    (Proxy :: Proxy CreateJob)

testListJobsResponse :: ListJobsResponse -> TestTree
testListJobsResponse = resp
    "ListJobsResponse"
    "fixture/ListJobsResponse"
    (Proxy :: Proxy ListJobs)

testUpdateJobResponse :: UpdateJobResponse -> TestTree
testUpdateJobResponse = resp
    "UpdateJobResponse"
    "fixture/UpdateJobResponse"
    (Proxy :: Proxy UpdateJob)

testGetStatusResponse :: GetStatusResponse -> TestTree
testGetStatusResponse = resp
    "GetStatusResponse"
    "fixture/GetStatusResponse"
    (Proxy :: Proxy GetStatus)

testCancelJobResponse :: CancelJobResponse -> TestTree
testCancelJobResponse = resp
    "CancelJobResponse"
    "fixture/CancelJobResponse"
    (Proxy :: Proxy CancelJob)
