
  
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


energy_use <- read_csv(file = "energy-consumption-by-source-and-country.csv", show_col_types = FALSE)|>
  filter(Entity == "India" )|>
  select("Year","Geo Biomass Other - TWh (zero filled)"
         ,"Biofuels Consumption - TWh - Total (zero filled)"
         ,"Solar Consumption - TWh (zero filled)"
         ,"Wind Consumption - TWh (zero filled)"
         ,"Hydro Consumption - TWh (zero filled)"
         ,"Nuclear Consumption - TWh (zero filled)",
         "Gas Consumption - TWh (zero filled)",
         "Coal Consumption - TWh (zero filled)",
         "Oil Consumption - TWh (zero filled)")|>
colnames(energy_use)<- c("Year", "Biomass","Biofuel","Solar","Wind","Hydro","Nuclear","Gas","Coal","Oil")


