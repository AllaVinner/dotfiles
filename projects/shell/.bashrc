# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Source shared shell rc
shell_script="$HOME/.config/shell/shellrc.sh"
if [ -f "$shell_script" ]; then 
    source "${shell_script}"
fi

# Source machine specific rc. 
# Put the specific bashrc parts into this file
personal_bashrc="$HOME/.personal/.bashrc"
if [ -f "$personal_bashrc" ]; then 
    source "${personal_bashrc}"
fi

# Bash specific setup
eval "$(fzf --bash)"
eval "$(starship init bash)"

