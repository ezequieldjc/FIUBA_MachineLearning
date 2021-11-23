#Para ajustar un modelo de regresión lineal múltiple utilizando mínimos cuadrados,
#de nuevo use la función lm (). La sintaxis lm (y~x1 + x2 + x3) se usa para ajustar un
#modelo con tres predictores, x1, x2 y x3. La función summary() ahora
#genera los coeficientes de regresión para todos los predictores.

library(MASS)
library(ISLR)

#Conjunto de datos #Boston, que registra medv (mediana del valor de un inmueble) para 506 
#inmuebles alrededor de Boston

Boston <- MASS::Boston
names(MASS::Boston)

lm.fit=lm(medv ~ lstat + age ,data=Boston)
summary(lm.fit)


#Eldataet  de Boston contiene 13 variables, por lo que sería engorroso
#tener que escribirlos a todos  para realizar una regresión usando todos los
#predictores. En cambio, podemos usar el sig atajo:

lm.fit=lm(medv ~ .,data=Boston)
summary(lm.fit)




#Como habíamos ya visto antes podemos acceder a los componentes individuales 
#de un objeto del tipo summary  por sus respectivos  nombres (escriba ?summary.lm para ver los elementos
#disponibles. Por ejemplo, summary(lm.fit)$r.sq nos da el R2 
#y summary(lm.fit)$sigma nos da el RSE.


# -->  ACTIVIDAD 1: hacer summary, ver la formula de regresión y preparar 
# un dataframe con los resultados de la regresion

names(summary(lm.fit))
summary(lm.fit)$r.squared

mod.reg = as.character(summary(lm.fit)$call)[2]
mod.r2_aj= summary(lm.fit)$r.squared


r2.ajustado = data.frame(modelo = mod.reg , r2_aj = mod.r2_aj, stringsAsFactors = F)





#Qué pasa si queremos probar la regresión múltiple pero sin un campo?
# -->  ACTIVIDAD 2: SACAR UN CAMPO Y ACTUALIZAR EL DATAFRAME CON LAS REGRESIONES













####################################################
# Interacción entre términos ############
####################################################

#Es fácil incluir términos de interacción en un modelo lineal utilizando la función lm().
#La sintaxis lstat: age le dice a R que incluya un término de interacción entre
#lstat y age  (o sea lstat x age). La sintaxis lstat*age incluye simultáneamente lstat, age,
#y el término de interacción lstat × age como predictores; es una forma abreviada de
#lstat + age + lstat: age.

lm.fit2 <-lm(medv~lstat*age,data=Boston)
summary(lm.fit2)
mod.reg = as.character(summary(lm.fit2)$call)[2]
mod.r2_aj= summary(lm.fit2)$r.squared




# -->  ACTIVIDAD 3:  ACTUALIAR EL DATAFRAME CON LAS REGRESIONES

r2.ajustado = rbind(r2.ajustado, list(mod.reg, mod.r2_aj))






####################################################
# Transformaciones no lineales de los predictores
####################################################

#dado un predictor X, podemos crear un predictor X^2
#usando I (X ^ 2). La función I () es necesaria ya que ^ tiene un significado especial

lm.fit3 = lm(medv ~ lstat + I(lstat^2),data=Boston)
summary(lm.fit3)

attach(Boston)


# y las predicciones
# -->  ACTIVIDAD 4:  ARMAR VECTOR DE PREDICCIONES

pred.fit3 = predict(lm.fit3, list(lstat = sort(Boston$lstat)))




# grafico ahora las predicciones para cada valor de lstat
par(mfrow=c(1,1))

# -->  ACTIVIDAD 5:  PLOTEAR Y FUNCION POINTS

attach(Boston)

plot(lstat, medv)

points(sort(lstat), pred.fit3, col='red', pch=20)






#las prediccines están ordenadas en función de sort(lstat)
head(lstat)
head(sort(lstat))
head(pred.fit3)

