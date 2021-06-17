#
# ~/.bashrc
#

# If not running interactively, don't do anything
case "$-" in
	*i*) ;;
	*) return
esac

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

# Aliases
alias dot='git --git-dir="$HOME/.dot.git" --work-tree="$HOME"'
alias la='ls -lhA'
alias ll='ls -lh'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias tree="tree -I '.git|.hg|.svn'"
alias bashconfig='"$EDITOR" "$HOME"/.bashrc'
alias nvimconfig='nvim "$XDG_CONFIG_HOME"/nvim/init.vim'
alias gitconfig='"$EDITOR" "$HOME"/.gitconfig'
alias tmuxconfig='"$EDITOR" "$HOME"/.tmux.conf'
alias cdnvim='cd "$XDG_CONFIG_HOME"/nvim'

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	xterm-color|*-256color) color_prompt=yes;;
esac

# Editor settings
case "$TERM" in
	xterm*|screen*|linux)
		export EDITOR=nvim
		export VISUAL="$EDITOR"
		;;
	*)
		export EDITOR=ed
		;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -z "${force_color_prompt+x}" ]; then
	if command -v tput >/dev/null && tput setaf 1 &>/dev/null; then
		# We have color support; assume it's compliant with Ecma-48
		# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
		# a case would tend to support setf rather than setaf.)
		color_prompt=yes
	else
		color_prompt=
	fi
fi

# Disable blinking cursor if running in Windows Terminal
[ -n "$WT_SESSION" ] && printf '\e[2 q'

# To get a list of all supported colors, run the following command
# for x in {0..8}; do for i in {30..37}; do for a in {40..47}; do echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "; done; echo; done; done; echo
if [ "$color_prompt" = yes ]; then
	HN_CLR='\[\033[01;36m\]' # Hostname
	UR_CLR='\[\033[01;33m\]' # Username
	WD_CLR='\[\033[01;34m\]' # Working directory
	AT_CLR='\[\033[01;31m\]' # @ symbol
	DL_CLR='\[\033[01;32m\]' # Dollar sign after the prompt
	VC_CLR='\[\033[01;37m\]' # Version Control
	RT_CLR='\[\033[00m\]'    # Reset all colors
fi

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

[ -r ~/.git-completions.sh ] && . ~/.git-completions.sh && __git_complete dot git

PS1+="\n${DL_CLR}\$${RT_CLR} "

# fzf keybindings
[ -r ~/.local/share/fzf/completion.bash  ]  && . ~/.local/share/fzf/completion.bash
[ -r ~/.local/share/fzf/key-bindings.bash ] && . ~/.local/share/fzf/key-bindings.bash

# Clean-up
unset {HN,UR,WD,AT,DL,VC,RT}_CLR
