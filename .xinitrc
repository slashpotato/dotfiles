dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY &
sxhkd &
exec dbus-launch --exit-with-session bspwm
