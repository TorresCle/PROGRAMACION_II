library(dplyr)
library(readr)

names_table <- read_csv("https://raw.githubusercontent.com/ryali93/ProgramacionR/master/data/listRaingauge.csv")
names(names_table)

estacion <- names_table %>%
  dplyr::filter(NOM_EST == "SAN MIGUEL") %>% 
  dplyr::select(CODIGO) %>% 
  as.character()

data <- read_csv("https://raw.githubusercontent.com/ryali93/ProgramacionR/master/data/raingaugeDataset.csv")
names(data)
data1 <- data %>%
  dplyr::select(date, all_of(estacion)) %>% 
  dplyr::mutate(date = as.Date(date, format = "%d/%m/%Y")) %>% 
  dplyr::rename(pp = all_of(estacion)) %>% 
  dplyr::arrange(date)
  
tail(data1)
as.Date("2013-12-31")
as.Date("1980-01-01")

class(as.Date("1980-01-01"))
seq(as.Date("1980-01-01"), as.Date("2013-12-31"), by = "day") 
    
    
    
    
    
    
    
    
    
fechas <- c ("27/02/92", "27/02/92", "14/01/92", "28/02/92", "01/02/92")
fechas01 <- as.Date (fechas, "%Y/%m/%d")


A <- c("qc00000249", "qc00000248")
B <- c(1:10)
C <- as.character(B) 

class(A)
class(B)
class(C)
 <- read_csv("https://raw.githubusercontent.com/ryali93/ProgramacionR/master/data/raingaugeDataset.csv")
