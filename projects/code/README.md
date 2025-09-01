# Code

VS-Code settings


Extensions needs to be installed separately. 
List them with `code --list-extensions`.
And install them by running `python install_extensions.py`

Or by running bash script
```bash
cat ./extensions.txt | while read -r extension; do
    code --install-extension "$extension" || echo "Failed: $extension"
done
```

