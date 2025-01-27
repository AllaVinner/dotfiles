eval "$(fzf --zsh)"
eval "$(starship init zsh)"

shellrc = "~/.config/shell/shellrc.sh" 
if [ -f $shellrc ]; then
    source $shellrc
fi



