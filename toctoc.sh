#!/bin/bash
for IP in 192.168.1.{1..10}
do
   ping -c 1 -t 1 "$IP" >/dev/null 2>&1 &&
   echo "La IP $IP : ok" ||
   echo "La IP $IP : nop"
done 
