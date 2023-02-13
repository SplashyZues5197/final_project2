
#| echo: false
library(tidyverse)
library(tidycensus)
library(dplyr)
library(ggthemes)

file1 |>
  filter(City == "New Delhi")|>
  ggplot(aes(x = tempmax, y = sealevelpressure))+
  geom_smooth()+
  theme_classic()



library(tidyverse)
indian_emmision|>
  ggplot(aes(x = Year, y = Total))+
  geom_line()+
  coord_cartesian(xlim = c(2012, 2020))






library(lubridate)
library(tidycensus)
library(dplyr)
original|>
  select(City, Date, temp)|>
  mutate(Date = year(Date))|>
  filter(City == "Chennai")|>
  summarize(max_temp = mean(temp), .by = Date)|>
  ggplot(aes(x = Date, y = max_temp))+
  geom_line()

