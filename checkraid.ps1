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
