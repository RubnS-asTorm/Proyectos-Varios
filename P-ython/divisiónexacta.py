a=int(input("Dame el dividendo "))
b=int(input("Dame el divisor "))
r=a/b
x=a//b
if r<x or r>x:
    print ("No es exacto")
else:
    print ("Es exacto")