Algoritmo cajero
	a=1000
	Escribir "AbancaPeopleInProgress le saluda"
	Escribir "¿Qué acción desea llevar acabo?"
	Escribir "Para la retirada de su dinero, pulse 1. Para ingresar dinero, pulse 2. Para consultar el saldo restante, pulse 3"
	leer p
	Segun p Hacer
		"1":
			Escribir "¿Cuánto dinero desea retirar?"
			leer b 
			si b>300 Entonces
				Escribir "La cantidad que ha expresado es demasiada"
				leer c 
				a=a-c
				Escribir "Cantidad retirada, su saldo actual ", a
				Escribir "Vuelva pronto"
			sino 
				
				a=a-b
				Escribir "Cantidad retirada, saldo actual ", a
				Escribir "Vuelva pronto"
				
			FinSi
		"2":
			Escribir "¿Cuánto dinero desea ingresar?"
			leer d 
			a = d+a 
			Escribir "Cantidad ingresada, saldo actual ", a
			Escribir "Vuelva pronto"
		"3":
			Escribir "Saldo actual ", a "$"
	Fin Segun
FinAlgoritmo