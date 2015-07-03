-- Module      : Test.AWS.Gen.AutoScaling
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

module Test.AWS.Gen.AutoScaling where

import Data.Proxy
import Test.AWS.Fixture
import Test.Tasty
import Network.AWS.AutoScaling

-- Auto-generated: the actual test selection needs to be manually placed into
-- the top-level so that real test data can be incrementally added.
--
-- This commented snippet is what the entire set should look like:

-- fixtures :: TestTree
-- fixtures =
--     [ testGroup "request"
--         [ testDescribeMetricCollectionTypes $
--             describeMetricCollectionTypes
--
--         , testPutScalingPolicy $
--             putScalingPolicy
--
--         , testDeleteNotificationConfiguration $
--             deleteNotificationConfiguration
--
--         , testDescribeTags $
--             describeTags
--
--         , testDeleteLaunchConfiguration $
--             deleteLaunchConfiguration
--
--         , testDescribeLoadBalancers $
--             describeLoadBalancers
--
--         , testPutNotificationConfiguration $
--             putNotificationConfiguration
--
--         , testSetInstanceHealth $
--             setInstanceHealth
--
--         , testEnterStandby $
--             enterStandby
--
--         , testSuspendProcesses $
--             suspendProcesses
--
--         , testExitStandby $
--             exitStandby
--
--         , testDescribeTerminationPolicyTypes $
--             describeTerminationPolicyTypes
--
--         , testDescribeAutoScalingInstances $
--             describeAutoScalingInstances
--
--         , testDetachInstances $
--             detachInstances
--
--         , testDisableMetricsCollection $
--             disableMetricsCollection
--
--         , testRecordLifecycleActionHeartbeat $
--             recordLifecycleActionHeartbeat
--
--         , testDeleteTags $
--             deleteTags
--
--         , testDescribeScalingProcessTypes $
--             describeScalingProcessTypes
--
--         , testEnableMetricsCollection $
--             enableMetricsCollection
--
--         , testDescribeLifecycleHooks $
--             describeLifecycleHooks
--
--         , testDescribeAutoScalingGroups $
--             describeAutoScalingGroups
--
--         , testSetDesiredCapacity $
--             setDesiredCapacity
--
--         , testDetachLoadBalancers $
--             detachLoadBalancers
--
--         , testDeleteScheduledAction $
--             deleteScheduledAction
--
--         , testCreateOrUpdateTags $
--             createOrUpdateTags
--
--         , testDeletePolicy $
--             deletePolicy
--
--         , testDescribeAutoScalingNotificationTypes $
--             describeAutoScalingNotificationTypes
--
--         , testCompleteLifecycleAction $
--             completeLifecycleAction
--
--         , testAttachInstances $
--             attachInstances
--
--         , testDescribeScheduledActions $
--             describeScheduledActions
--
--         , testDeleteAutoScalingGroup $
--             deleteAutoScalingGroup
--
--         , testPutLifecycleHook $
--             putLifecycleHook
--
--         , testUpdateAutoScalingGroup $
--             updateAutoScalingGroup
--
--         , testDeleteLifecycleHook $
--             deleteLifecycleHook
--
--         , testResumeProcesses $
--             resumeProcesses
--
--         , testExecutePolicy $
--             executePolicy
--
--         , testTerminateInstanceInAutoScalingGroup $
--             terminateInstanceInAutoScalingGroup
--
--         , testDescribeAccountLimits $
--             describeAccountLimits
--
--         , testAttachLoadBalancers $
--             attachLoadBalancers
--
--         , testPutScheduledUpdateGroupAction $
--             putScheduledUpdateGroupAction
--
--         , testDescribePolicies $
--             describePolicies
--
--         , testDescribeNotificationConfigurations $
--             describeNotificationConfigurations
--
--         , testDescribeLaunchConfigurations $
--             describeLaunchConfigurations
--
--         , testDescribeLifecycleHookTypes $
--             describeLifecycleHookTypes
--
--         , testDescribeScalingActivities $
--             describeScalingActivities
--
--         , testCreateAutoScalingGroup $
--             createAutoScalingGroup
--
--         , testCreateLaunchConfiguration $
--             createLaunchConfiguration
--
--         , testDescribeAdjustmentTypes $
--             describeAdjustmentTypes
--
--           ]

--     , testGroup "response"
--         [ testDescribeMetricCollectionTypesResponse $
--             describeMetricCollectionTypesResponse
--
--         , testPutScalingPolicyResponse $
--             putScalingPolicyResponse
--
--         , testDeleteNotificationConfigurationResponse $
--             deleteNotificationConfigurationResponse
--
--         , testDescribeTagsResponse $
--             describeTagsResponse
--
--         , testDeleteLaunchConfigurationResponse $
--             deleteLaunchConfigurationResponse
--
--         , testDescribeLoadBalancersResponse $
--             describeLoadBalancersResponse
--
--         , testPutNotificationConfigurationResponse $
--             putNotificationConfigurationResponse
--
--         , testSetInstanceHealthResponse $
--             setInstanceHealthResponse
--
--         , testEnterStandbyResponse $
--             enterStandbyResponse
--
--         , testSuspendProcessesResponse $
--             suspendProcessesResponse
--
--         , testExitStandbyResponse $
--             exitStandbyResponse
--
--         , testDescribeTerminationPolicyTypesResponse $
--             describeTerminationPolicyTypesResponse
--
--         , testDescribeAutoScalingInstancesResponse $
--             describeAutoScalingInstancesResponse
--
--         , testDetachInstancesResponse $
--             detachInstancesResponse
--
--         , testDisableMetricsCollectionResponse $
--             disableMetricsCollectionResponse
--
--         , testRecordLifecycleActionHeartbeatResponse $
--             recordLifecycleActionHeartbeatResponse
--
--         , testDeleteTagsResponse $
--             deleteTagsResponse
--
--         , testDescribeScalingProcessTypesResponse $
--             describeScalingProcessTypesResponse
--
--         , testEnableMetricsCollectionResponse $
--             enableMetricsCollectionResponse
--
--         , testDescribeLifecycleHooksResponse $
--             describeLifecycleHooksResponse
--
--         , testDescribeAutoScalingGroupsResponse $
--             describeAutoScalingGroupsResponse
--
--         , testSetDesiredCapacityResponse $
--             setDesiredCapacityResponse
--
--         , testDetachLoadBalancersResponse $
--             detachLoadBalancersResponse
--
--         , testDeleteScheduledActionResponse $
--             deleteScheduledActionResponse
--
--         , testCreateOrUpdateTagsResponse $
--             createOrUpdateTagsResponse
--
--         , testDeletePolicyResponse $
--             deletePolicyResponse
--
--         , testDescribeAutoScalingNotificationTypesResponse $
--             describeAutoScalingNotificationTypesResponse
--
--         , testCompleteLifecycleActionResponse $
--             completeLifecycleActionResponse
--
--         , testAttachInstancesResponse $
--             attachInstancesResponse
--
--         , testDescribeScheduledActionsResponse $
--             describeScheduledActionsResponse
--
--         , testDeleteAutoScalingGroupResponse $
--             deleteAutoScalingGroupResponse
--
--         , testPutLifecycleHookResponse $
--             putLifecycleHookResponse
--
--         , testUpdateAutoScalingGroupResponse $
--             updateAutoScalingGroupResponse
--
--         , testDeleteLifecycleHookResponse $
--             deleteLifecycleHookResponse
--
--         , testResumeProcessesResponse $
--             resumeProcessesResponse
--
--         , testExecutePolicyResponse $
--             executePolicyResponse
--
--         , testTerminateInstanceInAutoScalingGroupResponse $
--             terminateInstanceInAutoScalingGroupResponse
--
--         , testDescribeAccountLimitsResponse $
--             describeAccountLimitsResponse
--
--         , testAttachLoadBalancersResponse $
--             attachLoadBalancersResponse
--
--         , testPutScheduledUpdateGroupActionResponse $
--             putScheduledUpdateGroupActionResponse
--
--         , testDescribePoliciesResponse $
--             describePoliciesResponse
--
--         , testDescribeNotificationConfigurationsResponse $
--             describeNotificationConfigurationsResponse
--
--         , testDescribeLaunchConfigurationsResponse $
--             describeLaunchConfigurationsResponse
--
--         , testDescribeLifecycleHookTypesResponse $
--             describeLifecycleHookTypesResponse
--
--         , testDescribeScalingActivitiesResponse $
--             describeScalingActivitiesResponse
--
--         , testCreateAutoScalingGroupResponse $
--             createAutoScalingGroupResponse
--
--         , testCreateLaunchConfigurationResponse $
--             createLaunchConfigurationResponse
--
--         , testDescribeAdjustmentTypesResponse $
--             describeAdjustmentTypesResponse
--
--           ]
--     ]

