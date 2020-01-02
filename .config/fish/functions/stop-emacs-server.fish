function stop-emacs-server -d 'Stop emacs server'
	systemctl --user stop emacs.service
end
