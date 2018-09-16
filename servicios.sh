#!/bin/bash
 
# Lista de servicios
SERVICIOS=(Mysqld)
 
# Funcion para inicializar/reiniciar servicios
function servicioInit (){
if ! service $1 status &>/dev/null; then
echo -n -e "\tIniciando $1 ..."
service $1 start &>/dev/null
echo 'Ok ...'
else
echo -n -e "\t $1 esta corriendo, pero reiniciando servicio..."
service $1 restart &>/dev/null
echo 'Ok ...'
fi
}

for ((i=0; i<${#SERVICIOS[*]}; i++)) do   #if $estado = "start"; then   if [ -z $1 ]; then     echo "Verificando servicio: ${SERVICIOS[$i]} ->"
servicioInit ${SERVICIOS[$i]}
done
echo "Enviando mail para soporte"
echo "Queremos informarle que el servicio de Mysql fue reiniciado Exitosamente..." | mail -s "Succefull MySQL restarted" soporte@gmail.com
echo "enviado"
