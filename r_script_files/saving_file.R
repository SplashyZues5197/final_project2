
  
library(tidyverse)
library(primer.data)
library(dbplyr)
library(janitor)

file1 <- read_csv(file = "Indian Summers - Over the years.csv", show_col_types = FALSE)|>
  select(City, tempmax, sealevelpressure)
write_csv(x = file1, file = "indian_summer.csv")

original <- read_csv(file = "Indian Summers - Over the years.csv", show_col_types = FALSE)





