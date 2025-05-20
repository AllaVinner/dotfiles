# Code

VS-Code settings

## Setup
The `extensions.txt` stores a flat list of the installed extensions.
Install them on the target system by running:

```bash
cat ./extensions.txt | while read -r extension; do
    code --install-extension "$extension" || echo "Failed: $extension"
done
```

