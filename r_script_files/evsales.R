library(tidyverse)
library(primer.data)
library(dbplyr)
library(janitor)
library(scales)
library(ggplot2)
library(tidyr)
library(gganimate)
library(transformr)
ev_sales <- read_csv(file = "data/IEA-EV-dataEV salesCarsHistorical.csv",
                     show_col_types = FALSE)|>
  filter(region == "USA")|>
  select(year, value, powertrain)
ev_plot <- ev_sales|>
  ggplot(aes(year, y = value, fill = powertrain))+
  geom_bar(stat = "identity")+
  scale_y_continuous(labels =scales::comma_format())+
  labs(
    title = "Sale of EV Vehicles in the US",
    x = "Year",
    y = "Sales",
    fill = "PowerTrain"
  )
write_rds(x = ev_plot, "ev_plot.rds" )
