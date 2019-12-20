if set -q VISUAL
    set USER_EDITOR $VISUAL
else if set -q EDITOR
	set USER_EDITOR $EDITOR
else
	set USER_EDITOR nvim
end

function edit -w $USER_EDITOR -d 'Edit file in a text editor'
    eval $USER_EDITOR $argv
end
