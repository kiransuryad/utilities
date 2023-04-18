param($totalHours = 1)

$myshell = New-Object -ComObject wscript.shell

# Start Notepad
$notepad = Start-Process notepad -PassThru

# Wait for the Notepad process to start
Start-Sleep -Seconds 2

# Calculate the total number of iterations
$iterations = $totalHours * 30

for ($i = 0; $i -lt $iterations; $i++) {
    # Send the Shift key every 2 minutes
    Start-Sleep -Seconds 120

    # Wait for the Notepad window to become active
    while (-not ($myshell.AppActivate($notepad.Id))) {
        Start-Sleep -Milliseconds 100
    }

    $myshell.SendKeys("+")

    # After every 60 minutes (30 iterations), send an Enter key to start a new line
    if (($i + 1) % 30 -eq 0) {
        # Wait for the Notepad window to become active again
        while (-not ($myshell.AppActivate($notepad.Id))) {
            Start-Sleep -Milliseconds 100
        }
        $myshell.SendKeys("{ENTER}")
    }
}

# Close Notepad without saving changes
$myshell.AppActivate($notepad.Id)
$myshell.SendKeys("%{F4}n")
