
export FZF_DEFAULT_COMMAND="fd --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_OPTS='--height 80% --tmux center,80% --layout reverse --border top'

# Uses neovim when reading `man`-pages
# Not sure what `+Man!` does ... but makes it work.
export MANPAGER='nvim +Man!'
export MANWIDTH=999
# export PAGER='nvim +Man!' # unset to make `bat` command look good.
export EDITOR="nvim"

export R_ENVIRON_USER="$HOME/.config/R/.Renviron"
env_path="$HOME/.config/keys/openai.env"

if test -f $env_path; then
    export $(grep -v '^#' $env_path | xargs -0)
fi

alias n="nvim"
alias n.="nvim ."
alias nz="nvim ~/.zshrc"
alias ni="nvim ~/.config/nvim/init.lua -c 'cd $HOME/.config/nvim'"
alias nt="nvim ~/.config/tmux/tmux.conf -c 'cd $HOME/.config/tmux'"
alias nf="nvim \$(fzf)"
alias nvimf="nvim \$(fzf)"

alias s="source"
alias sz="source ~/.zshrc"

# Convinience aliases
alias python="python3"
alias ll="ls -l"
alias ls="ls --color"
alias lsa="ls -a"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias cdb="cd $OLDPWD"
alias pecho="tr ':' '\n' <<< $PATH" 

