Algoritmo Contraseña
	clave <- 'jijijija'
	Repetir
		Si a<>clave Entonces
			Escribir 'Dime la contraseña'
			Leer a
			Si a=clave Entonces
				Escribir 'Contraseña correcta'
			SiNo
				Escribir 'incorrecta '
			FinSi
		SiNo
		Fin Si
	 
	Hasta Que a=clave
	Escribir 'Acceso permitido'
FinAlgoritmo

