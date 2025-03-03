if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	sx
elif [[ ! -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exit
fi

. "$HOME/.cargo/env"
