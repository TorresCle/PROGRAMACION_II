library(tidyverse)

################################################################
#ejercicio 01
#parte a
ejerc01 <- function(a=0.3, b=0.15, c=0.2, d=0.8, e=0.5, f=0.12){
  operacion <- ((a*b)/((a*b)+(c*d)+(e*f)))
  return(operacion)
}
ejerc01()

#parte b
parteb <- function(a, b){
  oper03 <- ((a^b)/(factorial(b)))*exp(-a)
  return(oper03)
}
parteb(a=5, b=6)

#parte C
N<-20
n<-7
fact01<-factorial(N)/(factorial(n)*(factorial(N-n)))
res<-fact01*(0.4**7)*(0.6**13)

##################################################################
##################################################################
#EJERCICIO 02
#parte a
a <- c(1:1000)
sum(a)

#parte b
ejerc02 <- function(a1, r, n){
  oper02 <- a1*r^(n-1)
  return(oper02)
}
ejerc02(a1=1, r=2, n=1:11)

suma <- ejerc02(a1=1, r=2, n=1:11) #Anidamos los resultados
sum(suma) #Realizamos la suma como nos piede en la pregunta

####################################################################
####################################################################
# EJERCICIO 03
#parte a
grupo
is.vector(grupo) #Evaluamos si es vector
length(grupo)    #la cantidad de elementos que tiene el vector grupo

#parte b
which(grupo == "A")


####################################################################
####################################################################
#EJERCICIO 04
#suma de todas las notas
nota
is.vector(nota) #Evaluamos si es vector
length(nota) #como podemos observar tiene la misma cantidad de calores

#parte a
sum(nota) #suma de todas las notas
summary(nota) #resumen del minimo media la mediana y el max.

#parte b
mean(nota) #media aritmetica

#parte c
which(nota > 7) #En que posiciones

#parte d
nota[order(-nota)] #ordenamos de mayor a menor

#parte e
which(nota ==7.7) #en que posicion se encuentra el valor 7.7

################################
#order creciente
a <- c(4, 2, 3, 1)
a[order(a)]

ord <- order(a)
a[ord]

sort(a)
#order decrreciente
a[order(-a)]
a[order(a, decreasing = TRUE)]
sort(a, decreasing = TRUE)
##############################

##############################################################
#5. A partir de los vectores grupo y nota definidos.
#A) Suma las notas de los 10 primeros alumnos del vector

tabla <- data.frame(grupo, nota)

pri10 <- head(tabla,10)
pri10[,"nota"]
sum(pri10[,"nota"])

#ahora con tidyverse
dplyr::tibble(grupo = grupo, nota = nota)
primeros_10 <- head(dplyr::tibble(grupo = grupo, nota = nota),10)
sum(primeros_10$nota)


#B) ¿Cuántos alumnos hay del grupo C?
tabla <- data.frame(grupo, nota)
class(tabla)

tabla[,"grupo"]
tabla$grupo

alumC <- tabla[tabla$grupo == "C", ]
alumC[,"grupo"]
length(alumC[,"grupo"])

#ahora con tidyverse
Alum_notas <- dplyr::tibble(grupo = grupo, nota = nota)
Alum_notas %>% 
  dplyr::select(grupo) %>% 
  dplyr::filter(grupo == "C") %>% 
  dplyr::summarise(length(grupo))

#C) ¿Cuántos alumnos han aprobado?
alum_apro <- tabla[tabla$nota >= 5.0, ]
alum_apro[,"grupo"]
length(alum_apro[,"grupo"])

#ahora con tidyverse
Alum_notas <- dplyr::tibble(grupo = grupo, nota = nota)
Alum_notas %>% 
  dplyr::filter(nota >=5) %>% 
  dplyr::summarise(length(nota))

#D) ¿Cuántos alumnos del grupo B han aprobado?
tabla <- data.frame(grupo, nota)
tabla[tabla$grupo == "B", ] 
tabla[tabla$nota >= 5.0, ]
num_B <- tabla[tabla[,"grupo"] == "B" & tabla[,"nota"]>= 5.0,]
num_B[,"nota"]
length(num_B[,"nota"])

#con tydiverse
Alum_notas <- dplyr::tibble(grupo = grupo, nota = nota)
Alum_notas %>% 
  dplyr::filter(grupo == "B" & nota >= 5.0) %>%
  dplyr::summarise(length(nota))


#E) ¿Qué porcentaje de alumnos del grupo C han aprobado?

alumC <- filter(tabla, grupo == "C")
table(alumC$grupo)
a <- table(alumC$grupo)


alumC_aproba <- filter(tabla, grupo == "C", nota >=5)
table(alumC_aproba$grupo)
b <- table(alumC_aproba$grupo)

#sacando porcentajes
porcent <- (b/a)*100

