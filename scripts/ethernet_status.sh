#!/bin/sh

# Comprobar la dirección IP de eth0
IP_ETH0=$(ip addr show eth0 | grep "inet " | awk '{print $2}' | cut -d/ -f1)

# Si no hay dirección IP en eth0, intentar con wlan0
if [ -z "$IP_ETH0" ]; then
    IP_WLAN0=$(ip addr show wlan0 | grep "inet " | awk '{print $2}' | cut -d/ -f1)
    if [ -n "$IP_WLAN0" ]; then
        echo "%{F#ffffff}  %{F#ffffff}$IP_WLAN0%{u-}"
    else
        echo "%{F#ff0000}  %{F#ff0000}No IP found on wlan0%{u-}"
    fi
else
    echo "%{F#ffffff}  %{F#ffffff}$IP_ETH0%{u-}"
fi
