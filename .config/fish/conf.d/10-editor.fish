# Set the EDITOR and VISUAL appropriately based on whetheter we have a GUI
if set -q DISPLAY
	set -x EDITOR vim
	set -x VISUAL 'subl -w'
else
	set -x EDITOR nano
	set -x VISUAL $EDITOR
end
