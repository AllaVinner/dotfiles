# uv binarly location
$env:PATH = " C:\Users\$env:USERNAME\.local\bin;" + $env:PATH

Invoke-Expression ($(teleport activate --shell powershell) -join "`n")