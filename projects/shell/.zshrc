
# Source shared shell rc
shellrc="$HOME/.config/shell/shellrc.sh" 
if [ -f $shellrc ]; then
    source $shellrc
fi

# Source machine specific rc. 
# Put the specific zshrc parts into this file
personal_zshrc="$HOME/.personal/.zshrc"
if [ -f "$personal_zshrc" ]; then 
    source "${personal_zshrc}"
fi

# Zsh specific setup
eval "$(fzf --zsh)"
eval "$(starship init zsh)"
eval "$(teleport shell)"

