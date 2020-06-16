#!/bin/sh

vol=$(pamixer --get-volume)
volStatus=$(pamixer --get-volume-human) 

if [ "$volStatus" = "muted" ]; then
	icon="🔇"
else
	icon="🔉"
fi

printf "%s %s%%" "$icon" "$vol"
