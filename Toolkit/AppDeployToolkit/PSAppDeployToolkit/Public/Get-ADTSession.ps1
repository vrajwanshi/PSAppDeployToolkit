﻿#---------------------------------------------------------------------------
#
# 
#
#---------------------------------------------------------------------------

function Get-ADTSession
{
    [CmdletBinding()]
    param
    (
    )

    # Return the most recent session in the database.
    if (!($adtData = Get-ADTModuleData).Sessions.Count)
    {
        $naerParams = @{
            Exception = [System.InvalidOperationException]::new("Please ensure that [Open-ADTSession] is called before using any $($MyInvocation.MyCommand.Module.Name) functions.")
            Category = [System.Management.Automation.ErrorCategory]::InvalidOperation
            ErrorId = 'ADTSessionBufferEmpty'
            TargetObject = $adtData.Sessions
            RecommendedAction = "Please ensure a session is opened via [Open-ADTSession] and try again."
        }
        $PSCmdlet.ThrowTerminatingError((New-ADTErrorRecord @naerParams))
    }
    return $adtData.Sessions[-1]
}