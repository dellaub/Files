#-------------------------------------------------
#------	OPERATIONS -------------------------------
#--												--
#--		+ ---plus								--
#--		- ---moins								--
#--		* ---multiplication						--
#--		/ ---division							--
#--		** --exposant(puissance)				--
#--												--
#-------------------------------------------------	
#-------------------------------------------------
#Demander le type de opération

operation = input("Choisissez une opération (+)(-)(*)(/)(%)(^) : ")

#addition 		(x + y)

if operation == '+':

	num1 = input('Choisissez X: ')
	num2 = input('Choisissez Y: ')

	print(num1,"+",num2)
	print(float(num1) + float(num2))

#soustraction 		(x - y)

if operation == '-':
	
	num1 = input('Choisissez X: ')
	num2 = input('Choisissez Y: ')

	print(num1,"-",num2)
	print(float(num1) - float(num2))

#multiplication 	(x * y)

if operation == '*':

	num1 = input('Choisissez X: ')
	num2 = input('Choisissez Y: ')

	print(num1,"*",num2)
	print(float(num1) * float(num2))

#division 		(x / y)

if operation == '/':

	num1 = input('Choisissez X: ')
	num2 = input('Choisissez Y: ')

	print(num1,"/",num2)
	print(float(num1) / float(num2))

#pourcentage 		(P * C) / 100

if operation == "%":

	pourcentage = input("quel pourcentage ?: ")
	combien = input("de combien ?: ")
	cent = 100

	print(pourcentage,"%","de",combien,"c'est,")
	print((float(pourcentage) * float(combien)) / float(cent),)

#exposant 		(n ** e) 

if operation == "^":

	Numero = input("Choisissez Numéro: ")
	exposant = input("exposant: ")

	print(Numero,"exposant à",exposant,"c'est")
	print(float(Numero) ** float(exposant))



