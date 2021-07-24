vector02 <- c("a", "d", "b", "g", "j", "k", "l", "s", "z")
sort(vector02)

length(vector02)
vector03 <- c(1:21)
seq(1, 21)
seq(3, 21, length = 19)

vect01 <- c("Dec", "Apr", "Jan", "Mar", "Jan", "Mar")
sort(vect01)
month_levels <- month.abb

factor01 <- factor(vect01, levels = month_levels)
sort(factor01)

factor01 <- factor(vect01, levels = unique(vect01))
factor01 <- factor(vect01, levels = fct_inorder(vect01))


################################################################################
################################################################################
vector01 <- c(1, 2, 4, 7, 10, 11, 12, 19, 26)
dim(vector01)

dim(vector01) <- c(3,3)
vector01

dim(vector01)

################################################################################
library(dplyr)
head(iris)
head(iris[iris$Species == "setosa",])


datairis <- dplyr::tibble(iris)
iris01 <- datairis %>% dplyr::filter(Species == "setosa") %>%
  dplyr::select(Species)

################################################################################
#EJERCICIO_01

terremotos <- read.csv("https://raw.githubusercontent.com/ryali93/ProgramacionR/master/data/earthquakes.csv")
terremo01 <- dplyr::tibble(terremotos)
#numero de registros es 2413 y numero de columnas es 12

terremo01 <- terremo01 %>% dplyr::select(Magnitude) %>% 
terremo01[10,]

###################################################################################
#EJERCICIO_02
library(readr)

pobreza <- "https://raw.githubusercontent.com/ryali93/ProgramacionR/master/data/pobreza_extrema.csv"
pobreza_sintitulo <- read_csv2(pobreza)

pobreza01 <- dplyr::tibble(pobreza_sintitulo) %>%
  dplyr::select(DISTRITO, Incidencia) %>% 
  dplyr::filter(DISTRITO == "Los Olivos")

data01 <- readr::read_csv(file ="https://raw.githubusercontent.com/ryali93/ProgramacionR/master/data/pobreza_extrema.csv" )
data02 <- read.csv("https://raw.githubusercontent.com/ryali93/ProgramacionR/master/data/pobreza_extrema.csv")
head(data02)

data03 <- read.csv(file ="https://raw.githubusercontent.com/ryali93/ProgramacionR/master/data/pobreza_extrema.csv", sep = ";", header = T )
head(data03)

data04 <- readr::read_csv2(file = "https://raw.githubusercontent.com/ryali93/ProgramacionR/master/data/pobreza_extrema.csv")

####################################################################################
install.packages("readxl")
library(readxl)
data05 <- readxl::read_excel(path = "xlsx_data.xlsx", sheet = 1)
file.choose()


data10 <- xlsx::read.xlsx(file = "data/file.xls", 1)
data11 <- readxl::read_xls(path = "file.xls", sheet = 1)
