function Invoke-ADTFunctionErrorHandler
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.PSCmdlet]$Cmdlet,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.SessionState]$SessionState,

        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.ErrorRecord]$ErrorRecord,

        [Parameter(Mandatory = $false)]
        [ValidateNotNullOrEmpty()]
        [System.String]$Prefix
    )

    begin
    {
        # Recover true ErrorActionPreference the caller may have set and set it here.
        $ErrorActionPreference = if ($SessionState.Equals($ExecutionContext.SessionState))
        {
            Get-Variable -Name OriginalErrorAction -Scope 1 -ValueOnly
        }
        else
        {
            $SessionState.PSVariable.Get('OriginalErrorAction').Value
        }
    }
    
    process
    {
        # Write-Error enforces its own name against the Activity, let's re-write it.
        if ($ErrorRecord.CategoryInfo.Activity.Equals('Write-Error'))
        {
            $ErrorRecord.CategoryInfo.Activity = $Cmdlet.MyInvocation.MyCommand.Name
        }

        # Write out the caller's prefix, if provided.
        if ($Prefix)
        {
            $Prefix += "`n$(Resolve-ADTError -ErrorRecord $ErrorRecord)"
            Write-ADTLogEntry -Message $Prefix -Source $Cmdlet.MyInvocation.MyCommand.Name -Severity 3
        }

        # If we're stopping, throw a terminating error. While WriteError will terminate if stopping,
        # this also writes out an [System.Management.Automation.ActionPreferenceStopException] object.
        if ($ErrorActionPreference.Equals([System.Management.Automation.ActionPreference]::Stop))
        {
            $Cmdlet.ThrowTerminatingError($ErrorRecord)
        }
        else
        {
            $Cmdlet.WriteError($ErrorRecord)
        }
    }
}