#!/bin/bash
resolucao="-W 1440 -H 900 -r 60"
#se logado no tty1
if [[ "$(tty)" == "/dev/tty1" ]] ; then
	if [ -z "$1" ]; then #se $1 estiver vazio
		sessao=0
	else
		sessao=$1
	fi
	case "$sessao" in		
		0) exec start-hyprland &>/dev/null ;;
		1) gamescope $resolucao -- steam -start steam://open/bigpicture ;;
		2) sleep 3 ; exec gamescope $resolucao -- pcsx2 -bigpicture -fullscreen ;;
	esac
fi
#se Hyprland estiver rodando
if pgrep -x "Hyprland" > /dev/null ; then
	alias vim="kitten @ set-background-opacity 0.7 && nvim"
	[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"	
	user="$(whoami)"
	## synth-shell-prompt.sh
	if [ -f /home/$user/.config/synth-shell/synth-shell-prompt.sh ] && [ -n "$( echo $- | grep i )" ]; then
		source /home/$user/.config/synth-shell/synth-shell-prompt.sh
	fi

	## better-ls
	if [ -f /home/$user/.config/synth-shell/better-ls.sh ] && [ -n "$( echo $- | grep i )" ]; then
		source /home/$user/.config/synth-shell/better-ls.sh
	fi

	## alias
	if [ -f /home/$user/.config/synth-shell/alias.sh ] && [ -n "$( echo $- | grep i )" ]; then
		source /home/$user/.config/synth-shell/alias.sh
	fi

	## better-history
	if [ -f /home/$user/.config/synth-shell/better-history.sh ] && [ -n "$( echo $- | grep i )" ]; then
		source /home/$user/.config/synth-shell/better-history.sh
	fi
fi
