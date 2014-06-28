
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=32:ln=35:so=32:pi=33:ex=31:bd=46;35:cd=43;35:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export ZLS_COLORS=$LS_COLORS
export CLICOLOR=true

alias ls="ls -F --color=auto"
alias gls="gls --color"

zstyle ':completion:*' list-colors 'di=32' 'ln=35' 'so=32' 'ex=31' 'bd=46;35' 'cd=43;35'

gconftool-2 --set /apps/gnome-terminal/profiles/Default/font --type string "Ricty Regular 12"
