# Windows doesn't support symlinks for normal users. Hence we can copy over the files manually like this.

windows_user=$(/mnt/c/Windows/System32/cmd.exe /c 'echo %USERNAME%' 2>/dev/null | tr -d '\r')
echo $windows_user
settings_path="/mnt/c/Users/${windows_user}/AppData/Roaming/Code/User/settings.json"
if [ -e "$file" ]; then
    echo "Remove exising settings"
    rm $settings_path
fi 
cp settings.json ${settings_path}

keybindings_path="/mnt/c/Users/${windows_user}/AppData/Roaming/Code/User/keybindings.json"
if [ -e "$file" ]; then
    echo "Remove exising keybindings"
    rm $keybindings_path
fi 
cp keybindings.json ${keybindings_path}

