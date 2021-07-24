library(tidyverse)
library(nycflights13)
dplyr::filter(flights, month == 1, day == 1)

#e siguienete ejercicio, para no imprimir se puede colocar () se va a imprimir
(filter02 <- dplyr::filter(flights, month == 12, day == 25))

dplyr::filter(flights, month == 1)
dplyr::filter(flights, !(arr_delay > 120 | dep_delay > 120))
dplyr::filter(flights, day == 1 | day == 2)
dplyr::filter(flights, day %in% c(1,2))

#si se quiere seleccionar bastantes valores entonces se puede utilizar el %nin%

dplyr::filter(flights, arr_delay <= 120, dep_delay <= 120)
dplyr::filter(flights, day > 1 | day < 5) #no tiene sentdo
dplyr::filter(flights, day > 1 , day < 5) # manera correcta de filtrar

####################################################################################
####################################################################################
dplyr::arrange(flights, year, month, day)

dplyr::arrange(flights, (arr_delay)) #ordenamos ascendentemente
dplyr::arrange(flights, desc(arr_delay)) #ordenamos descendentemente
dplyr::arrange(flights, desc(year)) #ordenamos descendentemente
#repasar algunos puntos de arrange


####################################################################################
####################################################################################

dplyr::select(flights, year, month, day) #seleccionamos las comunas que queremos
dplyr::select(flights, month, day)#ejemplo aqui estpy seleccionando month y day
dplyr::select(flights, year, month, -day) #negandolo no seleccionamos esa columna
dplyr::select(flights, year:day) #todas las columnas que se encuentran entre year y day
dplyr::select(flights, -(year:day)) #lo mismo se hace aqui, lo va a obviar
#explorar las demas funciones de select


#FUNCIONES AUXILIARES 
dplyr::select(flights, starts_with("ai")) # se puede seleccioanr de cuadoe a la letra que empieza su nombre
dplyr::select(flights, ends_with("me")) #los que terminan con "me"
dplyr::select(flights, contains("arr")) #selecciona todas las columnas que concide con "arr"
dplyr::select(flights, num_range("time", 1:3))#no se tiene claro revidar mejor
#matches("(.)\\1") <-- revisar 
?select #para condultar toda la lbreria
names(flights) #nos devuelve los nombres de cada una de las variables

df <- rename(flights, tail_num = tailnum)#cambaindo los nombres, primero el nombre nuevo y despues el nombre antiguo
names(df)
df01 <- flights
names(df01)[1:3] <- c("anio", "mes", "dia") #de esta manera podemos cambiar los nombres de varias columnas
dplyr::rename(df01, year = anio, month = mes, day = dia) # otra forma de cambiarlo

dplyr::select(flights, time_hour, everything())#una forma de ordenar los ultimos para los primeros


################################################################################################
################################################################################################
# MUTATE = MUTAR O TRANSFORMAR
flights_sml <- 
  dplyr::select(
    flights, 
    year:day, 
    ends_with("delay"),
    distance, air_time
  )

mutate(
  flights_sml,
  gain = arr_delay - dep_delay,
  speed = distance / (air_time * 60)
)
###########################################
mutate(
  flights_sml,
  gain = arr_delay - dep_delay,
  hours = air_time / 60,
  gain_per_hour = gain / hours   #en esta parte estoy utilizando los campos de que creé
)

###########################################
#con esta opcion me estoy quedando solo con las columnas que he creado
transmute(
  flights_sml,
  gain = arr_delay - dep_delay,
  hours = air_time / 60,
  gain_per_hour = gain / hours
)

###########################################
transmute(
  flights,
  dep_time,
  hour = dep_time %/% 100,
  minute = dep_time %% 100
)

###########################################
#cumsum
#cumprod
#cummin
#cummax
dplyr::tibble(valores = 1:10) %>%
  mutate(suma_aculada = cumprod(valores)) #ejemplo aqui estamos utilizando cumprod

dplyr::tibble(valores = c(1:5, 5, 5)) %>%
  arrange(valores) %>%
  mutate( id = 1:n()) # podemos fijarnos como numera

dplyr::tibble(valores = c(1:5, 5, 5)) %>%
  arrange(valores) %>%
  mutate( id = min_rank(valores)) #otra manera de hacer pero diferente

y <- c (1, 2, 2, NA, 3, 4)

df03 <- dplyr::tibble(valores = c(1:5, 5, 5)) %>%
  arrange(valores) %>%
  mutate( id = min_rank(valores))


dplyr::row_number(y)
dplyr::percent_rank(y)
dplyr::cume_dist(y)

read.csv(file = )


##################################################################################
##################################################################################
#SUMMARIZE = RESUMIR
summarize(flights, delay = mean(dep_delay, na.rm = TRUE)) #promedio de una columna
summarize(flights, hour02 = mean(hour, na.rm = TRUE)) #otro ejemplo

#ojo con la pipeta aqui dejamos un elemplo,  pipeta ctrl + shift + m
x <- c(1:10)
y <- c(11:20)
sum(x) %>% c(y)

#ahora veamos otro ejemplo mas complejo
#mean
flights %>% 
  group_by(year, month, day) %>%
  summarize(delay = mean(dep_delay, na.rm = TRUE))

#ahora vemaos combianando todo
flights %>%
  group_by(dest) %>%
  summarise(
    count = n(),
    dist = mean(distance, na.rm = T ),
    delay = mean(arr_delay, na.rm = T)
  )

#######################################################
#veamos un ejemplo mas sencillo antes de ver el ejemplo
prueba <- dplyr::tibble(num =c(1:10, NA), num2 = 11:21)
dplyr::filter(prueba, !is.na(num))
prueba %>% filter(!is.na(num))

#ahora vemaos los valores faltantes
not_cancelled <- flights %>% 
  filter(!is.na(dep_delay), 
         !is.na(arr_delay))


#######################################################






