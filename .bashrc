#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Don't log duplicate commands on the command history
HISTCONTROL=ignoreboth

# Don't expand . and .. when globbing with .*
GLOBIGNORE='.:..'

# Set the pseudo-tty for the gpg-agent
export GPG_TTY=$(tty)
# Update the tty view of the SSH agent. Not needed if you're using the GPG agent
# without SSH support.
# (Needs to be executed every time a new terminal is launched)
gpg-connect-agent updatestartuptty /bye >/dev/null

# Automatically cd into directories, even if not prepended by cd
shopt -s autocd
# Check the window size after every command so that text wraps properly
shopt -s checkwinsize

# Editor settings
if [[ -n "$DISPLAY" ]]
then
	export EDITOR=nvim
	export VISUAL="$EDITOR"
else
	export EDITOR=nano
fi

# Aliases
alias config='git --git-dir="$HOME/.dotfiles.git" --work-tree="$HOME"'
alias la='ls -lhA'
alias ll='ls -lh'
alias ls='ls --color=auto'
alias tree="tree -I '.git|.hg|.svn'"
alias bashconfig='"$EDITOR" "$HOME"/.bashrc'
alias nvimconfig='nvim "$XDG_CONFIG_HOME"/nvim/init.vim'
alias gitconfig='"$EDITOR" "$HOME"/.gitconfig'
alias cdnvim='cd "$XDG_CONFIG_HOME"/nvim'

# Some distros have 'bat' as 'batcat'
if command -v batcat >/dev/null
then
	alias bat=batcat
fi

case $(grep -Pho '(?<=ID=).+' /etc/*release) in
	gentoo )
		alias upgrade-system='sudo emaint -a sync && sudo emerge --ask --quiet --update --deep --newuse --with-bdeps=y @world'
		;;
esac

# Gentoo provides LS_COLORS in the global bashrc and sets it only if the
# terminal is capable of displaying colors
# To get a list of all supported colors, run the following command
# for x in {0..8}; do for i in {30..37}; do for a in {40..47}; do echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "; done; echo; done; done; echo
if [[ -n "$LS_COLORS" ]]
then
	HN_CLR='\[\033[01;36m\]' # Hostname
	UR_CLR='\[\033[01;33m\]' # Username
	WD_CLR='\[\033[01;34m\]' # Working directory
	AT_CLR='\[\033[01;31m\]' # @ symbol
	DL_CLR='\[\033[01;32m\]' # Dollar sign after the prompt
	VC_CLR='\[\033[01;37m\]' # Version Control
	RT_CLR='\[\033[00m\]'    # Reset all colors
fi

source_from_data_dirs() {
	IFS=:
	local exit_code=1
	local d;
	for d in $XDG_DATA_DIRS
	do
		local f="$d/$1"
		[[ -r "$f" ]] && source "$f" && exit_code=0 && break
	done
	unset IFS
	return "$exit_code"
}

PS1="${UR_CLR}\u${AT_CLR}@${HN_CLR}\h ${WD_CLR}\w${RT_CLR}"

# Git prompt
if command -v git >/dev/null
then
	GIT_PS1_DESCRIBE_STYLE=branch
	GIT_PS1_SHOWDIRTYSTATE=1
	GIT_PS1_SHOWSTASHSTATE=1
	GIT_PS1_SHOWUNTRACKEDFILES=1
	GIT_PS1_SHOWUPSTREAM=verbose
	source_from_data_dirs 'git/git-prompt.sh' && PS1+="${VC_CLR}\$(__git_ps1)${RT_CLR}"
	# Since we know git is installed, we can load its completions
	_completion_loader git
	__git_complete config __git_main
fi

PS1+="\n${DL_CLR}\$${RT_CLR} "

# fzf keybindings
source_from_data_dirs 'fzf/key-bindings.bash'

# Clean-up
unset {HN,UR,WD,AT,DL,VC,RT}_CLR
unset source_from_data_dirs
