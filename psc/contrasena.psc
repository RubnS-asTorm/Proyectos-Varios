Algoritmo Contraseņa
	clave <- 'jijijija'
	Repetir
		Si a<>clave Entonces
			Escribir 'Dime la contraseņa'
			Leer a
			Si a=clave Entonces
				Escribir 'Contraseņa correcta'
			SiNo
				Escribir 'incorrecta '
			FinSi
		SiNo
		Fin Si
	 
	Hasta Que a=clave
	Escribir 'Acceso permitido'
FinAlgoritmo

