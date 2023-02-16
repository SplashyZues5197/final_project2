library(tidyverse)
library(primer.data)
library(dbplyr)
library(janitor)
library(scales)
library(ggplot2)
library(tidyr)
library(gganimate)
library(transformr)
library(lubridate)
library(zoo)
library(timetk)

df <- read_csv(file = "sea_levels_2015.csv",show_col_types = FALSE)|>
  mutate(Time = as.POSIXct(Time))
colnames(df) <- c("time","GMSL","GMSL_uncertainty")

df <- transform(df, time = zoo::as.Date(time, frac = 0))
df <- as_tibble(df)

p <- df|>
  ggplot(aes(x = time, y = GMSL))+
  geom_line(color = "blue")+
  coord_cartesian(ylim = c(-200, 100))+
  labs(title = "Sea Level Change, 1880 - 2014",
       subtitle = "Since 1880, the GMSL has been rising",
       x = "Year",
       y = "Global Mean Sea Level (mm)")+
  theme_classic()+
  transition_reveal(time)


animate(p, nframe = 144, fps = 25)

anim_save("sea_level.gif", p)
