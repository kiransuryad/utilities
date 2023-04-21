@echo off
set /p totalHours="Enter the total hours for the script to run: "

rem Convert total hours to total minutes
set /a totalMinutes=%totalHours%*60

rem Run the PowerShell script in the background
start powershell.exe -WindowStyle Hidden -ExecutionPolicy Bypass -File your_script_name.ps1 -totalMinutes %totalMinutes%

rem Countdown timer
:countdown
cls
echo The script will run for %totalMinutes% minutes.
echo.
echo Time remaining: %totalMinutes% minutes
timeout /t 60 /nobreak >nul
set /a totalMinutes-=1

if %totalMinutes% gtr 0 goto countdown

echo The script has finished running.
pause
