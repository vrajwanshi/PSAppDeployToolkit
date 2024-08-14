﻿function Start-ADTMspProcess
{
    <#

    .SYNOPSIS
    Executes an MSP file using the same logic as Start-ADTMsiProcess.

    .DESCRIPTION
    Reads SummaryInfo targeted product codes in MSP file and determines if the MSP file applies to any installed products. If a valid installed product is found, triggers the Start-ADTMsiProcess function to patch the installation.

    Uses default config MSI parameters. You can use -AddParameters to add additional parameters.

    .PARAMETER Path
    Path to the msp file

    .PARAMETER AddParameters
    Additional parameters

    .INPUTS
    None. You cannot pipe objects to this function.

    .OUTPUTS
    None. This function does not generate any output.

    .EXAMPLE
    Start-ADTMspProcess -Path 'Adobe_Reader_11.0.3_EN.msp'

    .EXAMPLE
    Start-ADTMspProcess -Path 'AcroRdr2017Upd1701130143_MUI.msp' -AddParameters 'ALLUSERS=1'

    .LINK
    https://psappdeploytoolkit.com

    #>

    param (
        [Parameter(Mandatory = $true, HelpMessage = 'Please enter the path to the MSP file')]
        [ValidateScript({('.msp' -contains [System.IO.Path]::GetExtension($_))})]
        [Alias('FilePath')]
        [System.String]$Path,

        [Parameter(Mandatory = $false)]
        [ValidateNotNullorEmpty()]
        [System.String]$AddParameters
    )

    begin {
        $adtSession = Get-ADTSession
        Write-ADTDebugHeader
    }

    process {
        # If the MSP is in the Files directory, set the full path to the MSP.
        $mspFile = if ([System.IO.File]::Exists(($dirFilesPath = [System.IO.Path]::Combine($adtSession.GetPropertyValue('DirFiles'), $Path))))
        {
            $dirFilesPath
        }
        elseif (Test-Path -LiteralPath $Path)
        {
            (Get-Item -LiteralPath $Path).FullName
        }
        else
        {
            Write-ADTLogEntry -Message "Failed to find MSP file [$Path]." -Severity 3
            throw [System.IO.FileNotFoundException]::new("Failed to find MSP file [$Path].")
        }

        # Create a Windows Installer object and open the database in read-only mode.
        Write-ADTLogEntry -Message 'Checking MSP file for valid product codes.'
        [__ComObject]$Installer = New-Object -ComObject WindowsInstaller.Installer
        [__ComObject]$Database = Invoke-ADTObjectMethod -InputObject $Installer -MethodName OpenDatabase -ArgumentList @($mspFile, 32)

        # Get the SummaryInformation from the windows installer database and store all product codes found.
        [__ComObject]$SummaryInformation = Get-ADTObjectProperty -InputObject $Database -PropertyName SummaryInformation
        $AllTargetedProductCodes = Get-ADTInstalledApplication -ProductCode (Get-ADTObjectProperty -InputObject $SummaryInformation -PropertyName Property -ArgumentList @(7)).Split(';')

        # Free our COM objects.
        $null = try
        {
            [Runtime.Interopservices.Marshal]::ReleaseComObject($SummaryInformation)
        }
        catch
        {
            $null
        }
        $null = try
        {
            [Runtime.Interopservices.Marshal]::ReleaseComObject($Database)
        }
        catch
        {
            $null
        }
        $null = try
        {
            [Runtime.Interopservices.Marshal]::ReleaseComObject($Installer)
        }
        catch
        {
            $null
        }

        # If the application is installed, patch it.
        if ($AllTargetedProductCodes)
        {
            Start-ADTMsiProcess -Action Patch @PSBoundParameters
        }
    }

    end {
        Write-ADTDebugFooter
    }
}