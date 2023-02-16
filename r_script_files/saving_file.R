
  
library(tidyverse)
library(primer.data)
library(dbplyr)
library(janitor)

file1 <- read_csv(file = "Indian Summers - Over the years.csv", show_col_types = FALSE)|>
  select(City, tempmax, sealevelpressure)
write_csv(x = file1, file = "indian_summer.csv")

original <- read_csv(file = "Indian Summers - Over the years.csv", show_col_types = FALSE)

file2 <- read_csv(file = "GCB2022v27_MtCO2_flat.csv", show_col_types = FALSE)|>
    select(Country, Year, Total)|>
    filter(Country == "India" )


indian_emmision <-subset(file2, Total!=0)


write_csv(x = indian_emmision, file = "india's commision.csv")



