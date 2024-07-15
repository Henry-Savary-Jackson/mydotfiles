#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc


# Created by `pipx` on 2023-10-20 09:38:49
export CUDA_PATH=/opt/cuda-9.0
export PATH="$CUDA_PATH/bin:$PATH:/home/themule/.local/bin"
export JAVA_HOME=/usr/lib/jvm/default
export DOTNET_CLI_TELEMETRY_OPTOUT=1
startx