#con tidyverse
Alum_notas <- dplyr::tibble(grupo = grupo, nota = nota)
porcentaje <- Alum_notas %>% 
  dplyr::filter(grupo == "C" & nota >=5) %>%
  dplyr::summarise(length(nota))

alumC <- Alum_notas %>% 
  dplyr::filter(grupo == "C") %>% 
  dplyr::summarise(length(nota))

((porcentaje/alumC)*100) #sacando el porcentaje y el resultado siendo en %

#F) ¿De qué grupos son la máxima y m�xnima notas de toda la muestra?
Alum_notas <- dplyr::tibble(grupo = grupo, nota = nota)

max <- Alum_notas %>%
  dplyr::filter(nota == max(nota))


min <- Alum_notas %>%
  dplyr::filter(nota == min(nota))


#En tidyverse de forma ascendenete y descendente
Alum_notas <- dplyr::tibble(grupo = grupo, nota = nota)
Alum_notas %>%
  dplyr::arrange(desc(nota))
Alum_notas %>%
  dplyr::arrange(nota)


#G) Nota media de los alumnos de grupo A y B, juntos, considerando sólo a los que han aprobado

Alum_notas <- dplyr::tibble(grupo = grupo, nota = nota)

Alum_notas %>% 
  dplyr::filter(xor(grupo == "A" & nota >=5, grupo == "B" & nota>= 5)) %>% 
  dplyr::summarise(mean(nota)) #observado

Alum_notas %>% 
  dplyr::filter((grupo == "A" & nota >=5) |(grupo == "B" & nota>= 5)) %>% 
  dplyr::summarise(mean(nota))

#################################################################################################
#################################################################################################
#PREGUNTA 06
Alum_notas <- dplyr::tibble(grupo, nota)
Alum_notas %>%
  dplyr::select(nota) %>% 
  dplyr::summarise(quantile(nota, 0.66)) #sacando quantil 0.66

Alum_notas %>% 
  dplyr::filter(grupo == "C") %>% 
  dplyr::summarise(quantile(nota, 0.66)) #para lo de grupo C


#################################################################################################
#################################################################################################
#PREGUNTA 07
#nrow()=total de elementos

Alum_notas <- dplyr::tibble(grupo = grupo, nota = nota)
menor_4.9 <- Alum_notas %>% 
  dplyr::filter(nota <= 4.9) %>%
  dplyr::summarise(length(nota))
((menor_4.9/nrow(Alum_notas))*100) #sacando porcentajes

mayor_4.9 <- Alum_notas %>% 
  dplyr::filter(nota >= 4.9) %>%
  dplyr::summarise(length(nota)) 
((mayor_4.9/nrow(Alum_notas))*100) #sacando porcentajes 


#############################################
#CON R BASE Y TIDYVERSE
#para menor
tabla <- data.frame(grupo, nota)
menor <- filter(tabla, nota <= 4.9 )
menor[ ,"grupo"] #menores a 4.9
b <- length(menor[ ,"grupo"])

tabla[, "grupo"] #total de alumnos
a <- length(tabla[, "grupo"])

result <- (b/a)*100

#para mayor
mayor <- filter(tabla, nota >= 4.9 )
mayor[ ,"grupo"] #menores a 4.9
b1 <- length(mayor[ ,"grupo"])

tabla[, "grupo"] #total de alumnos
a1 <- length(tabla[, "grupo"])

result1 <- (b1/a1)*100

############################################################################################
############################################################################################
#PREGUNTA 08
tabla <- data.frame(grupo, nota)
boxplot(nota ~ grupo, tabla, col = "blue")
col = palette(rainbow(5))

#con tidyverse
Alum_notas <- dplyr::tibble(grupo = grupo, nota = nota)
Alum_notas %>% ggplot(mapping = aes(x = grupo, y = nota)) +
  geom_boxplot()

#######REFERENCIA#########################################
equakes <- read.csv("https://raw.githubusercontent.com/ryali93/ProgramacionR/master/data/earthquakes.csv")
head(equakes)
boxplot(cars$speed, cars$dist)
a <- data(cars)
cars
boxplot(Magnitude ~ Source, equakes, col = palette(rainbow(2)))

######################################################################################################
######################################################################################################
conc
max(conc)
conc[conc > 40]
length(conc[conc > 40])
mean(conc)

conc[order(conc)]
concentra_1 <- conc[order(conc, decreasing = F)]
concentra_1[1:10]
#######################################################
length(conc)
tiempo_recojo <- 23/length(conc) #tiempo de recojo de cada concentracion
which(conc == max(conc)) #ocupacion dd la maxima concentracion
produc <- tiempo_recojo * which(conc == max(conc))


###### CON TIDYVERSE ##################
concentrac <- dplyr::tibble(values = conc)

#Pregunta a:
concentrac %>% 
  dplyr::summarise(max(values))

#Pregunta b:
concentrac %>%
  dplyr::filter(values > 40.0) %>%
  dplyr::summarise(length(values))

