#########################################
#ZONA - VARIABLES
#########################################

tiempoDeEspera="4"
entradaTeclado=""

#########################################
#ZONA - PROGRAMA PRINCIPAL
#########################################

clear

echo "================================="
echo "Trabajo de actualiacion del SO terminado"
echo "Se reiniciara el dispositivo"
echo "================================="

echo "�Desea realizar la actualizacion? Teclee [Si] o [No]"
read entradaTeclado
echo "Ha introducido $entradaTeclado !!"

if [ $entradaTeclado = "Si" ]; then 
	echo "Ejecuta la Actualizacion"
	#sudo apt update
	#sudo apt upgrade -y
	#sudo apt autoremove
	#echo "Finalizado se reiniciara el dispositivo tras el tiempo de espera"
	#echo "================================="
	#sleep $tiempoDeEspera
	echo "Finalizado el tiempo de Espera se reiniciara el dispositivo"
	echo "================================="
while [ $tiempoDeEspera -gt 0 ]; do
	echo "Se reiniciar� el equipo en $tiempoDeEspera segundos !!"
	sleep 1
	tiempoDeEspera=$((tiempoDeEspera - 1 ))
done
	#reboot
elif [ $entradaTeclado = "No" ] | [ $entradaTeclado = "NO" ]; then
	echo "No se ejecuta la Actualizacion, ha introducido ($entradaTeclado)"
	sleep $tiempoDeEspera
	echo "================================="
	echo "Finalizado el tiempo de espera, no se reiniciara el dispositivo"
	echo "================================="
else
	echo "No se ejecuta la Actualizacion, no me ha hecho caso ya que ha introducido ($entradaTeclado)"
	sleep $tiempoDeEspera
	echo "================================="
	echo "Finalizado el tiempo de espera, no se reiniciara el dispositivo"
	echo "================================="
fi


