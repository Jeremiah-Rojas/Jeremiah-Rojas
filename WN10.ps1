<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Jeremiah Rojas
    LinkedIn        : https://www.linkedin.com/in/jeremiah-rojas-2425532b3
    GitHub          : https://github.com/Jeremiah-Rojas
    Date Created    : 2025-16-06
    Last Modified   : 2025-16-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 2025-16-06
    Tested By       : Jeremiah Rojas
    Systems Tested  : rojas-mde
    PowerShell Ver. : 5.1.19041.5965

.USAGE
    Simply enter the following line and press enter:
    
    PS C:\> .\WN10.ps1 
#>


# Define registry path and key/value
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$keyName = "MaxSize"
$keyValue = 0x8000  # 0x8000 hex = 32768 decimal

# Ensure the registry path exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the MaxSize DWORD value
New-ItemProperty -Path $regPath -Name $keyName -Value $keyValue -PropertyType DWord -Force | Out-Null

Write-Host "MaxSize for Application Event Log set to 0x8000 (32768 KB) at $regPath"
