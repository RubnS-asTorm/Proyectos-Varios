#########################################
#ZONA - VARIABLES
#########################################

entradaTeclado=""
entradaTeclado1=""
entradaTeclado2=""
i=1

#########################################
#ZONA - PROGRAMA PRINCIPAL
#########################################

clear

echo "================================="
echo "Hola, me llamo Alex y este es mi script."
echo "================================="

echo "¿Desea crear varios ficheros de forma automatizada? Teclee [Si] o [No]"
read entradaTeclado
echo "¡¡Ha introducido $entradaTeclado !!"

if [ $entradaTeclado = "Si" ] | [ $entradaTeclado = "SI" ] | [ $entradaTeclado = "si" ]; then 
	
	echo "¿Que nombre de fichero quiere crear? ej: MisDatos"
	read entradaTeclado1
	echo "¡¡Los ficheros se llamarán ($entradaTeclado1) !!"
	sleep 1
	echo "¿Cuantos ficheros quiere crear? (5-10)"
	read entradaTeclado2
	echo "¡¡Se crearán ($entradaTeclado2) ficheros !!"
	
	if [ $entradaTeclado2 -ge 5 ] && [ $entradaTeclado2 -le 10 ]; then
		while [ $entradaTeclado2 -gt 0 ]; do
			touch /tmp/$entradaTeclado1-$i.txt
			entradaTeclado2=$(($entradaTeclado2 - 1))
			i=$(($i + 1))
		done
	else
	echo "No pertenece al límite de 5-10 ficheros, no se creará ningún fichero"
	fi
	echo "Ficheros creados, le listaré todos los archivos creados."
	ls -l /tmp/$entradaTeclado1-*

elif [ $entradaTeclado = "No" ] | [ $entradaTeclado = "NO" ] | [ $entradaTeclado = "no" ]; then
	echo "No se crearán archivos, ha introducido $entradaTeclado"

else
	echo "No se crearán archivos, no me ha hecho caso ya que ha introducido $entradaTeclado"
fi

