---
external help file: PSAppDeployToolkit-help.xml
Module Name: PSAppDeployToolkit
online version: https://psappdeploytoolkit.com
schema: 2.0.0
---

# Set-ADTPowerShellCulture

## SYNOPSIS
Changes the current thread's Culture and UICulture to the specified culture.

## SYNTAX

```
Set-ADTPowerShellCulture [-CultureInfo] <CultureInfo> [<CommonParameters>]
```

## DESCRIPTION
This function changes the current thread's Culture and UICulture to the specified culture.

## EXAMPLES

### EXAMPLE 1
```
Set-ADTPowerShellCulture -Culture en-US
```

## PARAMETERS

### -CultureInfo
The culture to set the current thread's Culture and UICulture to.
Can be a CultureInfo object, or any valid IETF BCP 47 language tag.

```yaml
Type: CultureInfo
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
### This function does not generate any output.
## NOTES
An active ADT session is NOT required to use this function.

Tags: psadt
Website: https://psappdeploytoolkit.com
Copyright: (c) 2024 PSAppDeployToolkit Team, licensed under LGPLv3
License: https://opensource.org/license/lgpl-3-0

## RELATED LINKS

[https://psappdeploytoolkit.com](https://psappdeploytoolkit.com)