-- Requests

testDescribeMetricCollectionTypes :: DescribeMetricCollectionTypes -> TestTree
testDescribeMetricCollectionTypes = undefined

testPutScalingPolicy :: PutScalingPolicy -> TestTree
testPutScalingPolicy = undefined

testDeleteNotificationConfiguration :: DeleteNotificationConfiguration -> TestTree
testDeleteNotificationConfiguration = undefined

testDescribeTags :: DescribeTags -> TestTree
testDescribeTags = undefined

testDeleteLaunchConfiguration :: DeleteLaunchConfiguration -> TestTree
testDeleteLaunchConfiguration = undefined

testDescribeLoadBalancers :: DescribeLoadBalancers -> TestTree
testDescribeLoadBalancers = undefined

testPutNotificationConfiguration :: PutNotificationConfiguration -> TestTree
testPutNotificationConfiguration = undefined

testSetInstanceHealth :: SetInstanceHealth -> TestTree
testSetInstanceHealth = undefined

testEnterStandby :: EnterStandby -> TestTree
testEnterStandby = undefined

testSuspendProcesses :: SuspendProcesses -> TestTree
testSuspendProcesses = undefined

testExitStandby :: ExitStandby -> TestTree
testExitStandby = undefined

testDescribeTerminationPolicyTypes :: DescribeTerminationPolicyTypes -> TestTree
testDescribeTerminationPolicyTypes = undefined

