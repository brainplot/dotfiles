if test -n "$DISPLAY"
	set -x EDITOR nvim
	set -x VISUAL $EDITOR
else
	set -x EDITOR nano
end
