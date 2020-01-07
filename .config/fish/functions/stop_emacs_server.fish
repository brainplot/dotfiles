function stop_emacs_server -d 'Stop emacs server'
	systemctl --user stop emacs.service
end
