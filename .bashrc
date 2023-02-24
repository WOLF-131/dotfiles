#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE="/home/wolf131/.micromamba/bin/micromamba";
export MAMBA_ROOT_PREFIX="/home/wolf131/micromamba";
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    if [ -f "/home/wolf131/micromamba/etc/profile.d/micromamba.sh" ]; then
        . "/home/wolf131/micromamba/etc/profile.d/micromamba.sh"
    else
        export  PATH="/home/wolf131/micromamba/bin:$PATH"  # extra space after export prevents interference from conda init
    fi
fi
unset __mamba_setup
# <<< mamba initialize <<<

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/wolf131/micromamba/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/wolf131/micromamba/etc/profile.d/conda.sh" ]; then
        . "/home/wolf131/micromamba/etc/profile.d/conda.sh"
    else
        export PATH="/home/wolf131/micromamba/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

