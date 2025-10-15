#!/bin/bash

# Get memory info using vm_stat (most accurate method)
VM_STAT=$(vm_stat)

# Extract pages and remove dots/commas
PAGES_FREE=$(echo "$VM_STAT" | awk '/Pages free:/ {gsub(/[^0-9]/, "", $3); print $3}')
PAGES_ACTIVE=$(echo "$VM_STAT" | awk '/Pages active:/ {gsub(/[^0-9]/, "", $3); print $3}')
PAGES_INACTIVE=$(echo "$VM_STAT" | awk '/Pages inactive:/ {gsub(/[^0-9]/, "", $3); print $3}')
PAGES_SPECULATIVE=$(echo "$VM_STAT" | awk '/Pages speculative:/ {gsub(/[^0-9]/, "", $3); print $3}')
PAGES_WIRED=$(echo "$VM_STAT" | awk '/Pages wired down:/ {gsub(/[^0-9]/, "", $4); print $4}')
PAGES_COMPRESSED=$(echo "$VM_STAT" | awk '/Pages stored in compressor:/ {gsub(/[^0-9]/, "", $5); print $5}')

# Set defaults if empty
PAGES_FREE=${PAGES_FREE:-0}
PAGES_ACTIVE=${PAGES_ACTIVE:-0}
PAGES_INACTIVE=${PAGES_INACTIVE:-0}
PAGES_SPECULATIVE=${PAGES_SPECULATIVE:-0}
PAGES_WIRED=${PAGES_WIRED:-0}
PAGES_COMPRESSED=${PAGES_COMPRESSED:-0}

# Calculate memory usage (matching btop calculation)
# Used = Active + Wired + Compressed (same as btop/htop)
# Available = Free + Inactive + Speculative
USED_PAGES=$((PAGES_ACTIVE + PAGES_WIRED + PAGES_COMPRESSED))
AVAILABLE_PAGES=$((PAGES_FREE + PAGES_INACTIVE + PAGES_SPECULATIVE))
TOTAL_PAGES=$((USED_PAGES + AVAILABLE_PAGES))

# Calculate percentage
if [ $TOTAL_PAGES -gt 0 ]; then
	RAM_PERCENT=$(awk "BEGIN {printf \"%.0f\", ($USED_PAGES/$TOTAL_PAGES)*100}")
else
	RAM_PERCENT=0
fi

# Ensure valid number
if ! echo "$RAM_PERCENT" | grep -qE '^[0-9]+$'; then
	RAM_PERCENT=0
fi

sketchybar --set $NAME label="􀐱$RAM_PERCENT%"
