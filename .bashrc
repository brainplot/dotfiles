#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source custom aliases, if present
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

# Don't log duplicate commands on the command history
HISTCONTROL=ignoredups

# Set the pseudo-tty for the gpg-agent
export GPG_TTY=$(tty)
# Update the tty view of the SSH agent. Not needed if you're using the GPG agent
# without SSH support.
# (Needs to be executed every time a new terminal is launched)
gpg-connect-agent updatestartuptty /bye >/dev/null

# Set a sensible value for EDITOR and VISUAL
export EDITOR=$([[ -v DISPLAY ]] && echo vim || echo nano)
export VISUAL=$([[ -v DISPLAY ]] && echo 'subl -w' || echo "$EDITOR")

# Automatically cd into directories, even if not prepended by cd
shopt -s autocd
# Check the window size after every command so that text wraps properly
shopt -s checkwinsize

# Prompt customization
[[ -f ~/.bash-powerline.sh ]] && . ~/.bash-powerline.sh || PS1='[\u@\h \W]\$ '