testDescribeAutoScalingInstances :: DescribeAutoScalingInstances -> TestTree
testDescribeAutoScalingInstances = undefined

testDetachInstances :: DetachInstances -> TestTree
testDetachInstances = undefined

testDisableMetricsCollection :: DisableMetricsCollection -> TestTree
testDisableMetricsCollection = undefined

testRecordLifecycleActionHeartbeat :: RecordLifecycleActionHeartbeat -> TestTree
testRecordLifecycleActionHeartbeat = undefined

testDeleteTags :: DeleteTags -> TestTree
testDeleteTags = undefined

testDescribeScalingProcessTypes :: DescribeScalingProcessTypes -> TestTree
testDescribeScalingProcessTypes = undefined

testEnableMetricsCollection :: EnableMetricsCollection -> TestTree
testEnableMetricsCollection = undefined

testDescribeLifecycleHooks :: DescribeLifecycleHooks -> TestTree
testDescribeLifecycleHooks = undefined

testDescribeAutoScalingGroups :: DescribeAutoScalingGroups -> TestTree
testDescribeAutoScalingGroups = undefined

testSetDesiredCapacity :: SetDesiredCapacity -> TestTree
testSetDesiredCapacity = undefined

testDetachLoadBalancers :: DetachLoadBalancers -> TestTree
testDetachLoadBalancers = undefined

testDeleteScheduledAction :: DeleteScheduledAction -> TestTree
testDeleteScheduledAction = undefined

testCreateOrUpdateTags :: CreateOrUpdateTags -> TestTree
testCreateOrUpdateTags = undefined

testDeletePolicy :: DeletePolicy -> TestTree
testDeletePolicy = undefined

testDescribeAutoScalingNotificationTypes :: DescribeAutoScalingNotificationTypes -> TestTree
testDescribeAutoScalingNotificationTypes = undefined

testCompleteLifecycleAction :: CompleteLifecycleAction -> TestTree
testCompleteLifecycleAction = undefined

testAttachInstances :: AttachInstances -> TestTree
testAttachInstances = undefined

testDescribeScheduledActions :: DescribeScheduledActions -> TestTree
testDescribeScheduledActions = undefined

testDeleteAutoScalingGroup :: DeleteAutoScalingGroup -> TestTree
testDeleteAutoScalingGroup = undefined

testPutLifecycleHook :: PutLifecycleHook -> TestTree
testPutLifecycleHook = undefined

