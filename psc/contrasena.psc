Algoritmo Contrase�a
	clave <- 'jijijija'
	Repetir
		Si a<>clave Entonces
			Escribir 'Dime la contrase�a'
			Leer a
			Si a=clave Entonces
				Escribir 'Contrase�a correcta'
			SiNo
				Escribir 'incorrecta '
			FinSi
		SiNo
		Fin Si
	 
	Hasta Que a=clave
	Escribir 'Acceso permitido'
FinAlgoritmo

