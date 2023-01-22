[ -e ~/.shrc ] && . ~/.shrc

# Don't log duplicate commands on the command history
HISTCONTROL=ignoreboth

# Exclude . and .. from .* expansion
GLOBIGNORE='.:..'

# Automatically cd into directories, even if not prepended by cd
[ "${BASH_VERSINFO[0]}" -ge 4 ] && shopt -s autocd
# Check the window size after every command so that text wraps properly
shopt -s checkwinsize
# Complete environment variables
[ "${BASH_VERSINFO[0]}" -ge 4 ] && [ "${BASH_VERSINFO[1]}" -ge 3 ] ||
[ "${BASH_VERSINFO[0]}" -ge 5 ] && shopt -s direxpand

# To get a list of all supported colors, run the following command
# for x in {0..8}; do for i in {30..37}; do for a in {40..47}; do printf "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "; done; echo; done; done; echo
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

PS1="\n${UR_CLR}\u${AT_CLR}@${HN_CLR}\h ${WD_CLR}\w${RT_CLR}"

unset HN_CLR
unset UR_CLR
unset WD_CLR
unset AT_CLR
unset DL_CLR
unset VC_CLR
unset RT_CLR

# Git prompt
[ -e ~/.git-prompt.sh ] && . ~/.git-prompt.sh

if type __git_ps1 >/dev/null 2>&1
then
	GIT_PS1_DESCRIBE_STYLE=branch
	GIT_PS1_SHOWDIRTYSTATE=1
	GIT_PS1_SHOWSTASHSTATE=1
	GIT_PS1_SHOWUNTRACKEDFILES=1
	GIT_PS1_SHOWUPSTREAM=verbose
	PS1+="${VC_CLR}\$(__git_ps1)${RT_CLR}"
fi

PS1+="\n${DL_CLR}\$${RT_CLR} "

# Git completion
if [ -r ~/.git-completion.bash ] && . ~/.git-completion.bash
then
	__git_complete dot __git_main
fi

# fzf keybindings
[ -e ~/.local/share/fzf/completion.bash ] && . ~/.local/share/fzf/completion.bash
[ -e ~/.local/share/fzf/key-bindings.bash ] && . ~/.local/share/fzf/key-bindings.bash

# HashiCorp tools
for hashicorp_tool in terraform vault packer
do
	hashicorp_tool_full_path="$(command -v "$hashicorp_tool")" &&
	complete -C "$hashicorp_tool_full_path" "$hashicorp_tool"
done

unset hashicorp_tool
unset hashicorp_tool_full_path
