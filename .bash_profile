#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . "${HOME}/.bashrc"

# Autostart X at login

# if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
#   exec startx
# fi
