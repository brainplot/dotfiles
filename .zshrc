[ -e ~/.shrc ] && emulate sh -c '. ~/.shrc'

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
[ -e "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh" ] &&
. "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh"

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
	"$XDG_DATA_HOME"/zsh/plugins/*
)

# Emacs keys
bindkey -e

# Use CTRL+U to delete the line until the beginning, like Bash does
bindkey \^U backward-kill-line

# Prepending cd to directories becomes optional
setopt autocd

# History file
HISTFILE="${ZDOTDIR:-$HOME}"/.zsh_history
HISTSIZE=2000
SAVEHIST="$HISTSIZE"

# Only keep the most recent version of a full command in the history
setopt histignorealldups

# Do not append to the history commands that start with a space
setopt histignorespace

# Allow comments in interactive sessions
setopt interactivecomments

# Prevent the shell from eating up the previous space when a command has been autocompleted
# and & or | are typed
ZLE_SPACE_SUFFIX_CHARS='&|'

# Eat space preceding these characters. The `)` is especially handy: it allows to type
# `file "$(which some_com<TAB> )"` and have the `)` eat up the space before it, resulting in
# `file "$(which some_command)"`
ZLE_REMOVE_SUFFIX_CHARS=$' \t\n;)'

# Completion
autoload -Uz compinit && compinit
autoload -Uz +X bashcompinit && bashcompinit

# Case-insensitive completion with priority for exact-case matches
# https://stackoverflow.com/a/24237590
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Fall back to completing just files if everything else fails
# https://zsh.sourceforge.io/FAQ/zshfaq04.html
zstyle ':completion:*' completer _complete _ignored _files

terraform_full_path="$(command -v terraform)" &&
complete -o nospace -C "$terraform_full_path" terraform

# Make alt-backspace behave like Bash
autoload -Uz select-word-style
select-word-style bash

# Enable ^X^E to editor the current prompt in a text editor
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# Prompt
autoload -Uz promptinit && promptinit

# Custom theme
prompt powerlevel10k
[ -e ~/.p10k.zsh ] && . ~/.p10k.zsh

# Clean-up
unset terraform_full_path
