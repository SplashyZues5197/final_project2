library(ggplot2)
library(rgdal)

# Load the shape file for India
india_map <- readOGR(dsn = "path/to/shapefile", layer = "india")

# Plot the map
ggplot(india_map) + 
  geom_polygon(aes(x = long, y = lat, group = group), 
               fill = "lightblue", color = "black") + 
  coord_map() + 
  ggtitle("Map of India") + 
  xlab("Longitude") + 
  ylab("Latitude")
