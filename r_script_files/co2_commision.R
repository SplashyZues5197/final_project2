library(tidyverse)
library(primer.data)
library(dbplyr)
library(janitor)
library(scales)
library(ggplot2)
library(tidyr)
library(gganimate)
library(transformr)
library(plotly)

co2_emmision <- read_csv(file = "data/annual-co2-emissions-per-country.csv", show_col_types = FALSE)
colnames(co2_emmision)<- c("Entity","Code","Year","Ann_co2")
co2_plot <- co2_emmision|>
  select(Year, Ann_co2)|>
  group_by(Year)|>
  summarize(Ann_co2 = sum(Ann_co2))|>
  ggplot(aes(x = Year, y = Ann_co2/10000000000))+
  geom_line(color = "red", size = 1)+
  scale_y_continuous(labels = function(x) paste0(x," billion"))+
  labs(
    title = "Global Annual CO2 emmisions ",
    x = "Year", y = "Amount of Tonnes"
  )+
  theme_bw()
co2_plotly <- ggplotly(co2_plot,tooltip = c("x", "y"))





co2_plotly$x$data[[1]]$text <- paste0("x: ", co2_plotly$x$data[[1]]$x, "<br>",
                                    "y: ", format(co2_plotly$x$data[[1]]$y, scientific = FALSE))
write_rds(co2_plotly, "co2_plotly.rds")
