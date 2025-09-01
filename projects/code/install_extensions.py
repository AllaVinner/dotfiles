import os
import sys
from pathlib import Path
import subprocess


def main():
    args = sys.argv
    if len(args) < 2:
        extension_file = Path("./extensions.txt")
    else:
        extension_file = Path(os.getcwd(), args[1])
    extensions = [
        line
        for line in extension_file.read_text().split("\n")
        if not line.startswith("#") and line != ""
    ]
    for extension in extensions:
        print(f"Installing extensions: ", extension)
        res = subprocess.run(
            ["code", "--install-extension", extension], capture_output=True, check=True
        )


if __name__ == "__main__":
    main()
