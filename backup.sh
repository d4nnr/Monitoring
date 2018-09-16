#!/bin/bash

#Copia de seguridad

cd /home/sites/dicom.funlam.edu.co/www/ && rsync * -aqv --del /home/backupd4nnr/backupCompMoodleWWW/
