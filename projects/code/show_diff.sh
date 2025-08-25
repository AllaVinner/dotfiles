
windows_user=$(/mnt/c/Windows/System32/cmd.exe /c 'echo %USERNAME%' 2>/dev/null | tr -d '\r')

windows_path="/mnt/c/Users/${windows_user}/AppData/Roaming/Code/User/$1"
wsl_path="./$1"
code --diff $windows_path $wsl_path

