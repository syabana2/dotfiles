#!/bin/bash

# Get battery percentage
PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

# Exit if no battery info found
if [ -z "$PERCENTAGE" ]; then
	exit 0
fi

# Use lightning bolt for charging, battery icon for normal
if [[ -n $CHARGING ]]; then
	ICON="􀢋" # bolt.fill (lightning)
else
	ICON="􀛨" # battery.100
fi

# Update the battery item with white color
sketchybar --set $NAME \
	label="${ICON}${PERCENTAGE}%" \
	label.color=0xffffffff
