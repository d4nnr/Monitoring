#!/bin/bash
echo 'C0NF1GUR4ND0 F1R3W411'
echo 'LIMPIANDO IPTABLES'
iptables -Z
iptables -F
iptables -A INPUT -s 0/0 -d localhost -p tcp --dport 1:1024 -j DROP
#echo '# Denegando el ping #'
iptables -A INPUT -p icmp -j DROP
#echo ''
#iptables -t filter -A INPUT -p tcp -s 0/0 -d localhost --dport 25 -j DROP

echo '## Blocking portscan ##'
# Attempt to block portscans
# Anyone who tried to portscan us is locked out for an entire day.
iptables -A INPUT   -m recent --name portscan --rcheck --seconds 86400 -j DROP
iptables -A FORWARD -m recent --name portscan --rcheck --seconds 86400 -j DROP

# Once the day has passed, remove them from the portscan list
iptables -A INPUT   -m recent --name portscan --remove
iptables -A FORWARD -m recent --name portscan --remove

# These rules add scanners to the portscan list, and log the attempt.
iptables -A INPUT   -p tcp -m tcp --dport 139 -m recent --name portscan --set -j LOG --log-prefix "Portscan:"
iptables -A INPUT   -p tcp -m tcp --dport 139 -m recent --name portscan --set -j DROP

iptables -A FORWARD -p tcp -m tcp --dport 139 -m recent --name portscan --set -j LOG --log-prefix "Portscan:"
iptables -A FORWARD -p tcp -m tcp --dport 139 -m recent --name portscan --set -j DROP

echo '## Spoofed Invalid packets ##'

# Reject spoofed packets
# These adresses are mostly used for LAN's, so if these would come to a WAN-only server, drop them.
iptables -A INPUT -s 10.0.0.0/8 -j DROP
iptables -A INPUT -s 169.254.0.0/16 -j DROP
iptables -A INPUT -s 172.16.0.0/12 -j DROP
iptables -A INPUT -s 127.0.0.0/8 -j DROP

#Multicast-adresses.
iptables -A INPUT -s 224.0.0.0/4 -j DROP
iptables -A INPUT -d 224.0.0.0/4 -j DROP
iptables -A INPUT -s 240.0.0.0/5 -j DROP
iptables -A INPUT -d 240.0.0.0/5 -j DROP
iptables -A INPUT -s 0.0.0.0/8 -j DROP
iptables -A INPUT -d 0.0.0.0/8 -j DROP
iptables -A INPUT -d 239.255.255.0/24 -j DROP
iptables -A INPUT -d 255.255.255.255 -j DROP

# Drop all invalid packets
iptables -A INPUT -m state --state INVALID -j DROP
iptables -A FORWARD -m state --state INVALID -j DROP
iptables -A OUTPUT -m state --state INVALID -j DROP

echo '#### Stop smurf attacks ####'

#iptables -A INPUT -p icmp -m icmp --icmp-type address-mask-request -j DROP
#iptables -A INPUT -p icmp -m icmp --icmp-type timestamp-request -j DROP
#iptables -A INPUT -p icmp -m icmp -j DROP

# Drop excessive RST packets to avoid smurf attacks
#iptables -A INPUT -p tcp -m tcp --tcp-flags RST RST -m limit --limit 2/second --limit-burst 2 -j ACCEPT

echo '##### Block ICMP (aka ping) #####'

# Don't allow pings through
#iptables -A INPUT -p icmp -m icmp --icmp-type 8 -j DROP
#echo '#################################'
echo '----------------------------------'
echo '/#///#/-IPTABLES OK D4nnR-/#///#/'
echo '----------------------------------'
