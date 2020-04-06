function to --description 'Fuzzy jump to a specified location'
	set target_location (
		find $HOME -type d -a ! -path '*[Cc]ache*' -a ! -path '*node_modules*' \
		-a ! -path '*.git/*' -a ! -path "$HOME/.mozilla*" \
		-a ! -path '*/Zeal/Zeal/docsets/*' -print0 \
		| fzf --no-multi --exit-0 --read0 --print0
	)

	if test $status -eq 0
		cd $target_location
	end
end
