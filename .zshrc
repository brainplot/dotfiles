[ -e ~/.shrc ] && emulate sh -c '. ~/.shrc'

# Make PATH and FPATH unique sets
typeset -U PATH path
typeset -U FPATH fpath

# Add Homebrew stuff to the shell's search path, if it's installed
[ -n "$HOMEBREW_PREFIX" ] &&
fpath+=(
	"$HOMEBREW_PREFIX"/completions/zsh
	"$HOMEBREW_PREFIX"/share/zsh/site-functions
	"$HOMEBREW_PREFIX"/share/zsh-completions
)

# Add user-specific folder to the shell's search path
fpath+=(
	"$XDG_DATA_HOME"/zsh/site-functions
)

# Emacs keys
bindkey -e

# Use CTRL+U to delete the line until the beginning, like Bash does
bindkey \^U backward-kill-line

# Prepending cd to directories becomes optional
setopt autocd

# Only keep the most recent version of a full command in the history
setopt histignorealldups

# Do not append to the history commands that start with a space
setopt histignorespace

# Allow comments in interactive sessions
setopt interactivecomments

# Prevent the shell from eating up the previous space when a command has been autocompleted
# and & or | are typed
ZLE_SPACE_SUFFIX_CHARS='&|'

# Completion
autoload -Uz compinit && compinit
autoload -Uz +X bashcompinit && bashcompinit

# Case-insensitive completion with priority for exact-case matches
# https://stackoverflow.com/a/24237590
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Make alt-backspace behave like Bash
autoload -Uz select-word-style
select-word-style bash

# Enable ^X^E to editor the current prompt in a text editor
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# Prompt
autoload -Uz promptinit && promptinit
