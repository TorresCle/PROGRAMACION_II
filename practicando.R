library(tidyverse)
library(nycflights13)

flights
filter01 <- filter(flights, month == 1, day == 1 )
summarise(flights)

filter(flights, month %in% c(11, 12))
filter(flights, month == 11 | month == 12 )

dplyr::filter(flights, !(arr_delay > 120 | dep_delay > 120))
is.na(NA)
