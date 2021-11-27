import pandas as pd 

df = pd.read_excel('/Users/ezequieldjemdjemian/Documents/github/FIUBA_MachineLearning/Módulo 00 - Material inicial/clase1.xlsx')
"""
#metodos de dataframe
    #head() -> devuelve la primer parte del dataframe
print(df.head())
    #info() -> devuelve informacion sobre las columnas
print(df.info())    
    #shape -> debvuelve el tamano del dataframe (fxc)
print(df.shape)
    #describe() -> describe estadisticamente las columnas del df (media, moda, min, max, etc)
print(df.describe())
    #tail() -> devuelve la ultima parte del df
print(df.tail())
    #df["nombreColumna"] -> hace referecia a una columna del df
print(df["Cliente"])
    #set(df["nombreColumna"]) -> devuelve un diccionario del df, devolviendo los valroes unicos del mismo. es como 'select distinct nombrecolumna'
print(set(df["Cliente"]))
"""

################################################################
### Partes de un df; {.values , .columns, .index}

#print(df.values)
#print(df.columns) 

#print(df.index) # -> RangeIndex(start=0, stop=8, step=1)

#Valores unicos:
"""
print(df['Fruta'].unique)
print(set(df['Fruta']))
"""
#print(df.sort_values("Cantidad", ascending=False))

#print(df[["Fruta", "Cliente"]])

#FILTRAR DATOS
#compras_juan = df['Cliente']=='Juan'
#print(df[compras_juan])
#Se puede resolver en una sola linea:
#print ( df[df['Cliente']=='Juan']) 
#filtrar por dos campos:
#print(df[(df['Fruta']=='Manzana') & (df['Cliente']=='Juan')])

#Eliminar duplicados
#df_sinduplicados=df.drop_duplicates()

################################################################
#Group by
#print(df.groupby('Fruta')['Cantidad'].sum())

#print(df.groupby('Cliente')['Cantidad'].sum())

#print(df.groupby('Cliente')['Cantidad'].mean())

#agrupar por mas de una columna;
#print(df.groupby(['Fruta','Cliente'])['Cantidad'].sum())

#Nuevas columnas
#df['Nueva_Columna']=df['Cantidad']*3

#print(df) 
################################################################
#Creo un diccionario
diccionario = {
    'Ciudad': ['Buenos Aires', 'Rosario'],
    'Temperatura': [18,19],
    'Humedad': [0.76,0.87]
}

diccionario['Ciudad'].append('Mar del plata')
diccionario['Temperatura'].append(17)
diccionario['Humedad'].append(0.54)

print(diccionario)

#Crear un df a partir del diccionario

df2 = pd.DataFrame(diccionario)

print(df2)