function edit -d "Edit text file in $EDITOR"
	find $HOME/.config/ -type f -a ! -path '*[Cc]ache*' -a ! -path '*node_modules*' -a ! -path '*.git/*' -print0 \
	| fzf --multi --exit-0 --read0 --print0 \
	| xargs --no-run-if-empty --null $EDITOR
end
