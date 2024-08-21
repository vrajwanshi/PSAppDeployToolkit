---
external help file: PSAppDeployToolkit-help.xml
Module Name: PSAppDeployToolkit
online version: https://psappdeploytoolkit.com
schema: 2.0.0
---

# Set-ADTServiceStartMode

## SYNOPSIS
Set the service startup mode.

## SYNTAX

```
Set-ADTServiceStartMode [-Service] <ServiceController> [-StartMode] <String> [<CommonParameters>]
```

## DESCRIPTION
Set the service startup mode.
This function allows you to configure the startup mode of a specified service.
The startup modes available are: Automatic, Automatic (Delayed Start), Manual, Disabled, Boot, and System.

## EXAMPLES

### EXAMPLE 1
```
Set-ADTServiceStartMode -Service 'wuauserv' -StartMode 'Automatic (Delayed Start)'
```

Sets the 'wuauserv' service to start automatically with a delayed start.

## PARAMETERS

### -Service
Specify the name of the service.

```yaml
Type: ServiceController
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -StartMode
Specify startup mode for the service.
Options: Automatic, Automatic (Delayed Start), Manual, Disabled, Boot, System.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
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
### This function does not return any output.
## NOTES
An active ADT session is NOT required to use this function.

Tags: psadt
Website: https://psappdeploytoolkit.com
Copyright: (c) 2024 PSAppDeployToolkit Team, licensed under LGPLv3
License: https://opensource.org/license/lgpl-3-0

## RELATED LINKS

[https://psappdeploytoolkit.com](https://psappdeploytoolkit.com)
