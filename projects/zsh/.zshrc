

# Set up fzf key bindings and fuzzy completion

eval "$(fzf --zsh)"
eval "$(starship init zsh)"

export FZF_DEFAULT_COMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export MANPAGER='nvim +Man!'
export MANWIDTH=999

env_path="$HOME/.config/keys/openai.env"
if test -f $env_path; then
    export $(grep -v '^#' $env_path | xargs -0)
fi

alias n="nvim"
alias n.="nvim ."
alias nz="nvim ~/.zshrc"
alias ni="nvim ~/.config/nvim/init.lua"
alias nt="nvim ~/.config/tmux/tmux.conf"

alias s="source"
alias sz="source ~/.zshrc"

alias python="python3"
alias ll="ls -l"
alias ls="ls --color"
alias lsa="ls -a"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias cdb="cd $OLDPWD"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

