Algoritmo random
	Escribir "Escoge una dificultad para adivinar un n�mero."
	Escribir "Escribe; f�cil, si quieres una dificultad baja. Escribe; dif�cil, si quieres una dificultad alta pero disfrutable, o; insano, si quieres una dificultad mayor, rozando lo imposible."
	leer d
	Segun d Hacer
		"f�cil":
			m=Aleatorio(1,20)
			Escribir "Dime un n�mero entre el 1 y el 20."
			leer a 
			Repetir
				Si a<m Entonces
					Escribir "El n�mero es mayor."
				SiNo
					Escribir "El n�mero es menor."
					
				FinSi
				leer a
			Hasta Que a=m 
			Escribir "Has adivinado el n�mero, felicidades."
		"dif�cil":
			m=Aleatorio(1,1000)
			Escribir "Dime un n�mero entre el 1 y el 1000."
			leer a 
			Repetir
				Si a<m Entonces
					Escribir "El n�mero es mayor."
				SiNo
					Escribir "El n�mero es menor."
					
				FinSi
				leer a
			Hasta Que a=m 
			Escribir "Has adivinado el n�mero, felicidades."
		"insano":
			m=Aleatorio(1,1000000)
			Escribir "Dime un n�mero entre el 1 y el 1000000."
			leer a 
			Repetir
				Si a<m Entonces
					Escribir "El n�mero es mayor."
				SiNo
					Escribir "El n�mero es menor."
					
				FinSi
				leer a
			Hasta Que a=m 
			Escribir "Has adivinado el n�mero, felicidades."
		De Otro Modo:
			Escribir "Debes de elegir una dificultad."
	Fin Segun
FinAlgoritmo
