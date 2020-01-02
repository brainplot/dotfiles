function restart-emacs-server -d 'Restart emacs server'
	systemctl --user restart emacs.service
end
