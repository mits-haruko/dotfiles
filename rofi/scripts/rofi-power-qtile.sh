#!/bin/sh


Shutdown_command="systemctl poweroff"
Reboot_command="systemctl reboot"
#Logout_command="bspc quit"
#Hibernate_command="systemctl hibernate"
Suspend_command="systemctl suspend"
Lock_command="betterlockscreen -l blur"
Back_command=""

# you can customise the rofi command all you want ...
rofi_command="rofi -theme /home/napo/.config/rofi/launcherSmoll.rasi"
options=$'Suspend\nLock\nReboot\nShutdown\nBack' 

# ... because the essential options (-dmenu and -p) are added here
eval \$"$(echo "$options" | $rofi_command -dmenu -p "")_command"
