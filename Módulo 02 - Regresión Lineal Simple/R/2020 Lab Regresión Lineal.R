library(MASS)
library(ISLR)

#Conjunto de datos #Boston, que registra medv (mediana del valor de un inmueble) para 506 
#inmuebles alrededor de Boston

Boston <- MASS::Boston
names(MASS::Boston)

str(Boston)

View(Boston)

#Ahora graficaremos medv e lstat junto con la regresi�n de m�nimos cuadrados
#l�nea usando las funciones plot () y abline ()

lstat <- Boston$lstat
medv <- Boston$medv

plot(lstat,medv)


#Comenzaremos utilizando la funci�n lm () para ajustar una regresi�n lineal simple 
#El modelo tiene medv como la respuesta y lstat como el predictor



lm.fit = lm(medv ~ lstat,data=Boston)


#invocando al modelo "lm.fit"  se genera informaci�n b�sica sobre el modelo

lm.fit

#Como el modelo lm.fit es de su propia clase, y esta clase en s� es una lista, entonces podemos 
# usar la funci�n de names() para descubrir qu� otra informaci�n se almacenan en lm.fit.

class(lm.fit)
names(lm.fit)


#Para ver los coeficientes
lm.fit$coefficients

#Para ver los residuos
lm.fit$residuals

#Para ver toda la regresi�n
sum = summary(lm.fit)

names(summary(lm.fit))

r2_aj = sum$adj.r.squared
r2_aj


#######VER DETALLES DE SUMMARY con $ y GRAFICAR

plot(lstat,medv)
abline(lm.fit, col="red")



#Para hacer una estimaci�n con lstat=5

predict (lm.fit, data.frame("lstat"=5))



#para hacer varias estimaciones, con estimacion por intervalos
#se predice sobre la media de todas las estimaciones
predict(lm.fit,data.frame(lstat=(c(5,10,15))), interval="confidence")

#para hacer varias estimaciones, con estimacion por predicci�n de la variable
#se utiliza para una prediccion sobre un caso puntual que se quiere predecir
predict(lm.fit,data.frame(lstat=(c(5,10,15))), interval="prediction")





