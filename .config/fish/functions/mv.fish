function mv --description 'Do not clobber files with mv unless the -f option is passed'
	command mv -n $argv
end
