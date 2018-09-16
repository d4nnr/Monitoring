#!/bin/sh
usersw=$(w | awk '{ print $1 }' && uptime | grep -ohe '[0-9.*] user[s,]')
loadavg=$(cat /proc/loadavg | awk '{print $1}')
limite=1.1
if [ "$loadavg" '>' "$limite" ]; then
	echo "Alerta de sobrecarga de procesos en 1 minuto, el loadaverage es mas de 1" $loadavg "y el numero de usuarios es" $usersw | mail -s "Alerta_LVG_DICOM" danielromogarcia@gmail.com
else
	echo $loadavg.'/'.$(date +/%m/%e/%k:%M) >> /var/log/load.log
	echo $usersw.'/'.$(date +/%m/%e/%k:%M) >> /var/log/load.log
fi 
exit 0
