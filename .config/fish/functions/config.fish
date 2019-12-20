function config --wraps=git --description 'Manage dotfiles'
	git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv;
end
