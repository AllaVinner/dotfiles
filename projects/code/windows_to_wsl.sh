# Windows to WSL
#
windows_user=$(/mnt/c/Windows/System32/cmd.exe /c 'echo %USERNAME%' 2>/dev/null | tr -d '\r')
echo "Windows User: $windows_user"

copy_with_delete() {
  local source="$1"
  local target="$2"

  # Check if the target exists and is a file
  if [ -f "$target" ]; then
    echo "Removing $target"
    rm "$target"
  fi

  # Copy the source to the target
  cp "$source" "$target"
}

windows_path="/mnt/c/Users/${windows_user}/AppData/Roaming/Code/User/settings.json"
wsl_path="./settings.json"

windows_paths=(
    "/mnt/c/Users/${windows_user}/AppData/Roaming/Code/User/settings.json" 
    "/mnt/c/Users/${windows_user}/AppData/Roaming/Code/User/keybindings.json"
)
wsl_paths=("./settings.json" "./keybindings.json")

# Loop through each pair
for i in "${!windows_paths[@]}"; do
  copy_with_delete "${windows_paths[$i]}" "${wsl_paths[$i]}"
done

