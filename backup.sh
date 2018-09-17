#!/bin/bash

#Copia de seguridad

cd /home/sites/edu.co/www/ && rsync * -aqv --del /home/backupd4nnr/backupCompMoodleWWW/
