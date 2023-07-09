[ -e ~/.profile ] && emulate sh -c '. ~/.profile'

# Make PATH, FPATH and MANPATH unique sets
typeset -U PATH path
typeset -U FPATH fpath
typeset -U MANPATH manpath
