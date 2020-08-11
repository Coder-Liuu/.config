#!/bin/sh

# Store the directory the script is running from
LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")

# Requires a font with adequate unicode character support
export IDENTIFIER="unicode"

# Change the charachter(s) used to seperate modules. If two are used, they will be placed at the start and end.
export SEP1="["
export SEP2="]"

# Import the modules
. "$DIR/bar-functions/dwm_date.sh"
. "$DIR/bar-functions/dwm_battery.sh"



# Update dwm status bar every second
while true
do
    xsetroot -name "$(dwm_date)$(dwm_battery)"
    sleep 1
done
