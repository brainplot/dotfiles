# Set the pseudo-tty for the gpg-agent
set -x GPG_TTY (tty)

# Update the tty view of the SSH agent. Not needed if you're using the GPG agent
# without SSH support.
# (Needs to be executed every time a new terminal is launched)
gpg-connect-agent updatestartuptty /bye >/dev/null
