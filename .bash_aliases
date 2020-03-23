#
# ~/.bash_aliases
#

alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ll -A'

alias config='git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'

# Do not clobber files with cp or mv
alias cp='cp -n'
alias mv='mv -n'

# Shorthand to launch Docker with sudo privileges
alias sdocker='sudo docker'
