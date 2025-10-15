#!/usr/bin/env bash
# Source colors if available
if [ -f "$HOME/.config/sketchybar/colors.sh" ]; then
	source "$HOME/.config/sketchybar/colors.sh"
fi

# Define monochrome colors
INACTIVE_BG=0x44000000          # Semi-transparent black
INACTIVE_TEXT=0xffcccccc        # Light gray text
SEPARATOR_COLOR=0x66666666      # Medium gray separator

# Add event
sketchybar --add event aerospace_workspace_change

for sid in $(aerospace list-workspaces --all); do
	sketchybar --add item space."$sid" left \
		--subscribe space."$sid" aerospace_workspace_change \
		--set space."$sid" \
		background.color=$INACTIVE_BG \
		background.corner_radius=8 \
		background.height=28 \
		background.drawing=on \
		background.padding_left=2 \
		background.padding_right=2 \
		label.font="SF Pro:Bold:14.0" \
		label.color=$INACTIVE_TEXT \
		label.padding_left=12 \
		label.padding_right=12 \
		label.padding_top=2 \
		label.padding_bottom=2 \
		label="$sid" \
		icon.drawing=off \
		updates=when_shown \
		click_script="aerospace workspace $sid" \
		script="$HOME/.config/sketchybar/plugins/aerospacer.sh $sid"
done

# Add separator
sketchybar --add item spaces_separator left \
	--set spaces_separator \
	icon= \
	icon.font="SF Pro:Regular:12.0" \
	icon.color=$SEPARATOR_COLOR \
	icon.padding_left=8 \
	icon.padding_right=8 \
	background.drawing=off \
	label.drawing=off
