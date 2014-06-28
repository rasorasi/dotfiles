source ~/.zsh.d/zshrc.sh
source /etc/zsh_command_not_found

autoload -U compinit
compinit

PS1=" %B%F{cyan}%~%f%b %h %F{green}%*%f
%# "

gconftool-2 --set /apps/gnome-terminal/profiles/Default/font --type string "Ricty Regular 12"

alias dvpd='dvipdfmx' hi='history' e='emacs &' E='emacsclient -nt' i='source ~/.zshrc' py='python'
alias mpic='python ~/p/q22.py' gth='gthumb' mn='gnome-system-monitor'

bindkey -e

HISTFILE=~/.zsh.d/zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
#自動修正
setopt correct
setopt correct_all
# 範囲指定できるようにする
# 例 : mkdir {1-3} で フォルダ1, 2, 3を作れる
setopt brace_ccl

ctex() { platex $1.tex && dvipdfmx $1.dvi && evince $1.pdf}

c++() { g++ $1 && ./a.out}
cco() { gcc $1 && ./a.out}

# WINEPREFIXは任意パス(自分はwine32にしている)
export WINEPREFIX=$HOME/wine32
export WINEARCH=win32

