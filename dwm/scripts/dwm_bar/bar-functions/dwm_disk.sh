#!/bin/sh

dwm_disk () {
    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        printf "💽 %s" "$(df | grep '/dev/'| awk 'FNR == 1 { print $5 }')"
    else
        printf "DISK %s" "$(df | grep '/dev/'| awk 'FNR == 1 { print $5 }')"
    fi
    printf "%s\n" "$SEP2"
}

dwm_disk
