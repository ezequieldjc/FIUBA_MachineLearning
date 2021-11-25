import pandas as pd 
df = pd.read_excel('/Users/ezequieldjemdjemian/Documents/github/FIUBA_MachineLearning/Módulo 00 - Material inicial/clase1.xlsx')

#metodos de dataframe
    #head() -> devuelve la primer parte del dataframe

    #info() -> devuelve informacion sobre las columnas
    #shape -> debvuelve el tamano del dataframe (fxc)
    #describe() -> describe estadisticamente las columnas del df (media, moda, min, max, etc)
    #tail() -> devuelve la ultima parte del df
    #df["nombreColumna"] -> hace referecia a una columna del df
    #set(df["nombreColumna"]) -> devuelve un diccionario del df, devolviendo los valroes unicos del mismo. es como 'select distinct nombrecolumna'

