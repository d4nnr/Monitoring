#!/bin/bash
#Color
ESC_SEQ="\x1b["
RESET=$ESC_SEQ"39;49;00m"
RED=$ESC_SEQ"31;01m"
GREEN=$ESC_SEQ"32;01m"
YELLOW=$ESC_SEQ"33;01m"
CYAN=$ESC_SEQ"36;01m"

	echo -e "$YELLOW###########################$RESET"
	echo -e "$YELLOW##### CONFIGURACION #######$RESET"
	echo -e "$YELLOW########## RED ############$RESET"
	echo -e "$YELLOW###########################$RESET"

/etc/init.d/network-manager stop >> /dev/null 2>&1 && echo -e "$CYAN --Stop Network manager   $RESET""$GREEN [OK]$RESET"
ifdown wlan1  >> /dev/null 2>&1 &&                    echo -e "$CYAN --Wlan1                  $RESET""$RED [Stop]$RESET"
						      echo -e "$CYAN --Dns Google Conf        $RESET""$GREEN [OK] $RESET"
	echo "nameserver 8.8.8.8" > /etc/resolv.conf
	echo "nameserver 8.8.4.4" >> /etc/resolv.conf
iw reg set BO && iwconfig wlan1 txpower 20 &&         echo -e "$CYAN --Configuration  Wlan1   $RESET""$GREEN [OK]$RESET"

echo -e "$CYAN --Dhclient ... $RESET"
ifup wlan1 >> /dev/null 2>&1 ||  		      echo -e "                                       $RED [FAILED]$RESET"
sleep 3

echo -e "$CYAN --IP:$RESET" && ifconfig wlan1 | grep addr | awk '{ print $2 }' | cut -c 6-18

echo -e "$GREEN Test Network  $RESET"

if ping -c2  8.8.8.8 >> /dev/null 2>&1
then
	echo -e "$GREEN --[OK] :D--  $RESET"
else
	echo -e "$RED  --[FAILED]-- $RESET"
fi
