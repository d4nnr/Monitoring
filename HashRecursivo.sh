#!/bin/sh

#Entro en variable nombre de la carpeta a sacar hash
read -p "Escribir nombre de la carpeta: " Carpeta
  echo "#/#/# Ingresando a la carpeta para obtener hash sha256 de cada archivo #/#/#"
sleep 2
  echo "/*/"
  echo "/*/"
#Ingreso a la carpeta para sacar hash recursivo
cd $Carpeta
  find . -type f -exec sha256sum {} \; >> HashDeTodosLosDocumentos.txt
cd ..
  echo "#/#/# Proceso finalizado #/#/#"
sleep 2
  echo "/*/"
  echo "/*/"
  echo "#/#/# Comprimiento carpeta y seguidamente asignar contraseña #/#/#"
sleep 2
  echo "/*/"
  echo "/*/"
#Comprimo la carpeta y asigno contrasela
zip -er $Carpeta.zip $Carpeta
sleep 2
  echo "/*/"
  echo "/*/"
  echo "#/#/# Listo! Carpeta comprimida y con contraseña #/#/#"
sleep 2
  echo "/*/"
  echo "/*/"
#Obtengo hash sha256 del archivo final
  echo "#/#/# Obteniendo el hash sha256 del archivo final #/#/#"
sha256sum $Carpeta.zip