testUpdateAutoScalingGroup :: UpdateAutoScalingGroup -> TestTree
testUpdateAutoScalingGroup = undefined

testDeleteLifecycleHook :: DeleteLifecycleHook -> TestTree
testDeleteLifecycleHook = undefined

testResumeProcesses :: ResumeProcesses -> TestTree
testResumeProcesses = undefined

testExecutePolicy :: ExecutePolicy -> TestTree
testExecutePolicy = undefined

testTerminateInstanceInAutoScalingGroup :: TerminateInstanceInAutoScalingGroup -> TestTree
testTerminateInstanceInAutoScalingGroup = undefined

testDescribeAccountLimits :: DescribeAccountLimits -> TestTree
testDescribeAccountLimits = undefined

testAttachLoadBalancers :: AttachLoadBalancers -> TestTree
testAttachLoadBalancers = undefined

testPutScheduledUpdateGroupAction :: PutScheduledUpdateGroupAction -> TestTree
testPutScheduledUpdateGroupAction = undefined

testDescribePolicies :: DescribePolicies -> TestTree
testDescribePolicies = undefined

testDescribeNotificationConfigurations :: DescribeNotificationConfigurations -> TestTree
testDescribeNotificationConfigurations = undefined

testDescribeLaunchConfigurations :: DescribeLaunchConfigurations -> TestTree
testDescribeLaunchConfigurations = undefined

testDescribeLifecycleHookTypes :: DescribeLifecycleHookTypes -> TestTree
testDescribeLifecycleHookTypes = undefined

testDescribeScalingActivities :: DescribeScalingActivities -> TestTree
testDescribeScalingActivities = undefined

testCreateAutoScalingGroup :: CreateAutoScalingGroup -> TestTree
testCreateAutoScalingGroup = undefined

testCreateLaunchConfiguration :: CreateLaunchConfiguration -> TestTree
testCreateLaunchConfiguration = undefined

testDescribeAdjustmentTypes :: DescribeAdjustmentTypes -> TestTree
testDescribeAdjustmentTypes = undefined

-- Responses

testDescribeMetricCollectionTypesResponse :: DescribeMetricCollectionTypesResponse -> TestTree
testDescribeMetricCollectionTypesResponse = resp
    "DescribeMetricCollectionTypesResponse"
    "fixture/DescribeMetricCollectionTypesResponse"
    (Proxy :: Proxy DescribeMetricCollectionTypes)

testPutScalingPolicyResponse :: PutScalingPolicyResponse -> TestTree
testPutScalingPolicyResponse = resp
    "PutScalingPolicyResponse"
    "fixture/PutScalingPolicyResponse"
    (Proxy :: Proxy PutScalingPolicy)

testDeleteNotificationConfigurationResponse :: DeleteNotificationConfigurationResponse -> TestTree
testDeleteNotificationConfigurationResponse = resp
    "DeleteNotificationConfigurationResponse"
    "fixture/DeleteNotificationConfigurationResponse"
    (Proxy :: Proxy DeleteNotificationConfiguration)

testDescribeTagsResponse :: DescribeTagsResponse -> TestTree
testDescribeTagsResponse = resp
    "DescribeTagsResponse"
    "fixture/DescribeTagsResponse"
    (Proxy :: Proxy DescribeTags)

testDeleteLaunchConfigurationResponse :: DeleteLaunchConfigurationResponse -> TestTree
testDeleteLaunchConfigurationResponse = resp
    "DeleteLaunchConfigurationResponse"
    "fixture/DeleteLaunchConfigurationResponse"
    (Proxy :: Proxy DeleteLaunchConfiguration)

testDescribeLoadBalancersResponse :: DescribeLoadBalancersResponse -> TestTree
testDescribeLoadBalancersResponse = resp
    "DescribeLoadBalancersResponse"
    "fixture/DescribeLoadBalancersResponse"
    (Proxy :: Proxy DescribeLoadBalancers)

testPutNotificationConfigurationResponse :: PutNotificationConfigurationResponse -> TestTree
testPutNotificationConfigurationResponse = resp
    "PutNotificationConfigurationResponse"
    "fixture/PutNotificationConfigurationResponse"
    (Proxy :: Proxy PutNotificationConfiguration)

