function clear_cache -d 'Clear yay and pacman cache'
	echo Y | yay -Sc && sudo paccache -rk0
end
