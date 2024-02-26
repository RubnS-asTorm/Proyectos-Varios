Algoritmo aleatoriooo
	Escribir "Escoge una dificultad"
	Escribir "Escribe; fácil, difícil, muy dificil"
	leer d
	Segun d Hacer
		"fácil":
			m=Aleatorio(1,20)
			Escribir "Número entre el 1 y 20."
			leer a 
			Repetir
				Si a<m Entonces
					Escribir "El número es mayor."
				SiNo
					Escribir "El número es menor."
					
				FinSi
				leer a
			Hasta Que a=m 
			Escribir "El numero se adivinó."
		"difícil":
			m=Aleatorio(1,1000)
			Escribir "Número entre el 1 y 1000."
			leer a 
			Repetir
				Si a<m Entonces
					Escribir "El número es mayor."
				SiNo
					Escribir "El número es menor."
					
				FinSi
				leer a
			Hasta Que a=m 
			Escribir "El numero se adivinó."
		"muy dificil":
			m=Aleatorio(1,1000000)
			Escribir "Número entre el 1 y 1000000."
			leer a 
			Repetir
				Si a<m Entonces
					Escribir "El número es mayor."
				SiNo
					Escribir "El número es menor."
					
				FinSi
				leer a
			Hasta Que a=m 
			Escribir "El numero se adivinó."
		De Otro Modo:
			Escribir "Elige una dificultad."
	Fin Segun
FinAlgoritmo
