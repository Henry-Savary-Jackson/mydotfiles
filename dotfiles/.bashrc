#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
export VISUAL=nvim
export EDITOR=nvim
alias vim=nvim
alias vi=nvim
#alias sudo=doas
alias zathura='zathura --fork'
# Created by `pipx` on 2023-10-20 09:38:49
export CUDA_PATH=/opt/cuda-9.0
export PATH="$PATH:/home/themule/.local/bin"
export PS1=" \[\e[32;1;36m\] \u \W \[\e[37;0m\] >"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export SSH_AGENT_PID=""
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh"
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

eval "$(direnv hook bash)"
