function clear_package_cache -d 'Clear yay and pacman cache'
	yes | sudo pacman -Sc && sudo paccache -rk0
end
