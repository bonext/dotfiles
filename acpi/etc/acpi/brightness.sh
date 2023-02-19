#!/bin/bash

case "$1" in
	video/brightnessup)
		/usr/bin/brillo -q -A 5 -u 150000
		;;
	video/brightnessdown)
		/usr/bin/brillo -q -U 5 -u 150000
		;;
	*)
		logger "$0: ACPI action undefined: $1 $2 $3"
		;;
esac

