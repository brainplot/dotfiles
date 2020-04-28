function tree -w tree -d 'tree command that excludes VCS directories'
	command tree -I '.git|.svn|.hg' $argv
end
