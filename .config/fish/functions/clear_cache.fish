function clear_cache -d 'Clear yay and pacman cache'
	yes | yay -Sc
	and sudo paccache -rk0 $argv
end
