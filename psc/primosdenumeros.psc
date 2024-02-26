Algoritmo numeros
	Escribir "Introduce un número para saber si es primo."
	leer a 
	d=0
Para c<-1 Hasta a Con Paso 1 Hacer
			b= a MOD c
			Si b = 0 Entonces
				d=d+1 
			FinSi
		Fin Para	
			Si d>2 Entonces
				Escribir "No número primo."
			SiNo 		
				Escribir "Es número primo."
			FinSi
FinAlgoritmo