testSetInstanceHealthResponse :: SetInstanceHealthResponse -> TestTree
testSetInstanceHealthResponse = resp
    "SetInstanceHealthResponse"
    "fixture/SetInstanceHealthResponse"
    (Proxy :: Proxy SetInstanceHealth)

testEnterStandbyResponse :: EnterStandbyResponse -> TestTree
testEnterStandbyResponse = resp
    "EnterStandbyResponse"
    "fixture/EnterStandbyResponse"
    (Proxy :: Proxy EnterStandby)

testSuspendProcessesResponse :: SuspendProcessesResponse -> TestTree
testSuspendProcessesResponse = resp
    "SuspendProcessesResponse"
    "fixture/SuspendProcessesResponse"
    (Proxy :: Proxy SuspendProcesses)

testExitStandbyResponse :: ExitStandbyResponse -> TestTree
testExitStandbyResponse = resp
    "ExitStandbyResponse"
    "fixture/ExitStandbyResponse"
    (Proxy :: Proxy ExitStandby)

testDescribeTerminationPolicyTypesResponse :: DescribeTerminationPolicyTypesResponse -> TestTree
testDescribeTerminationPolicyTypesResponse = resp
    "DescribeTerminationPolicyTypesResponse"
    "fixture/DescribeTerminationPolicyTypesResponse"
    (Proxy :: Proxy DescribeTerminationPolicyTypes)

testDescribeAutoScalingInstancesResponse :: DescribeAutoScalingInstancesResponse -> TestTree
testDescribeAutoScalingInstancesResponse = resp
    "DescribeAutoScalingInstancesResponse"
    "fixture/DescribeAutoScalingInstancesResponse"
    (Proxy :: Proxy DescribeAutoScalingInstances)

testDetachInstancesResponse :: DetachInstancesResponse -> TestTree
testDetachInstancesResponse = resp
    "DetachInstancesResponse"
    "fixture/DetachInstancesResponse"
    (Proxy :: Proxy DetachInstances)

testDisableMetricsCollectionResponse :: DisableMetricsCollectionResponse -> TestTree
testDisableMetricsCollectionResponse = resp
    "DisableMetricsCollectionResponse"
    "fixture/DisableMetricsCollectionResponse"
    (Proxy :: Proxy DisableMetricsCollection)

testRecordLifecycleActionHeartbeatResponse :: RecordLifecycleActionHeartbeatResponse -> TestTree
testRecordLifecycleActionHeartbeatResponse = resp
    "RecordLifecycleActionHeartbeatResponse"
    "fixture/RecordLifecycleActionHeartbeatResponse"
    (Proxy :: Proxy RecordLifecycleActionHeartbeat)

testDeleteTagsResponse :: DeleteTagsResponse -> TestTree
testDeleteTagsResponse = resp
    "DeleteTagsResponse"
    "fixture/DeleteTagsResponse"
    (Proxy :: Proxy DeleteTags)

testDescribeScalingProcessTypesResponse :: DescribeScalingProcessTypesResponse -> TestTree
testDescribeScalingProcessTypesResponse = resp
    "DescribeScalingProcessTypesResponse"
    "fixture/DescribeScalingProcessTypesResponse"
    (Proxy :: Proxy DescribeScalingProcessTypes)

testEnableMetricsCollectionResponse :: EnableMetricsCollectionResponse -> TestTree
testEnableMetricsCollectionResponse = resp
    "EnableMetricsCollectionResponse"
    "fixture/EnableMetricsCollectionResponse"
    (Proxy :: Proxy EnableMetricsCollection)

testDescribeLifecycleHooksResponse :: DescribeLifecycleHooksResponse -> TestTree
testDescribeLifecycleHooksResponse = resp
    "DescribeLifecycleHooksResponse"
    "fixture/DescribeLifecycleHooksResponse"
    (Proxy :: Proxy DescribeLifecycleHooks)

testDescribeAutoScalingGroupsResponse :: DescribeAutoScalingGroupsResponse -> TestTree
testDescribeAutoScalingGroupsResponse = resp
    "DescribeAutoScalingGroupsResponse"
    "fixture/DescribeAutoScalingGroupsResponse"
    (Proxy :: Proxy DescribeAutoScalingGroups)

