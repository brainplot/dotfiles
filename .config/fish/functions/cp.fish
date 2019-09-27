function cp --description 'Do not clobber files with cp unless the -f option is passed'
	command cp -n $argv
end
