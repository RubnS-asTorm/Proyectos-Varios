Algoritmo aleatoriooo
	Escribir "Escoge una dificultad"
	Escribir "Escribe; f�cil, dif�cil, muy dificil"
	leer d
	Segun d Hacer
		"f�cil":
			m=Aleatorio(1,20)
			Escribir "N�mero entre el 1 y 20."
			leer a 
			Repetir
				Si a<m Entonces
					Escribir "El n�mero es mayor."
				SiNo
					Escribir "El n�mero es menor."
					
				FinSi
				leer a
			Hasta Que a=m 
			Escribir "El numero se adivin�."
		"dif�cil":
			m=Aleatorio(1,1000)
			Escribir "N�mero entre el 1 y 1000."
			leer a 
			Repetir
				Si a<m Entonces
					Escribir "El n�mero es mayor."
				SiNo
					Escribir "El n�mero es menor."
					
				FinSi
				leer a
			Hasta Que a=m 
			Escribir "El numero se adivin�."
		"muy dificil":
			m=Aleatorio(1,1000000)
			Escribir "N�mero entre el 1 y 1000000."
			leer a 
			Repetir
				Si a<m Entonces
					Escribir "El n�mero es mayor."
				SiNo
					Escribir "El n�mero es menor."
					
				FinSi
				leer a
			Hasta Que a=m 
			Escribir "El numero se adivin�."
		De Otro Modo:
			Escribir "Elige una dificultad."
	Fin Segun
FinAlgoritmo
