dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY &
#pipewire &
sxhkd &
exec dbus-launch --exit-with-session sway --unsupported-gpu
#exec dbus-launch --exit-with-session compiz
#exec dbus-launch --exit-with-session bspwm
