# Don't log duplicate commands on the command history
HISTCONTROL=ignoreboth

# Exclude . and .. from .* expansion
GLOBIGNORE='.:..'

# Set the pseudo-tty for the gpg-agent
export GPG_TTY=$(tty)

# Automatically cd into directories, even if not prepended by cd
shopt -s autocd
# Check the window size after every command so that text wraps properly
shopt -s checkwinsize
# Complete environment variables
shopt -s direxpand

# To get a list of all supported colors, run the following command
# for x in {0..8}; do for i in {30..37}; do for a in {40..47}; do echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "; done; echo; done; done; echo
if [ -n "$CLICOLOR" ]
then
	HN_CLR='\[\033[01;36m\]' # Hostname
	UR_CLR='\[\033[01;33m\]' # Username
	WD_CLR='\[\033[01;34m\]' # Working directory
	AT_CLR='\[\033[01;31m\]' # @ symbol
	DL_CLR='\[\033[01;32m\]' # Dollar sign after the prompt
	VC_CLR='\[\033[01;37m\]' # Version Control
	RT_CLR='\[\033[00m\]'    # Reset all colors
fi

# Disable blinking cursor if running in Windows Terminal
[ -n "$WT_SESSION" ] && printf '\e[2 q'

PS1="\n${UR_CLR}\u${AT_CLR}@${HN_CLR}\h ${WD_CLR}\w${RT_CLR}"

# Git prompt
[ -r ~/.git-prompt.sh ] && . ~/.git-prompt.sh

if type __git_ps1 >/dev/null; then
	GIT_PS1_DESCRIBE_STYLE=branch
	GIT_PS1_SHOWDIRTYSTATE=1
	GIT_PS1_SHOWSTASHSTATE=1
	GIT_PS1_SHOWUNTRACKEDFILES=1
	GIT_PS1_SHOWUPSTREAM=verbose
	PS1+="${VC_CLR}\$(__git_ps1)${RT_CLR}"
fi

PS1+="\n${DL_CLR}\$${RT_CLR} "

# fzf keybindings
[ -r ~/.local/share/fzf/completion.bash  ]  && . ~/.local/share/fzf/completion.bash
[ -r ~/.local/share/fzf/key-bindings.bash ] && . ~/.local/share/fzf/key-bindings.bash

# Clean-up
unset {HN,UR,WD,AT,DL,VC,RT}_CLR
