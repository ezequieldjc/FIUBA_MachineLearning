lista = ['cant_hab', 'cant_bath', 'superficie', 'precio']

lista.pop(-1)
lista.pop(-1)

formula = 'precio ~ superficie'

for x in lista:
    formula += ' + ' + x 
    print (formula)