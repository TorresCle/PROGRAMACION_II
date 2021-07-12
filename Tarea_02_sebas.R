# PARTE 2

# 1. Graficar los puntos (1,1),(2,4),(3,6),(4,8),(5,25),(6,36),(7,49),
# (8,61),(9,81),(10,100) en un plano utilizando RStudio.

x <- c(1:10)
y <- c(1,4,6,8,25,36,49,61,81,100)

df <- data.frame(x,y)
df

plot(x,y)

# 2. Ingresar la matriz A en RStudio

numeros <- c(1,2,3,2,4,6,3,6,9,4,8,12)
A <- matrix(numeros, nrow = 4, ncol = 3, byrow = TRUE)
A

# 3. Ingresar la matriz identidad de tamaño 3 

I <- diag(3)
I

# 4. Crea una función que cree una matriz nula ingresando las dimensiones

MN <- function(f,c){
  matrix(0, nrow = f, ncol = c)
}
MN(5,6)

# 5. Modificar la matriz diag(4), para que se parezca a la matriz B

B <- diag(4)
B[1,1]=0
B[2,2]=2
B[3,3]=3
B[4,4]=4
B

# 6. Obtener la matriz transpuesta de A

At <- t(A)
At

# 7. Realizar las siguientes operaciones A+B, A−B, 3*B y A*B

AmasB <- A+B[1:4,1:3]
AmasB

AmenosB <- A-B[1:4,1:3]
AmenosB

3*B

A*B[1:4,1:3]

# 8.  Crea una función para calcular P^6

p <- c(1,2,3,-2,4,-2,1,0,1)
P <- matrix(p, nrow = 3, ncol = 3, byrow = TRUE)
P

funcion8 <- function(numerito){
  numerito^6
}
funcion8(P)

# 9. Resolver el sistema de ecuaciones

fila <- c(3,-1,1,9,-2,1,3,1,-2)
matriz1 <- matrix(fila, nrow = 3, ncol = 3, byrow = TRUE)
matriz1

matriz2 <- matrix(c(-1,-9,-9), nrow = 3, ncol = 1)
matriz2

matrizR <- solve(matriz1,matriz2)
matrizR

# 10. Funcion eigen y det

# eigen determina los autovalores y autovectores de una matriz
eigen(cbind( 1, 3:1, 1:3))

#Det determina la determinante de una matriz
Z <- matrix(c(4,54,2,4,8,4,2,4,8),nrow = 3,ncol = 3)
det(Z)

# 11. Calcular

datosB <- c(1:5,2*1:5,3*1:5,4*1:5,5*1:5,6*1:5,7*1:5,8*1:5,9*1:5,10*1:5)
MatrizB <- matrix(datosB,nrow = 10, ncol = 5, byrow = TRUE)
MatrizB

datosA <- c(0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,0,1,0,0,1,1,0,1,1,0)
MatrizA <- matrix(datosA,nrow = 5, ncol = 5, byrow = TRUE)
MatrizA

Prob1 <- MatrizB%*%MatrizA - MatrizB%*%t(MatrizA)
Prob1

# 12. Calcular

X <- matrix(c(1,1,1,1,1,1,-1,0,1,2),nrow = 5, ncol = 2)
Y <- matrix(c(0,0,1,1,3),nrow = 5, ncol = 1)

Beta <- ((t(X)%*%X)^(-1))%*%t(X)%*%Y
Beta

# 13. Corre el siguiente código para cargar los vectores year y co2 en memoria
data(co2)
means = aggregate(co2, FUN=mean)
year = as.vector(time(means))
co2 = as.vector(means)

df2 <- data.frame(year, co2)
df2

ite <- for(i in 1:39)

df2 <- cbind(year,co2,)
df2

