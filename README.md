# raidxpert2-monitoring
Monitoring raidxpert2

1. Create a copy rc_diag-1.bat of "C:\Program Files (x86)\RAIDXpert2\rc_diag.bat

@ECHO off
REM This sets up the name of the output file which is in the form hostname-date-time.txt
:SETUP_OUTPUT
REM Add the hostname
set output=%COMPUTERNAME%

REM Add the file extension to the end of the output filename
set output=%OUTPUT%.txt

SET raidcore_tool=rcadm.exe

IF %PROCESSOR_ARCHITECTURE%==AMD64 SET work_dir="%PROGRAMFILES(x86)%\RAIDXpert2\"
IF %PROCESSOR_ARCHITECTURE%==x86 SET work_dir="%PROGRAMFILES%\RAIDXpert2\"


%work_dir%%raidcore_tool% -M -gs -v > %output%

%work_dir%%raidcore_tool% -M -qa -v >> %output%

rem Output for systeminfo command on Windows systems
Systeminfo >> %output%

type %work_dir%\RC_Service.log >> %output%


2. execute this script with taskplanner:

start-process -FilePath 'C:\Program Files (x86)\RAIDXpert2\rc_diag-1.bat' -Wait 

# Define the path to the RAID status log file
$logFilePath = "C:\Program Files (x86)\RAIDXpert2\HYPERV-2.txt"

# Define the search string
$searchString = "State: .......... NORMAL"

# Check if the file exists
if (Test-Path $logFilePath) {
    # Read the content of the log file
    $logContent = Get-Content $logFilePath

    # Initialize a flag to indicate if the search string was found
    $stringFound = $false

    # Check each line of the log file for the search string
    foreach ($line in $logContent) {
        if ($line -match [regex]::Escape($searchString)) {
            $stringFound = $true
            Write-Output "String found: $line"
            break
        }
    }

    # Return 1 if the search string was not found, otherwise return 0
    if ($stringFound) {
        Write-Output "State is NORMAL."
        exit 0
    } else {
        Write-Output "State is NOT NORMAL."
        exit 1
    }
} else {
    Write-Output "Log file does not exist."
    exit 1
}
