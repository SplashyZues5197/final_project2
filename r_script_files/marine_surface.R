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

marine_co2 <- read_csv(file = "data/co2_gr_gl.csv", show_col_types = FALSE)

colnames(marine_co2)<- c("year","ann_inc","unc")

marine<- ggplot(marine_co2, aes(x = year, y = ann_inc, fill = "blue"))+
  geom_col()+
  theme_linedraw()+
  labs(
    title = "Annual Increase of Carbon Dioxide in Ocean Bodies",
    subtitle = "If the growth continues, it will affect Ocean life Significantly",
    x = "Year",
    y = "CO2 Annual Increase"
  )+
  theme(legend.position = "none")
write_rds(marine, "marine_inc.rds")
