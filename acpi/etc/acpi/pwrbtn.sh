#!/bin/bash
# reboot
case "$2" in
    PBTN)
	reboot
	;;
    *)
	logger "$0: ACPI action undefined: $1 $2 $3"
        ;;
esac
