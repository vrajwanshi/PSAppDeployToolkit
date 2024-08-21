---
external help file: PSAppDeployToolkit-help.xml
Module Name: PSAppDeployToolkit
online version: https://psappdeploytoolkit.com
schema: 2.0.0
---

# Invoke-ADTSCCMTask

## SYNOPSIS
Triggers SCCM to invoke the requested schedule task ID.

## SYNTAX

```
Invoke-ADTSCCMTask [-ScheduleID] <String> [<CommonParameters>]
```

## DESCRIPTION
Triggers SCCM to invoke the requested schedule task ID.
This function supports a variety of schedule IDs compatible with different versions of the SCCM client.
It ensures that the correct schedule IDs are used based on the SCCM client version.

## EXAMPLES

### EXAMPLE 1
```
Invoke-ADTSCCMTask -ScheduleId 'SoftwareUpdatesScan'
```

Triggers the 'SoftwareUpdatesScan' schedule task in SCCM.

### EXAMPLE 2
```
Invoke-ADTSCCMTask -ScheduleId 'HardwareInventory'
```

Triggers the 'HardwareInventory' schedule task in SCCM.

## PARAMETERS

### -ScheduleID
Name of the schedule id to trigger.

Options: HardwareInventory, SoftwareInventory, HeartbeatDiscovery, SoftwareInventoryFileCollection, RequestMachinePolicy, EvaluateMachinePolicy, LocationServicesCleanup, SoftwareMeteringReport, SourceUpdate, PolicyAgentCleanup, RequestMachinePolicy2, CertificateMaintenance, PeerDistributionPointStatus, PeerDistributionPointProvisioning, ComplianceIntervalEnforcement, SoftwareUpdatesAgentAssignmentEvaluation, UploadStateMessage, StateMessageManager, SoftwareUpdatesScan, AMTProvisionCycle, UpdateStorePolicy, StateSystemBulkSend, ApplicationManagerPolicyAction, PowerManagementStartSummarizer

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None
### You cannot pipe objects to this function.
## OUTPUTS

### None
### This function does not return any objects.
## NOTES
An active ADT session is NOT required to use this function.

Tags: psadt
Website: https://psappdeploytoolkit.com
Copyright: (c) 2024 PSAppDeployToolkit Team, licensed under LGPLv3
License: https://opensource.org/license/lgpl-3-0

## RELATED LINKS

[https://psappdeploytoolkit.com](https://psappdeploytoolkit.com)
