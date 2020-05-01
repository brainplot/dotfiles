function find_leftovers -w find -d 'Find config files and other artifacts left by programs'
	if test (count $argv) -lt 1
		echo (status function)": [PROGRAM]" >&2
		return 1
	end
	find $HOME -iname "*$argv[1]*" $argv[2..-1]
end
