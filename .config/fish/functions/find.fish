function find --wraps=find --description 'Same as find command but redirects stderr to /dev/null'
	command find $argv 2>/dev/null
end