#pregunta C:
concentrac %>% 
  dplyr::summarise(mean(values))

#pregunta D:
concentrac %>% (dplyr::arrange(values))
  #rta 0.93 a 2.91 
  #presisar esta parte

#pregunta E:


############################################################################
#PARTE 2
###########################################################################
#1.1) #mal
part_A <- c(1:10)
partB <- function(a = part_A){
  potencia <- a*2
  return(potencia)
}
partB()
part_B <- partB()  

#ahora lo graficamos
plot(part_A, part_B)

#1.2) ingresando la matriz A
A <- c(1:4, 2*(1:4), 3*(1:4))
matriz_A <- matrix(A, nrow = 4, ncol = 3)

#3) ingresar la matriz de identidad
matriz_I <- diag(3)

#4) Una funcion para obtener una matriz nula
Matriz_nula <- function(f,c){
  matrix(0, nrow = f, ncol = c)
}
Matriz_nula(5,6)


#5) madificar la matriz
diag(4)
mod_A <- c(-1, 1, 2, 3)
mod_B <- diag(mod_A,nrow = 4)
modAB <- mod_B + diag(4)
#6) obtener matriz transpuesta del ejercicio02

Transpuesta <- t(matriz_A)

#7) realizar las siguientes operaciones A+B, A-B, 3B y A*B
sumaAB <- matriz_A + matriz_B
restaAB <- matriz_A - matriz_B
mmul1 <- 3*matriz_B
mmul <- matriz_A%*%matriz_B

#8) elevando a la potencia
matriz_p <- c(1, -2, 1, 2, 4, 0, 3, -2, 1)
matriz_p <- matrix(matriz_p, nrow = 3)

install.packages("Biodem")
library(Biodem)
mtx.exp(matriz_p, 6)

#9) Resolucion de sistema de ecuaciones
A <- c(3, 9, 3, -1, -2, 1, 1, 1, -2)
B <- c(-1, -9, -9)

matr_A <- matrix(A, nrow = 3)
matr_B <- matrix(B, ncol = 1)

inversa <- solve(matr_A) #inversa de la matriz
inversa %*% matr_B 
inversa %*% matr_B 

#10) investigar
# eigen(x, symmetric, only.values = FALSE, EISPACK = FALSE)
eigen(cbind(c(1,-1), c(-1,1)))
eigen(cbind(c(1,-1), c(-1,1)), symmetric = FALSE)
# same (different algorithm).

eigen(cbind(1, c(1,-1)), only.values = TRUE)
eigen(cbind(-1, 2:1)) # complex values
eigen(print(cbind(c(0, 1i), c(-1i, 0)))) # Hermite ==> real Eigenvalues
## 3 x 3:
eigen(cbind( 1, 3:1, 1:3))
eigen(cbind(-1, c(1:2,0), 0:2)) # complex values

#11) pregunta 11
mat_B <- c(1:10, 2*(1:10), 3*(1:10), 4*(1:10), 5*(1:10))
B <- matrix(mat_B, nrow = 10)

mat_A <- c(0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0)
A <- matrix(mat_A, nrow = 5)

A%*%B

B%*%A
t(B)
A%*%t(B)
B%*%A - A%*%t(B)

#12) pregunta 12
mat_x <- c(1, 1, 1, 1, 1, 1, -1, 0, 1, 2) 
X <- matrix(mat_x, ncol = 2)  

mat_y <- c(0, 0, 1, 1, 3)
Y <- matrix(mat_y, ncol = 1)

t(X)  
a <- X %*% t(X)
is.matrix(a,2)
inver_1 <- solve(a)

##########################################################################################
##########################################################################################
#PREGUNTA 13
data(co2)
means = aggregate(co2, FUN=mean)
year = as.vector(time(means))
co2 = as.vector(means)

########################################
datos <- data.frame(anio = year, nivel =round(co2,1))
datos <- datos %>% 
  dplyr::mutate(rest = c(nivel[2:39], 0)) %>% 
  dplyr::mutate(difer = rest - nivel)


result <- datos[1:38, 4]

plot(year[2:39], result, xlab = "a�os", ylab = "valores de concentraci�n", 
     main = "Concentraci�n de Co2 por a�os", type = "o", pch = (16), col = "black") %>% 
  points(2020, 2.64)


###################################################################################################
###################################################################################################
#PREGUNTA 14:
library(dplyr)
df03 <- read.csv("https://raw.githubusercontent.com/ryali93/ProgramacionR/master/data/rainfall.csv")

df02 <- dplyr::tibble(df03)
df02  <-df02 %>% dplyr::filter(sep >= 180|
                                 oct >= 180|
                                 nov >= 180|
                                 dec >= 180|
                                 jan >= 180|
                                 feb >= 180|
                                 mar >= 180|
                                 apr >= 180|
                                 may >= 180) %>% 
                                 dplyr::select(name)
  










