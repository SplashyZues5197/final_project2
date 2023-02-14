
#| echo: false
library(tidyverse)
library(tidycensus)
library(dplyr)
library(ggthemes)
library(ggplot2)

temp_and_pressure <- file1 |>
  filter(City == "New Delhi")|>
  ggplot(aes(x = tempmax, y = sealevelpressure))+
  geom_smooth(method = "loess", formula = "y ~ x", level = FALSE)+
  theme_classic()+
  labs(title = "Effect of Low and High Temperatures on Sea level pressure",
       subtitle = "The relationship between temperature and sea level pressure is inverse",
       x = "Temperature", y = "Sea Level Pressure", caption = "Source: Kaggle")
write_rds(temp_and_pressure, "pressure.rds")



library(tidyverse)
indian_emmision|>
  ggplot(aes(x = Year, y = Total))+
  geom_line()+
  coord_cartesian(xlim = c(2012, 2020))






library(lubridate)
library(tidycensus)
library(dplyr)
original1<- original|>
  select(City, Date, temp)|>
  mutate(Date = year(Date))|>
  filter(City == "New Delhi")|>
  summarize(max_temp = mean(temp), .by = Date)|>
  ggplot(aes(x = Date, y = max_temp))+
  geom_line()+
  theme_classic()+
  labs(title = "New Delhi Temperature",subtitle = "New Delhi's temperatures decreased by 1 degree celsius from 2018-2020",
       x = "Time", y = "Temperature")
write_rds(original, "Delhi_1.rds")

library(tidyverse)
library(ggplot2)
energy_use |>
  ggplot()+
  geom_line(aes(x = Year, y = Biomass), color = "red")+
  geom_line(aes(x = Year, y = Biofuel), color = "green")+
  geom_line(aes(x = Year, y = Solar), color = "purple")+
  geom_line(aes(x = Year, y = Wind), color = "blue")+
  geom_line(aes(x = Year, y = Hydro), color = "black")+
  geom_line(aes(x = Year, y = Nuclear), color = "cyan")+
  geom_line(aes(x = Year, y = Gas), color = "grey")+
  geom_line(aes(x = Year, y = Coal), color = "pink")+
  geom_line(aes(x = Year, y = Oil), color = "navy")+
  coord_cartesian(ylim = c(0, 1600))
