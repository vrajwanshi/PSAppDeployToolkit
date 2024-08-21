---
external help file: PSAppDeployToolkit-help.xml
Module Name: PSAppDeployToolkit
online version: https://psappdeploytoolkit.com
schema: 2.0.0
---

# Remove-ADTEdgeExtension

## SYNOPSIS
Removes an extension for Microsoft Edge using the ExtensionSettings policy.

## SYNTAX

```
Remove-ADTEdgeExtension [-ExtensionID] <String> [<CommonParameters>]
```

## DESCRIPTION
This function removes an extension for Microsoft Edge using the ExtensionSettings policy: https://learn.microsoft.com/en-us/deployedge/microsoft-edge-manage-extensions-ref-guide.

This enables Edge Extensions to be installed and managed like applications, enabling extensions to be pushed to specific devices or users alongside existing GPO/Intune extension policies.

This should not be used in conjunction with Edge Management Service which leverages the same registry key to configure Edge extensions.

## EXAMPLES

### EXAMPLE 1
```
Remove-ADTEdgeExtension -ExtensionID "extensionID"
```

Removes the specified extension from Microsoft Edge.

## PARAMETERS

### -ExtensionID
The ID of the extension to remove.

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
### This function does not return objects.
## NOTES
An active ADT session is NOT required to use this function.

This function is provided as a template to remove an extension for Microsoft Edge.
This should not be used in conjunction with Edge Management Service which leverages the same registry key to configure Edge extensions.

Tags: psadt
Website: https://psappdeploytoolkit.com
Copyright: (c) 2024 PSAppDeployToolkit Team, licensed under LGPLv3
License: https://opensource.org/license/lgpl-3-0

## RELATED LINKS

[https://psappdeploytoolkit.com](https://psappdeploytoolkit.com)
