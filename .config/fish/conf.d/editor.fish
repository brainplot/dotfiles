if test -n "$DISPLAY"
	set -x ALTERNATE_EDITOR emacs
	set -x EDITOR emacsclient -c
	set -x VISUAL emacsclient -c
else
	set -x EDITOR nano
end
