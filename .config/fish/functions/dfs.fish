# Defined in - @ line 1
function dfs --wraps=git --description 'Dotfiles manager'
	git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv;
end
