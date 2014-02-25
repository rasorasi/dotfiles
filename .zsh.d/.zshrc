autoload -U compinit
compinit

# 名前で色を付けるようにする
autoload colors
colors

# LS_COLORSを設定しておく
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# ファイル補完候補に色を付ける
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
PS1="%B%F{cyan}[%~]%f%b$ "

alias dvpd='dvipdfmx' h='history' e='emacs &' E='emacsclient -t' i='source ~/.zshrc'

bindkey -e

HISTFILE=~/.zsh.d/zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history
setopt auto_cd
setopt auto_pushd
setopt correct

ctex() { platex $1.tex | dvipdfmx $1.dvi | evince $1.pdf}
