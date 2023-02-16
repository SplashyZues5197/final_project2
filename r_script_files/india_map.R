library(ggplot2)
library(sf)
library(rvest)
library(dplyr)
library(viridis)
library(ggrepel)
library(ggthemes)
shp0 <- read_sf("IND_adm0.shp")
shp1 <- read_sf("IND_adm1.shp")
shp2 <- read_sf("IND_adm2.shp")
shp3 <- read_sf("IND_adm3.shp")
 shp1<- shp1|>
  dplyr::mutate(NAME_1 = if_else(NAME_1== "Uttaranchal", "Uttarakhand", NAME_1))
 
p11 <- ggplot(shp0)
p11<- p11 + geom_sf(fill = "#E8442A", color = "#F53214")
p11 <- theme_void()
p11 <- p11 + labs(title = "Indian Country Map")
p11

# State level map
# Fill each state in different color
p12<- ggplot(shp1)
p12 <- p12 + geom_sf(aes(fill = NAME_1))
p12 <- p12 + theme(legend.position = "none")
p12 <- p12 + labs(title = "India states map")
p12 <- p12 + scale_fill_viridis_d()
p12<- p12 + theme_void()
p12

# district level map

pl3<- ggplot(shp2)+
  geom_sf(aes(fill = NAME_2))+
  theme(legend.position = "none")+
  labs(title = "Indian District map")+
  scale_fill_viridis_d(option = "magma")+
  theme_void()
pl3