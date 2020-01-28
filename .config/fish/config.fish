set -x GPG_TTY

update_gpg_tty

if status --is-interactive
	abbr --add --global g git
end
