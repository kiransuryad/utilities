param($totalHours = 1)

$myshell = New-Object -ComObject wscript.shell

# Calculate the total number of iterations
$iterations = $totalHours * 30

for ($i = 0; $i -lt $iterations; $i++) {
    # Send the Scroll Lock key every 2 minutes
    Start-Sleep -Seconds 120
    $myshell.SendKeys("{SCROLLLOCK}")

    # Write the current iteration count to a file
    $i | Out-File -FilePath 'iterationCount.txt'
}

exit