testSetDesiredCapacityResponse :: SetDesiredCapacityResponse -> TestTree
testSetDesiredCapacityResponse = resp
    "SetDesiredCapacityResponse"
    "fixture/SetDesiredCapacityResponse"
    (Proxy :: Proxy SetDesiredCapacity)

testDetachLoadBalancersResponse :: DetachLoadBalancersResponse -> TestTree
testDetachLoadBalancersResponse = resp
    "DetachLoadBalancersResponse"
    "fixture/DetachLoadBalancersResponse"
    (Proxy :: Proxy DetachLoadBalancers)

testDeleteScheduledActionResponse :: DeleteScheduledActionResponse -> TestTree
testDeleteScheduledActionResponse = resp
    "DeleteScheduledActionResponse"
    "fixture/DeleteScheduledActionResponse"
    (Proxy :: Proxy DeleteScheduledAction)

testCreateOrUpdateTagsResponse :: CreateOrUpdateTagsResponse -> TestTree
testCreateOrUpdateTagsResponse = resp
    "CreateOrUpdateTagsResponse"
    "fixture/CreateOrUpdateTagsResponse"
    (Proxy :: Proxy CreateOrUpdateTags)

testDeletePolicyResponse :: DeletePolicyResponse -> TestTree
testDeletePolicyResponse = resp
    "DeletePolicyResponse"
    "fixture/DeletePolicyResponse"
    (Proxy :: Proxy DeletePolicy)

testDescribeAutoScalingNotificationTypesResponse :: DescribeAutoScalingNotificationTypesResponse -> TestTree
testDescribeAutoScalingNotificationTypesResponse = resp
    "DescribeAutoScalingNotificationTypesResponse"
    "fixture/DescribeAutoScalingNotificationTypesResponse"
    (Proxy :: Proxy DescribeAutoScalingNotificationTypes)

testCompleteLifecycleActionResponse :: CompleteLifecycleActionResponse -> TestTree
testCompleteLifecycleActionResponse = resp
    "CompleteLifecycleActionResponse"
    "fixture/CompleteLifecycleActionResponse"
    (Proxy :: Proxy CompleteLifecycleAction)

testAttachInstancesResponse :: AttachInstancesResponse -> TestTree
testAttachInstancesResponse = resp
    "AttachInstancesResponse"
    "fixture/AttachInstancesResponse"
    (Proxy :: Proxy AttachInstances)

testDescribeScheduledActionsResponse :: DescribeScheduledActionsResponse -> TestTree
testDescribeScheduledActionsResponse = resp
    "DescribeScheduledActionsResponse"
    "fixture/DescribeScheduledActionsResponse"
    (Proxy :: Proxy DescribeScheduledActions)

testDeleteAutoScalingGroupResponse :: DeleteAutoScalingGroupResponse -> TestTree
testDeleteAutoScalingGroupResponse = resp
    "DeleteAutoScalingGroupResponse"
    "fixture/DeleteAutoScalingGroupResponse"
    (Proxy :: Proxy DeleteAutoScalingGroup)

testPutLifecycleHookResponse :: PutLifecycleHookResponse -> TestTree
testPutLifecycleHookResponse = resp
    "PutLifecycleHookResponse"
    "fixture/PutLifecycleHookResponse"
    (Proxy :: Proxy PutLifecycleHook)

testUpdateAutoScalingGroupResponse :: UpdateAutoScalingGroupResponse -> TestTree
testUpdateAutoScalingGroupResponse = resp
    "UpdateAutoScalingGroupResponse"
    "fixture/UpdateAutoScalingGroupResponse"
    (Proxy :: Proxy UpdateAutoScalingGroup)

testDeleteLifecycleHookResponse :: DeleteLifecycleHookResponse -> TestTree
testDeleteLifecycleHookResponse = resp
    "DeleteLifecycleHookResponse"
    "fixture/DeleteLifecycleHookResponse"
    (Proxy :: Proxy DeleteLifecycleHook)

testResumeProcessesResponse :: ResumeProcessesResponse -> TestTree
testResumeProcessesResponse = resp
    "ResumeProcessesResponse"
    "fixture/ResumeProcessesResponse"
    (Proxy :: Proxy ResumeProcesses)

