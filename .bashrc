#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Edit bash keybindings
stty werase undef
bind '"\C-w": backward-kill-word'

# Don't log duplicate commands on the command history
HISTCONTROL=ignoreboth

# Set the pseudo-tty for the gpg-agent
export GPG_TTY="$(tty)"
# Update the tty view of the SSH agent. Not needed if you're using the GPG agent
# without SSH support.
# (Needs to be executed every time a new terminal is launched)
gpg-connect-agent updatestartuptty /bye >/dev/null

# Automatically cd into directories, even if not prepended by cd
shopt -s autocd
# Check the window size after every command so that text wraps properly
shopt -s checkwinsize

# Editor settings
if [ -n "$DISPLAY" ]
then
	export EDITOR=nvim
	export VISUAL="$EDITOR"
else
	export EDITOR=nano
fi

# Prompt customization
PS1='[\u@\h \W]\$ '

# Aliases
alias config='git --git-dir="$HOME/.dotfiles.git" --work-tree="$HOME"'
alias la='ls -lhA'
alias ll='ls -lh'
alias ls='ls --color=auto'
