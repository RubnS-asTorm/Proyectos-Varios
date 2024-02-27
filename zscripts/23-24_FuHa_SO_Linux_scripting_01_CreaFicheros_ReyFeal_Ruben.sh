clear
echo "Hola, me llamo Ruben y este es mi script"

#########################################
#ZONA - VARIABLES
#########################################

tiempoEspera=2
entradaTeclado=""
w=1
entry1=""
entry2=""

#########################################
#ZONA - PROGRAMA PRINCIPAL
#########################################

echo "Desea crear varios ficheros de forma automatizada? [SI]"

if [ $entradaTeclado="Si" ] | [ $entradaTeclado="SI" ]; then 
	read entradaTeclado
	echo "Ha introducido $entradaTeclado !"
	sleep $tiempoEspera
	echo "Cuantos ficheros quiere crear? [5-10]"
	read entradaTeclado
	if [ $entradaTeclado-gt"5" ] | [ $entradaTeclado-lt"10" ]; then 
		sleep 1
		echo "Como quieres que se llamen los ficheros?"
		read entry1
		echo "Ha introducido $entry1!"
		sleep $tiempoEspera
		echo "Se llamaran $entry1"
		while [ $entradaTeclado -ge 1 ]; do
			echo "Se haran los siguientes ficheros!!"
			sleep 1
			touch /tmp/$entry1-$w.txt
			entradaTeclado=$(($entradaTeclado - 1))
			w=$(($w + 1))
		done
		echo "Ficheros creados"
	else 
		echo "No me hizo caso, debe hacer entre 5 y 10 ficheros($entradaTeclado)"
	fi
elif [ $entradaTeclado = "No" ] | [ $entradaTeclado = "NO" ]; then
	echo "hola"
fi