testExecutePolicyResponse :: ExecutePolicyResponse -> TestTree
testExecutePolicyResponse = resp
    "ExecutePolicyResponse"
    "fixture/ExecutePolicyResponse"
    (Proxy :: Proxy ExecutePolicy)

testTerminateInstanceInAutoScalingGroupResponse :: TerminateInstanceInAutoScalingGroupResponse -> TestTree
testTerminateInstanceInAutoScalingGroupResponse = resp
    "TerminateInstanceInAutoScalingGroupResponse"
    "fixture/TerminateInstanceInAutoScalingGroupResponse"
    (Proxy :: Proxy TerminateInstanceInAutoScalingGroup)

testDescribeAccountLimitsResponse :: DescribeAccountLimitsResponse -> TestTree
testDescribeAccountLimitsResponse = resp
    "DescribeAccountLimitsResponse"
    "fixture/DescribeAccountLimitsResponse"
    (Proxy :: Proxy DescribeAccountLimits)

testAttachLoadBalancersResponse :: AttachLoadBalancersResponse -> TestTree
testAttachLoadBalancersResponse = resp
    "AttachLoadBalancersResponse"
    "fixture/AttachLoadBalancersResponse"
    (Proxy :: Proxy AttachLoadBalancers)

testPutScheduledUpdateGroupActionResponse :: PutScheduledUpdateGroupActionResponse -> TestTree
testPutScheduledUpdateGroupActionResponse = resp
    "PutScheduledUpdateGroupActionResponse"
    "fixture/PutScheduledUpdateGroupActionResponse"
    (Proxy :: Proxy PutScheduledUpdateGroupAction)

testDescribePoliciesResponse :: DescribePoliciesResponse -> TestTree
testDescribePoliciesResponse = resp
    "DescribePoliciesResponse"
    "fixture/DescribePoliciesResponse"
    (Proxy :: Proxy DescribePolicies)

testDescribeNotificationConfigurationsResponse :: DescribeNotificationConfigurationsResponse -> TestTree
testDescribeNotificationConfigurationsResponse = resp
    "DescribeNotificationConfigurationsResponse"
    "fixture/DescribeNotificationConfigurationsResponse"
    (Proxy :: Proxy DescribeNotificationConfigurations)

testDescribeLaunchConfigurationsResponse :: DescribeLaunchConfigurationsResponse -> TestTree
testDescribeLaunchConfigurationsResponse = resp
    "DescribeLaunchConfigurationsResponse"
    "fixture/DescribeLaunchConfigurationsResponse"
    (Proxy :: Proxy DescribeLaunchConfigurations)

testDescribeLifecycleHookTypesResponse :: DescribeLifecycleHookTypesResponse -> TestTree
testDescribeLifecycleHookTypesResponse = resp
    "DescribeLifecycleHookTypesResponse"
    "fixture/DescribeLifecycleHookTypesResponse"
    (Proxy :: Proxy DescribeLifecycleHookTypes)

testDescribeScalingActivitiesResponse :: DescribeScalingActivitiesResponse -> TestTree
testDescribeScalingActivitiesResponse = resp
    "DescribeScalingActivitiesResponse"
    "fixture/DescribeScalingActivitiesResponse"
    (Proxy :: Proxy DescribeScalingActivities)

testCreateAutoScalingGroupResponse :: CreateAutoScalingGroupResponse -> TestTree
testCreateAutoScalingGroupResponse = resp
    "CreateAutoScalingGroupResponse"
    "fixture/CreateAutoScalingGroupResponse"
    (Proxy :: Proxy CreateAutoScalingGroup)

testCreateLaunchConfigurationResponse :: CreateLaunchConfigurationResponse -> TestTree
testCreateLaunchConfigurationResponse = resp
    "CreateLaunchConfigurationResponse"
    "fixture/CreateLaunchConfigurationResponse"
    (Proxy :: Proxy CreateLaunchConfiguration)

testDescribeAdjustmentTypesResponse :: DescribeAdjustmentTypesResponse -> TestTree
testDescribeAdjustmentTypesResponse = resp
    "DescribeAdjustmentTypesResponse"
    "fixture/DescribeAdjustmentTypesResponse"
    (Proxy :: Proxy DescribeAdjustmentTypes)
