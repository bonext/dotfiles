.PHONY: apply-colors

pollen_pp := waybar/.config/waybar/style.css fuzzel/.config/fuzzel/fuzzel.ini gtklock/.config/gtklock/style.css niri/.config/niri/config.kdl
apply-colors:
	raco pollen render $(pollen_pp)
