function restart_emacs_server -d 'Restart emacs server'
	systemctl --user restart emacs.service
end
