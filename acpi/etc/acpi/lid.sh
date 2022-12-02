#!/bin/bash
# suspend to RAM on battery
# do nothing on AC
case "$3" in
    close)
	/usr/bin/run-on-bat systemctl suspend
	;;
    *)
	logger "$0: ACPI action undefined: $3"
        ;;
esac
