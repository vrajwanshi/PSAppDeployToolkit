---
external help file: PSAppDeployToolkit-help.xml
Module Name: PSAppDeployToolkit
online version: https://psappdeploytoolkit.com
schema: 2.0.0
---

# Get-ADTLoggedOnUser

## SYNOPSIS
Retrieves session details for all local and RDP logged on users.

## SYNTAX

```
Get-ADTLoggedOnUser [<CommonParameters>]
```

## DESCRIPTION
The Get-ADTLoggedOnUser function retrieves session details for all local and RDP logged on users using Win32 APIs.
It provides information such as NTAccount, SID, UserName, DomainName, SessionId, SessionName, ConnectState, IsCurrentSession, IsConsoleSession, IsUserSession, IsActiveUserSession, IsRdpSession, IsLocalAdmin, LogonTime, IdleTime, DisconnectTime, ClientName, ClientProtocolType, ClientDirectory, and ClientBuildNumber.

## EXAMPLES

### EXAMPLE 1
```
Get-ADTLoggedOnUser
```

This example retrieves session details for all local and RDP logged on users.

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None
### You cannot pipe objects to this function.
## OUTPUTS

### PSADT.Types.UserSessionInfo
### Returns a custom type with information about user sessions:
### - NTAccount
### - SID
### - UserName
### - DomainName
### - SessionId
### - SessionName
### - ConnectState
### - IsCurrentSession
### - IsConsoleSession
### - IsUserSession
### - IsActiveUserSession
### - IsRdpSession
### - IsLocalAdmin
### - LogonTime
### - IdleTime
### - DisconnectTime
### - ClientName
### - ClientProtocolType
### - ClientDirectory
### - ClientBuildNumber
## NOTES
Description of ConnectState property:

Value        Description
-----        -----------
Active       A user is logged on to the session.
ConnectQuery The session is in the process of connecting to a client.
Connected    A client is connected to the session.
Disconnected The session is active, but the client has disconnected from it.
Down         The session is down due to an error.
Idle         The session is waiting for a client to connect.
Initializing The session is initializing.
Listening    The session is listening for connections.
Reset        The session is being reset.
Shadowing    This session is shadowing another session.

Description of IsActiveUserSession property:
- If a console user exists, then that will be the active user session.
- If no console user exists but users are logged in, such as on terminal servers, then the first logged-in non-console user that has ConnectState either 'Active' or 'Connected' is the active user.

Description of IsRdpSession property:
- Gets a value indicating whether the user is associated with an RDP client session.

Description of IsLocalAdmin property:
- Checks whether the user is a member of the Administrators group

An active ADT session is NOT required to use this function.

Tags: psadt
Website: https://psappdeploytoolkit.com
Copyright: (c) 2024 PSAppDeployToolkit Team, licensed under LGPLv3
License: https://opensource.org/license/lgpl-3-0

## RELATED LINKS

[https://psappdeploytoolkit.com](https://psappdeploytoolkit.com)
