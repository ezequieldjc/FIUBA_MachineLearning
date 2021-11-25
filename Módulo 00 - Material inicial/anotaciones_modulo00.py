############################################################
#Listas:
    #Permiten varios tipos de datos

lista1 = ['hola', 1 , 'hola mundo', True]
print(lista1)

print(lista1[0])

print(lista1[0:2])

lista1.append(False)
print(lista1)

#Imprime el ultimo valor de la lista
print(lista1[-1])

lista2 = ['True', 2, 'False']

lista3 = lista1 + lista2

print(lista3)

#devuelve desde el 4to al 7mo elemento
print(lista3[3:6])

#devuelve desde el primero hasta el 3er elemento
print(lista3[:2])

#['hola', 1, 'hola mundo', True, False, 'True', 2, 'False']
#con un tercer argumento le puedo decir en que sentido recorrerla (-1, 1)
# ademas le puedo indicar los saltos
print(lista3)
print(lista3[6: 3: -1])
print(lista3[2: 6: 2])

#obtener la primer ocurrencia de un elemento
print(lista3.index('hola mundo'))

#eliminar el n-esimo elemento
elemento_borrado = lista3.pop(0)
print(lista3)
print(elemento_borrado)


#Comando Set:
    #devuelve los valores unicos de una lista

lista4 = ['hola', 'mundo', 'mundo', 2, 4, 'hola' ]
print(lista4)
print(set(lista4))

############################################################
#Diccionarios
    #almacena datos en pares (clave, valor)
    #coleccion ordenada, modificable y no admite duplicados

#definir un diccionario
diccionario1 = {'nombre':'_nombre',
                'apellido': '_apellido',
                'edad': 22,
                'trabaja': True
                }
                
print(diccionario1)

#diccionario.keys() devuelve las claves
print(diccionario1.keys())
#diccionario.values() devuelve los valores
print(diccionario1.values())

#cambiar el valor de una clabe
diccionario1['apellido']= '__apellido'
print(diccionario1)
print(diccionario1['apellido'])

#acceder a todas las claves del diccionario
for x in diccionario1:
    print(x)

for x in diccionario1.items():
    print(x)

#Agregar un key-value al diccionario
diccionario1['Sexo']='Masculino'
print(diccionario1)