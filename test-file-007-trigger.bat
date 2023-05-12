@echo off
set /p totalHours="Enter the total hours for the script to run: "

rem Convert total hours to total minutes
set /a totalMinutes=%totalHours%*60

set /a remainingMinutes=%totalHours%*60

rem Run the PowerShell script in the background
start powershell.exe -WindowStyle Hidden -ExecutionPolicy Bypass -File test-file-007.ps1 -totalHours %totalHours%

rem Countdown timer
:countdown
cls
echo The script will run for %totalMinutes% minutes.
echo.

rem Display the current iteration count
set /p iterationCount=<iterationCount.txt
echo Iteration count: %iterationCount%

echo Time remaining: %remainingMinutes% minutes
timeout /t 60 /nobreak >nul
set /a remainingMinutes-=1

if %remainingMinutes% gtr 0 goto countdown

rem Kill the powershell process
taskkill /f /im powershell.exe /fi "WINDOWTITLE eq alive-006.ps1"

echo The script has finished running.
exit
