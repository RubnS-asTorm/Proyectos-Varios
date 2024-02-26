Algoritmo contraseña:)
	a="contraseña"
	c=0
		repetir
			Escribir "Introducir clave"
			leer b
			Si b=a Entonces
				Escribir "acceso permitido"
			SiNo
				Escribir "acceso dendegado"
				c=c+1
				si c=1 Entonces
					escribir "quedan 2 intentos"
				sino c=c
					si c=2 Entonces
						escribir "queda 1 intento"
					sino c=c
					FinSi
				FinSi
			FinSi
		Hasta Que b=a o c=3 
FinAlgoritmo
