#!/usr/bin/env sh

# Define improved monochrome colors for better visibility
ACTIVE_BG=0xffffffff        # Pure white untuk focused workspace
INACTIVE_BG=0x66000000      # More opaque black untuk inactive
HAS_APP_BG=0xff888888       # Lighter gray untuk better contrast
ACTIVE_TEXT=0xff000000      # Pure black text untuk focused (kontras dengan white bg)
INACTIVE_TEXT=0xffffffff    # Pure white text untuk dark backgrounds
HAS_APP_TEXT=0xff000000     # Black text untuk medium gray background

WORKSPACE_ID="$1"
FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)
WINDOW_COUNT=$(aerospace list-windows --workspace "$WORKSPACE_ID" | jq 'length') # Requires `jq`

echo "$(date): $WORKSPACE_ID | Focused: $FOCUSED_WORKSPACE | Window count: $WINDOW_COUNT" >>/tmp/sketchybar_debug.log

if [ "$WORKSPACE_ID" = "$FOCUSED_WORKSPACE" ]; then
	# FOCUSED workspace - White background dengan black text
	sketchybar --set "space.$WORKSPACE_ID" \
		background.color=$ACTIVE_BG \
		background.drawing=on \
		label.color=$ACTIVE_TEXT \
		background.shadow.drawing=on \
		background.shadow.color=0x44000000 \
		background.shadow.angle=270 \
		background.shadow.distance=2
elif [ "$WINDOW_COUNT" -gt 0 ]; then
	# HAS APPS - Medium gray dengan black text
	sketchybar --set "space.$WORKSPACE_ID" \
		background.color=$HAS_APP_BG \
		background.drawing=on \
		label.color=$HAS_APP_TEXT \
		background.shadow.drawing=off
else
	# INACTIVE workspace - Dark background dengan white text
	sketchybar --set "space.$WORKSPACE_ID" \
		background.color=$INACTIVE_BG \
		background.drawing=on \
		label.color=$INACTIVE_TEXT \
		background.shadow.drawing=off
fi
