function config -w git -d 'Manage dotfiles'
	git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME $argv
end
