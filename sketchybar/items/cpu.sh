#!/bin/bash

sketchybar --add item cpu right \
	--set cpu label.font="SF Pro:Medium:10" \
	label="0%" \
	label.color=$WHITE \
	icon.drawing=off \
	background.drawing=off \
	update_freq=3 \
	script="$PLUGIN_DIR/cpu.sh"
