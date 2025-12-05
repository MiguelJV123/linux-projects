#!/bin/bash
# scan_lan_auto.sh

# File to store current and prevoius scan

CURRENT=~/lan_current.txt
PREVIOUS=~/lan_previous.txt

# Scan the network
nmap -sn 192.168.1.0/24 > $CURRENT

# Compare with previous scan
if [ -f $PREVIOUS ]; then
	NEW_DEVICES=$(diff $PREVIOUS $CURRENT | grep ">" | awk '{print $2,$3,$4}')
	if [ ! -z "$NEW_DEVICES" ]; then
		echo "New devices detected"
		echo "$NEW_DEVICES"

		# Desktop Notification
		notify-send "LAN Alert" "New devices detected;\n$NEW_DEVICES"

	else
		echo "No new devices"
	fi
else
	echo "First scan done."
fi

# Save current scan for next comparison
cp $CURRENT $PREVIOUS