# -->  ACTIVIDAD 6:  PLOTEAR EN FORMA CORRECTA











# probemos con un plinomio de grado 4
# aquí pudo omitir data=Boston porque cargué el dataset con attach

lm.fit4 <- lm(medv ~ poly(lstat, 4))
mod.reg = as.character(summary(lm.fit4)$call)[2]
mod.r2_aj = summary(lm.fit4)$r.squared
r2.ajustado = rbind(r2.ajustado, list(mod.reg, mod.r2_aj))
summary(lm.fit4)
# -->  ACTIVIDAD 7: ARMAR PREDICTOR, PLOTEAR, Y CARGAR EN DATFRAME DE REGRESION

pred.fit4 = predict(lm.fit4, list(lstat=Boston$lstat))

points(lstat, pred.fit4, col='green', pch=20)







# -->  ACTIVIDAD 8: COMPLETO pOLINOMIO DE GRADO 8 Y GRADO 16

lm.fit5 = lm(medv ~ poly(lstat, 8), data=Boston)
mod.reg = as.character(summary(lm.fit5)$call)[2]
mod.r2_aj = summary(lm.fit5)$r.squared
r2.ajustado = rbind(r2.ajustado, list(mod.reg, mod.r2_aj))

pred.fit5 = predict(lm.fit5, list(lstat=Boston$lstat))
points(lstat, pred.fit5, col='blue', pch=20)


lm.fit2 = lm(medv ~ poly(lstat, 2), data=Boston)
mod.reg = as.character(summary(lm.fit2)$call)[2]
mod.r2_aj = summary(lm.fit2)$r.squared
r2.ajustado = rbind(r2.ajustado, list(mod.reg, mod.r2_aj))

pred.fit2 = predict(lm.fit2, list(lstat=Boston$lstat))
points(lstat, pred.fit2, col='yellow', pch=20)


lm.fit18 = lm(medv ~ poly(lstat, 18), data=Boston)
mod.reg = as.character(summary(lm.fit18)$call)[2]
mod.r2_aj = summary(lm.fit18)$r.squared
r2.ajustado = rbind(r2.ajustado, list(mod.reg, mod.r2_aj))

pred.fit18 = predict(lm.fit18, list(lstat=Boston$lstat))
points(lstat, pred.fit18, col='grey', pch=20)



###############################################
# polinomial múltiple
###############################################

lm.pol.mult <- lm(medv ~ poly(lstat, 2)+poly(age,3))

# -->  ACTIVIDAD 9: ARMAR PREDICTOR, PLOTEAR, Y CARGAR EN DATFRAME DE REGRESION
mod.reg = as.character(summary(lm.fit18)$call)[2]
mod.r2_aj = summary(lm.fit18)$r.squared
r2.ajustado = rbind(r2.ajustado, list(mod.reg, mod.r2_aj))
pred.pol.mult = predict(lm.pol.mult, list(lstat=Boston$lstat, age=Boston$age))

points(lstat, pred.pol.mult, col='blue', pch=20)


summary(lm.pol.mult)



# -->  ACTIVIDAD 10: CORREGIR Y PLOTTEAR




#Por supuesto, no estamos de ninguna manera restringidos al uso de transformaciones polinomiales
#de los predictores. Aquí intentamos una transformación logaritimca.

lm.log = lm(medv~log(lstat),data=Boston)
summary(lm.log)

mod.reg = as.character(summary(lm.log)$call)[2]
mod.r2_aj = summary(lm.log)$r.squared
names(summary(lm.log))


# y también,porque no, aplicar una transformación sobre la variable objetivo
lm.log.obj = lm(log(medv)~poly(lstat, 4),data=Boston)
summary(lm.log.obj)
# -->  ACTIVIDAD 11: ARMAR PREDICTOR, PLOTEAR, Y CARGAR EN DATFRAME DE REGRESION
