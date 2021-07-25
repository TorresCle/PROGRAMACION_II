#PREGUNTA 02
A <- c(3, 2, 1, 2, -1, 4, -2, 3, 2)
B <- c(0, 9, -4)

matr_A <- matrix(A, nrow = 3) #formamos nuestra matriz A
matr_B <- matrix(B, ncol = 1) #formamos nuestra matriz B

solve(matr_A,matr_B)

#PREGUNTA 01

calculate <- function(elevacion){
  variable = 81.4
  if (elevacion >= 1000 & elevacion <= 3000){
    resultado =  variable - 2 * (elevacion-1000)/500
    
  } else if(elevacion > 3000 & elevacion <= 4000){
    variable = variable - 2 * (3000-1000)/500
    resultado = variable - 0.5 * (elevacion - 3000)/500
    
  } else {
    resultado = variable - 2 * (3000-1000)/500 - 0.5*(4000-3000)/500}
  resultado
}
calculate (1000)

##########################################################################
###########################################################################
install.packages("reader")
library(ggplot2)
library(readr)
x <- as.data.frame(read_delim("mods_clima_uh.csv", 
                              ",", escape_double = FALSE, 
                              trim_ws = TRUE))

x <- x %>% filter(uh_name == "Cuenca Tumbes")

# A
anual <- x %>% filter(bh_esc == "Observado") %>% dplyr::select(bh_pc) %>% sum()

# C
# MPI es el escenario más preciso ya que el %PBIAS (porcentaje de sesgo)
# es el menor de los tres modelos.

# D
#GRAFICA
ggplot(data, aes(x=bh_month,y=bh_pc,fill=bh_esc))+
  geom_bar(stat = "identity")+
  theme_classic()+
  facet_wrap(~bh_esc)



#pregunta 03
library(dplyr)
library(stringr)
library(ggplot2)
x_raw <- read.csv("temperatureDataset.csv")
x_1 <- x_raw %>% select(DATE,qc00000830) %>% rename(temp=qc00000830)%>% 
  mutate(date = as.Date(DATE, format = "%d/%m/%Y"))
x_1$temp[x_1$temp == -99.9] <- NA
period_0 <- x_1 %>% filter(date >= "1983-01-01" & date < "1984-12-31")
period_01 <- x_1  %>% filter(date >= "1997-01-01" & date < "1998-12-31")
sum(is.na(period_0$temp))
sum(is.na(period_01$temp))

#parte B
month <-
  x_1%>% group_by(date = str_sub(date,1, 7)) %>% #ordenada por mes y año
  mutate(valores_NA =  sum(is.na(temp))*100/n()) %>% 
  summarise(temp = sum(temp, na.rm = T),valores_NA = unique(valores_NA))%>%
  mutate(temp = ifelse(valores_NA > 5, NA, temp),date = as.Date(sprintf("%1$s-01", date)),meses = str_sub(date,6,7))

#parte C
periodo <- month %>% 
  filter(date >= "2005-01-01" & date < "2010-12-31")%>%
  group_by(meses) %>% summarise(NA_counts= sum(is.na(temp)))


























