#!/bin/bash
echo "##################################################################"
echo "###########  http://d4nnr.blogspot.com - By @D4nnR  #########"
echo "###########  Script para enviar Mail con o sin adjunto   #########"
echo "##################################################################"
##
read -p "#Para : " Para
read -p "#Texto : " Texto
read -p "#Asunto : " Asunto
echo "######## Si desea enviar adjunto especifique la /ruta/log.txt ########"
echo "######## De lo contrario deje el campo vacio y presione enter ########"
echo -n "Ruta del adjunto : "
read Ruta
##
while true; do
    read -p "Desea enviar adjunto? y o n : " yn
    case $yn in
        [Yy]* ) echo $Texto | mutt -s $Asunto $Para -a $Ruta; echo "Enviando correo con Adjunto"; exit;;
        [Nn]* ) echo $Texto | mail -s $Asunto $Para; echo "Enviando correo"; exit;;
        * ) echo "Seleccion y o n, es necesario";;
     esac
done
##
## Daniel Romo @D4nnR
## Danielromogarcia@gmail.com
## D4nnR.blogspot.com
##
