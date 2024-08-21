---
external help file: PSAppDeployToolkit-help.xml
Module Name: PSAppDeployToolkit
online version: https://psappdeploytoolkit.com
schema: 2.0.0
---

# Invoke-ADTFunctionErrorHandler

## SYNOPSIS
Handles errors within ADT functions by logging and optionally passing through the error.

## SYNTAX

### None (Default)
```
Invoke-ADTFunctionErrorHandler -Cmdlet <PSCmdlet> -SessionState <SessionState> -ErrorRecord <ErrorRecord>
 [-PassThru] [<CommonParameters>]
```

### LogMessage
```
Invoke-ADTFunctionErrorHandler -Cmdlet <PSCmdlet> -SessionState <SessionState> -ErrorRecord <ErrorRecord>
 [-PassThru] -LogMessage <String> [-DisableErrorResolving] [<CommonParameters>]
```

## DESCRIPTION
This function handles errors within ADT functions by logging the error message and optionally passing through the error record.
It recovers the true ErrorActionPreference set by the caller and sets it within the function.
If a log message is provided, it appends the resolved error record to the log message.
Depending on the ErrorActionPreference, it either throws a terminating error or writes a non-terminating error.

## EXAMPLES

### EXAMPLE 1
```
Invoke-ADTFunctionErrorHandler -Cmdlet $PSCmdlet -SessionState $ExecutionContext.SessionState -ErrorRecord $_
```

Handles the error within the calling cmdlet and logs it.

### EXAMPLE 2
```
Invoke-ADTFunctionErrorHandler -Cmdlet $PSCmdlet -SessionState $ExecutionContext.SessionState -ErrorRecord $_ -LogMessage "An error occurred" -DisableErrorResolving
```

Handles the error within the calling cmdlet, logs a custom message without resolving the error record, and logs it.

## PARAMETERS

### -Cmdlet
The cmdlet that is calling this function.

```yaml
Type: PSCmdlet
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SessionState
The session state of the calling cmdlet.

```yaml
Type: SessionState
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ErrorRecord
The error record to handle.

```yaml
Type: ErrorRecord
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PassThru
If specified, the function will return the error record.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -LogMessage
The error message to write to the active ADTSession's log file.

```yaml
Type: String
Parameter Sets: LogMessage
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DisableErrorResolving
If specified, the function will not append the resolved error record to the log message.

```yaml
Type: SwitchParameter
Parameter Sets: LogMessage
Aliases:

Required: False
Position: Named
Default value: False
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

### System.Management.Automation.ErrorRecord
### Returns the error record if PassThru is specified.
## NOTES
An active ADT session is NOT required to use this function.

Tags: psadt
Website: https://psappdeploytoolkit.com
Copyright: (c) 2024 PSAppDeployToolkit Team, licensed under LGPLv3
License: https://opensource.org/license/lgpl-3-0

## RELATED LINKS

[https://psappdeploytoolkit.com](https://psappdeploytoolkit.com)
