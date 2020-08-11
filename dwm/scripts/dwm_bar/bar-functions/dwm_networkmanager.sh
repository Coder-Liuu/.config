#!/bin/sh

# Dependencies: NetworkManager, curl
dwm_networkmanager () {
    CONNAME=$(nmcli -a | grep 'Wired connection' | awk 'NR==1{print $1}')
    if [ "$CONNAME" = "" ]; then
        CONNAME=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -c 5-)
    fi

    PRIVATE=$(nmcli -a | grep 'inet4 192' | awk '{print $2}')

    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        printf "🌐 %s %s %s" "$CONNAME" "$PRIVATE" 
    else
        printf "NET %s %s %s" "$CONNAME" "$PRIVATE"
    fi
    printf "%s\n" "$SEP2"
}

dwm_networkmanager
