if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	sx
fi
. "$HOME/.cargo/env"
