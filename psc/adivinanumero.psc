Algoritmo random
	Escribir "Escoge una dificultad para adivinar un número."
	Escribir "Escribe; fácil, si quieres una dificultad baja. Escribe; difícil, si quieres una dificultad alta pero disfrutable, o; insano, si quieres una dificultad mayor, rozando lo imposible."
	leer d
	Segun d Hacer
		"fácil":
			m=Aleatorio(1,20)
			Escribir "Dime un número entre el 1 y el 20."
			leer a 
			Repetir
				Si a<m Entonces
					Escribir "El número es mayor."
				SiNo
					Escribir "El número es menor."
					
				FinSi
				leer a
			Hasta Que a=m 
			Escribir "Has adivinado el número, felicidades."
		"difícil":
			m=Aleatorio(1,1000)
			Escribir "Dime un número entre el 1 y el 1000."
			leer a 
			Repetir
				Si a<m Entonces
					Escribir "El número es mayor."
				SiNo
					Escribir "El número es menor."
					
				FinSi
				leer a
			Hasta Que a=m 
			Escribir "Has adivinado el número, felicidades."
		"insano":
			m=Aleatorio(1,1000000)
			Escribir "Dime un número entre el 1 y el 1000000."
			leer a 
			Repetir
				Si a<m Entonces
					Escribir "El número es mayor."
				SiNo
					Escribir "El número es menor."
					
				FinSi
				leer a
			Hasta Que a=m 
			Escribir "Has adivinado el número, felicidades."
		De Otro Modo:
			Escribir "Debes de elegir una dificultad."
	Fin Segun
FinAlgoritmo
