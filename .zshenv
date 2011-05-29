# vim:set ft=zsh:

export LANG=ja_JP.UTF-8
export PAGER='less --RAW-CONTROL-CHARS'
export EDITOR=vim
export FPATH=$HOME/.zsh/f:$FPATH
export LS_COLORS="di=33:ln=32:ex=31:pi=34"
export PATH=${(j.:.)paths}

uname=`uname`
[[ -f "$HOME/.zsh/os/$uname.zshenv" ]] && . "$HOME/.zsh/os/$uname.zshenv"
[[ -f "$HOME/.zsh/hosts/$HOST.zshenv" ]] && . "$HOME/.zsh/hosts/$HOST.zshenv"

