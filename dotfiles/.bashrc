#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias matlab='matlab -nodesktop -nosplash'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
export VISUAL=nvim
export EDITOR=nvim
alias vim=nvim
alias vi=nvim
alias pd=pushd
alias gd=popd
#alias sudo=doas
alias zathura='zathura --fork'
# Created by `pipx` on 2023-10-20 09:38:49
export PATH="$PATH:/home/hsj/.local/bin"
export TEXINPUTS="~/pgfplots/tex//:" 
#export PYENV_ROOT="$HOME/.pyenv"
#command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"

eval "$(direnv hook bash)"

export PS1=" \[\e[32;1;40m\] \u \W \[\e[37;0m\] >"
export HISTTIMEFORMAT="%Y-%m-%d %T "


PATH="/home/hsj/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/hsj/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/hsj/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/hsj/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/hsj/perl5"; export PERL_MM_OPT;
