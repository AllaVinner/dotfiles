
# Source shared shell rc
shellrc="$HOME/.config/shell/shellrc.sh" 
if [ -f $shellrc ]; then
    source $shellrc
fi

# Zsh specific setup
eval "$(fzf --zsh)"
eval "$(starship init zsh)"

