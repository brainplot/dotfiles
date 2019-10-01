function dfs --wraps=git --description 'Dotfiles repository manager'
	/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME $argv;
end
