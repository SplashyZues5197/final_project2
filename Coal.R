library(tidyverse)
library(primer.data)
library(dbplyr)
library(janitor)
library(scales)

coal_energy <- read_csv(file = "coal-energy-share.csv", show_col_types = FALSE)
colnames(coal_energy)<- c("Entity", "Code","Year","coal")

india_coal_energy <-filter(coal_energy, Entity == "India")
American_coal_energy <- filter(coal_energy, Entity == "United States")
UK_coal_energy <- filter(coal_energy, Entity == "United Kingdom")

ggplot()+
  geom_line(data = india_coal_energy, aes(x = Year, y =coal/100), color = "green", size =1)+
  geom_line(data = American_coal_energy, aes(x = Year,y = coal/100), color = "orange", size =1)+
  geom_line(data = UK_coal_energy, aes(x = Year, y = coal/100), color = "red", size =1)+
  scale_y_continuous(labels = percent_format())+
  labs(title = "Percentage of Energy Produced from Coal",
       subtitle = "The US and UK have decreased their dependency on Coal Energy",
       x = "Year", y = "Percentage", fill = "Country")+
  scale_color_manual(name = "Group", values = c("red", "orange", "green"), 
                     labels = c("United States", "United Kingdom", "India"))
