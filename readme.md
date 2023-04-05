# Readme.md

This document contains the PowerShell and batch scripts to periodically send a key press and create a new line after a specified time.

## PowerShell Script

Save the following script as a `.ps1` file:

```powershell
param($totalHours = 1)

# Start Notepad
$notepad = Start-Process notepad -PassThru

# Wait for the Notepad process to start
Start-Sleep -Seconds 2

# Bring the Notepad window to the foreground
[System.Runtime.InteropServices.Marshal]::GetActiveObject("WScript.Shell").AppActivate($notepad.Id)

# Calculate the total number of iterations
$iterations = $totalHours * 30

for ($i = 0; $i -lt $iterations; $i++) {
    # Send a period key (".") every 2 minutes
    Start-Sleep -Seconds 120
    [System.Runtime.InteropServices.Marshal]::GetActiveObject("WScript.Shell").SendKeys(".")

    # After every 60 minutes (30 iterations), send an Enter key to start a new line
    if (($i + 1) % 30 -eq 0) {
        [System.Runtime.InteropServices.Marshal]::GetActiveObject("WScript.Shell").SendKeys("{ENTER}")
    }
}

# Close Notepad without saving changes
[System.Runtime.InteropServices.Marshal]::GetActiveObject("WScript.Shell").SendKeys("%{F4}n")


## Batch Script

```batch
@echo off
set /p totalHours="Enter the total hours for the script to run: "
powershell.exe -ExecutionPolicy Bypass -File your_script_name.ps1 -totalHours %totalHours%



Replace your_script_name.ps1 with the name of your PowerShell script.

To use the batch script, double-click it, and it will prompt you to enter the total hours for the PowerShell script to run. After entering the hours, it will execute the PowerShell script with the specified argument.


