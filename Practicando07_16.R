library(nycflights13)
library(dplyr)
flights
filter1 <- dplyr::filter(flights, month == 1, day == 1)
dplyr::filter(flights, month %in% c(11, 12)) #el %in% cada fila donde x es uno de los valores en y.
is.na(filter1) #para determinar si tenemmos datos faltantes

###############################################################################
###############################################################################
#EJERCICIOS DE FILTER
#"dep_time" "arr_time"= hora de salida y de llegada
#sched_dep_time, sched_arr_time == Horarios programados de salida y llegada (formato HHMM o HMM), tz local
#dep_delay, arr_delay == Retrasos de salida y llegada, en minutos. Los tiempos negativos representan salidas / llegadas anticipadas.
#air_time == Cantidad de tiempo pasado en el aire, en minutos
#time_hour == Fecha y hora programadas del vuelo como fecha POSIXct. Junto con el origen, 
#se puede utilizar para unir datos de vuelos con datos meteorológicos.

df01 <- flights
df01 %>% dplyr::select(arr_time,sched_arr_time) %>%
  dplyr::transmute(diferencia = arr_time - sched_arr_time) %>% 
  dplyr::filter(diferencia >= 120)




#######################################################################################
#######################################################################################

library(tidyverse)
install.packages("datos")
library(datos)
millas



install.packages("gapminder")
library(gapminder)
data(gapminder)
grup_by(pop)
