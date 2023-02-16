library(tidyverse)
library(primer.data)
library(dbplyr)
library(janitor)
library(scales)
library(ggplot2)
library(tidyr)
library(gganimate)
library(transformr)

energy_use <- read_csv(file = "data/energy-consumption-by-source-and-country.csv", show_col_types = FALSE)|>
  filter(Entity == "India")
colnames(energy_use)<- c("Entity","Code","Year","Geo","Bio","Solar_cons")

solar_energy <- energy_use|>
  select(Year, Solar_cons)|>
  ggplot(aes(x = Year, y = Solar_cons, fill = "yellow"))+
  geom_col()+
  coord_cartesian(xlim = c(2010,2021))+
  theme_linedraw()+
  labs(
    title = "Consumption of Solar Energy in India",
    x = "Year",
    y = "Energy Consumed (TWh)"
  )+
  theme(legend.position = "none")
write_rds(solar_energy, "solar_energy.rds")
