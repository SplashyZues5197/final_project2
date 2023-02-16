library(tidyverse)
library(primer.data)
library(dbplyr)
library(janitor)
library(scales)
library(ggplot2)
library(tidyr)
library(gganimate)
library(transformr)
coal_energy <- read_csv(file = "data/coal-energy-share.csv", show_col_types = FALSE)
  

coal_energy1 <- filter(coal_energy, Entity == c("India", "United States", "United Kingdom"))
colnames(coal_energy1)<- c("Entity", "Code","Year","coal")
# setting year as time
coal_energy1$Year <- as.Date(paste0(coal_energy1$Year, "-01-01"))

india_coal_energy <-filter(coal_energy1, Entity == "India")
American_coal_energy <- filter(coal_energy1, Entity == "United States")
UK_coal_energy <- filter(coal_energy1, Entity == "United Kingdom")

coal_energy_plot<-ggplot()+
  geom_line(data = india_coal_energy, aes(x = Year, y =coal/100), color = "green", size =1)+
  geom_line(data = American_coal_energy, aes(x = Year,y = coal/100), color = "orange", size =1)+
  geom_line(data = UK_coal_energy, aes(x = Year, y = coal/100), color = "red", size =1)+
  scale_y_continuous(labels = percent_format())+
  labs(title = "Percentage of Energy Produced from Coal",
       subtitle = "The US and UK have decreased their dependency on Coal Energy",
       x = "Year", y = "Percentage", fill = "Country")+
  scale_color_manual(name = "Group", values = c("red", "orange", "green"), 
                     labels = c("United States", "United Kingdom", "India"))+
  theme_classic()+
  transition_reveal(Year)
animate(coal_energy_plot, nframes = 144, fps = 20)

#Writing RDS
write_rds(coal_energy_plot, "coal_energy.rds")
  
anim_save("coal_use.gif", coal_energy_plot)
