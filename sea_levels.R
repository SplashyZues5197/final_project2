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

sea_levels <- read_csv(file = "sea_levels_2015.csv",show_col_types = FALSE)|>
  mutate(Time = as.POSIXct(Time, format="%Y-%m-%d"))
colnames(sea_levels) <- c("time","GMSL","GMSL_uncertainty")

sea_level_plot <- ggplot(data = sea_levels, aes(x = time, y = GMSL))+
  geom_line(color = "blue")+
  scale_x_datetime(date_labels = "%Y", date_breaks = "15 years")+
  coord_cartesian(ylim = c(-200, 100))+
  labs(
    title = "Sea Level Change, 1880 - 2014",
    subtitle = "Since 1880, the GMSL has been rising",
    x = "Year",
    y = "Global Mean Sea Level (mm)"
  )+
  theme_classic()


# Writing RDS file
write_rds(sea_level_plot, "sea_level.rds")
