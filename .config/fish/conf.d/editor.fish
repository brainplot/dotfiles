if test -n "$DISPLAY"
	set -x ALTERNATE_EDITOR remacs
	set -x EDITOR remacsclient -c
	set -x VISUAL remacsclient -c
else
	set -x EDITOR nano
end
