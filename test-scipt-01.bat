@echo off
set /p totalHours="Enter the total hours for the script to run: "
powershell.exe -ExecutionPolicy Bypass -File your_script_name.ps1 -totalHours %totalHours%
