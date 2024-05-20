#!/bin/bash

# Options to be displayed
option0=" Shutdown"
option1=" Reboot"

# Options passed into variable
options="$option0\n$option1"

chosen="$(echo -e "$options" | rofi -dmenu -theme ~/.config/rofi/display/menu/powermenu.rasi -p "System Session")"

case $chosen in
    $option0)
	    systemctl poweroff;;
    $option1)
	    systemctl reboot;;
      
esac
