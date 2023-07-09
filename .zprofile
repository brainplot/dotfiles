[ -e ~/.profile ] && emulate sh -c '. ~/.profile'

# Make PATH, FPATH, MANPATH and INFOPATH unique sets
typeset -U PATH path
typeset -U FPATH fpath
typeset -U MANPATH manpath
typeset -UT INFOPATH infopath
