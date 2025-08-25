cat ./extensions.txt | while read -r extension; do
    code --install-extension "$extension" || echo "Failed: $extension"
done