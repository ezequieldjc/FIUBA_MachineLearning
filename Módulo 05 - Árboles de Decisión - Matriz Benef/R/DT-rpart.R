#  ARBOLES DE DECISION
##########################

library(ISLR)
library(tree)

attach(Carseats)

str(Carseats)

hist(Sales)

#transformo la variable en factor. Si es mayor a 8 digo que son altas las ventas, 
# si no digo que son bajas

High <- ifelse(Sales>8, "Alta", "Baja")
Carseats2 <- data.frame(Carseats, High)

str(Carseats2)
table(High)

#  primer �rbol con todo el training

ad.Carseats <- tree(High ~ . -Sales, Carseats2)

summary(ad.Carseats)
plot(ad.Carseats)
text(ad.Carseats)


ad.Carseats

#  ahora con un set de validaci�n
set.seed(1221)
train <- sample(nrow(Carseats2),0.7*nrow(Carseats2))


#  no hay que indicarle el dataset de training, s�lo el subset de indices "train" para entrenar

help(tree)

ad.Carseats <- tree(High ~ . -Sales, Carseats2, subset=train)

summary(ad.Carseats)
ad.Carseats
plot(ad.Carseats)
text(ad.Carseats)

# set de validaci�n
Car_test <- Carseats2[-train,]


#  Predicciones
ad.predict <- predict(ad.Carseats,Car_test, type="class")

ad.predict.raw <- predict(ad.Carseats,Car_test, type="vector")

mc = table(ad.prune.predict,Car_test$High)
sum(diag(mc))/nrow(Car_test)


#  vamos a hacer prunning con CV en el set de entremamiento
cv.carseats <- cv.tree(ad.Carseats, FUN=prune.misclass)

#  caracter�sticas
cv.carseats

# ploteo
plot(cv.carseats) 

# veo que el mejor tama�o del �rbol se da en 10-13. 
# Entonces voy a elegir el valor 13

#  corro el �rbol con este tama�o ideal=11 en toda el set de entrenamiento completo

prune.carseats <- prune.misclass(ad.Carseats, best = 13)
plot(prune.carseats)
text(prune.carseats, pretty = 0)

#  y ahora predigo con este �rbol podado

ad.prune.predict <- predict(prune.carseats,Car_test, type="class")

mc = table(ad.prune.predict,Car_test$High)

sum(diag(mc))/sum(mc)


#######################
# Churn Modelling #
#######################

# Impo
ds <- read.csv("C:/Users/Federico/Desktop/Churn_Modelling.csv")
str(ds)
               
ds = ds[-c(1:3)]

# factorizo
ds$Exited = factor(ds$Exited, levels = c(0,1))
               
#  validacion
train <- sample(nrow(ds), 0.8*nrow(ds))

ds.tree <- tree(Exited ~ .,ds, subset=train)

summary(ds.tree)
plot(ds.tree)
text(ds.tree, pretty = 0)
ds.tree


#  set de prueba
ds_test <- ds[-train,]


ad.predict <- predict(ds.tree,ds_test, type="class")
ad.predict.raw <- predict(ds.tree,ds_test, type="vector")

#######################################
#  performance del modelo umbral=0.5

umbral=0.5
pred.umbral <- ifelse(ad.predict.raw[,2] > umbral, 1, 0)

table(ds_test$Exited)

mc = table(pred.umbral, ds_test$Exited)
mc

VP=mc[2,2]; p_VP=VP/(VP+FN)
VN=mc[1,1]; p_VN=VN/(VN+FP)
FP=mc[2,1]; p_FP=FP/(VN+FP)
FN=mc[1,2]; p_FN=FN/(vP+FN)

acc = (VP+VN)/(VP+VN+FP+FN)


#######################################
#  Costo - beneficio 0.5

# MATRIZ DE BENEFICIOS

b_VP = 950
b_VN = 0
c_FP = -50
c_FN = -500

#  prob a priori
clase = table(ds_test$Exited)
p_POS= clase[2]/nrow(ds_test)
p_NEG= clase[1]/nrow(ds_test)

#  funci�nal de beneficio esperado
# B.esp = p_POS*(p_VP*b_VP + p_FN*c_FN)+p_NEG*(p_VN*b_Vn + p_FP*c_FP)

B.esp = p_POS*(p_VP*b_VP + p_FN*c_FN)+p_NEG*(p_VN*b_VN + p_FP*c_FP)


#######################################
#  performance del modelo umbral=0.2

umbral=0.2
pred.umbral <- ifelse(ad.predict.raw[,2] > umbral, 1, 0)

table(ds_test$Exited)

mc = table(pred.umbral, ds_test$Exited)
mc

VP=mc[2,2]; p_VP=VP/(VP+FN)
VN=mc[1,1]; p_VN=VN/(VN+FP)
FP=mc[2,1]; p_FP=FP/(VN+FP)
FN=mc[1,2]; p_FN=FN/(vP+FN)

acc = (VP+VN)/(VP+VN+FP+FN)


#######################################
#  Costo - beneficio 0.2

# MATRIZ DE BENEFICIOS
b_VP = 950
b_VN = 0
c_FP = -50
c_FN = -500

#  prob a priori
clase = table(ds_test$Exited)
p_POS= clase[2]/nrow(ds_test)
p_NEG= clase[1]/nrow(ds_test)

#  funci�nal de beneficio esperado
# B.esp = p_POS*(p_VP*b_VP + p_FN*c_FN)+p_NEG*(p_VN*b_Vn + p_FP*c_FP)

B.esp = p_POS*(p_VP*b_VP + p_FN*c_FN)+p_NEG*(p_VN*b_VN + p_FP*c_FP)

#######################################
#  performance del modelo umbral=0.1

umbral=0.1
pred.umbral <- ifelse(ad.predict.raw[,2] > umbral, 1, 0)

table(ds_test$Exited)

mc = table(pred.umbral, ds_test$Exited)
mc

VP=mc[2,2]; p_VP=VP/(VP+FN)
VN=mc[1,1]; p_VN=VN/(VN+FP)
FP=mc[2,1]; p_FP=FP/(VN+FP)
FN=mc[1,2]; p_FN=FN/(vP+FN)

acc = (VP+VN)/(VP+VN+FP+FN)


#######################################
#  Costo - beneficio

# MATRIZ DE BENEFICIOS
b_VP = 1000
b_VN = 0
c_FP = 0
c_FN = -500

#  prob a priori
clase = table(ds_test$Exited)
p_POS= clase[2]/nrow(ds_test)
p_NEG= clase[1]/nrow(ds_test)

#  funci�nal de beneficio esperado
# B.esp = p_POS*(p_VP*b_VP + p_FN*c_FN)+p_NEG*(p_VN*b_Vn + p_FP*c_FP)

B.esp = p_POS*(p_VP*b_VP + p_FN*c_FN)+p_NEG*(p_VN*b_VN + p_FP*c_FP)




