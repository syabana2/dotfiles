#!/bin/bash
sketchybar --add item battery right \
	--set battery label.font="SF Pro:Medium:10" \
	label="100%" \
	label.color=$WHITE \
	icon.drawing=off \
	background.drawing=off \
	update_freq=120 \
	script="$PLUGIN_DIR/battery.sh" \
	--subscribe battery system_woke power_source_change
