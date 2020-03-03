function update_gpg_tty -d 'Update current tty for the gpg agent'
	# Set the pseudo-tty for the gpg-agent
	set GPG_TTY (tty)

	# Commit changes to the gpg-agent
	gpg-connect-agent updatestartuptty /bye >/dev/null
end
