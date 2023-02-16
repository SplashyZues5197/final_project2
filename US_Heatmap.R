

library(usmap)
library(scales)
library(tidyverse)
library(primer.data)
library(dbplyr)
library(janitor)
library(scales)
library(ggplot2)
library(tidyr)
library(gganimate)
library(transformr)

#getting and meging data
file1 <- read_csv(file = "110-tavg-201401-12.csv", show_col_types = FALSE)|>
  select(Location, Value)|>
  mutate(Year = 2014)
file2 <- read_csv(file = "110-tavg-201501-12.csv", show_col_types = FALSE)|>
  select(Location, Value)|>
  mutate(Year = 2015)
file3 <- read_csv(file = "110-tavg-201601-12.csv", show_col_types = FALSE)|>
  select(Location, Value)|>
  mutate(Year = 2016)
file4 <- read_csv(file = "110-tavg-201701-12.csv", show_col_types = FALSE)|>
  select(Location, Value)|>
  mutate(Year = 2017)
file5 <- read_csv(file = "110-tavg-201801-12.csv", show_col_types = FALSE)|>
  select(Location, Value)|>
  mutate(Year = 2018)
file6 <- read_csv(file = "110-tavg-201901-12.csv", show_col_types = FALSE)|>
  select(Location, Value)|>
  mutate(Year = 2019)
file7 <- read_csv(file = "110-tavg-202001-12.csv", show_col_types = FALSE)|>
  select(Location, Value)|>
  mutate(Year = 2020)
file8 <- read_csv(file = "110-tavg-202101-12.csv", show_col_types = FALSE)|>
  select(Location, Value)|>
  mutate(Year = 2021)
file9 <- read_csv(file = "110-tavg-202201-12.csv", show_col_types = FALSE)|>
  select(Location, Value)|>
  mutate(Year = 2022)
file10 <- read_csv(file = "110-tavg-202301-1.csv", show_col_types = FALSE)|>
  select(Location, Value)|>
  mutate(Year = 2023)

file11 <- read_csv(file = "110-tavg-190001-12.csv", show_col_types = FALSE)|>
  select(Location, Value)
file12 <- read_csv(file = "110-tavg-196001-12.csv", show_col_types = FALSE)|>
  select(Location, Value)
file13 <- read_csv(file = "110-tavg-200001-12.csv", show_col_types = FALSE)|>
  select(Location, Value)



colnames(file1) <- c("state", "temp_F","year")
colnames(file2) <- c("state", "temp_F","year")
colnames(file3) <- c("state", "temp_F","year")
colnames(file4) <- c("state", "temp_F","year")
colnames(file5) <- c("state", "temp_F","year")
colnames(file6) <- c("state", "temp_F","year")
colnames(file7) <- c("state", "temp_F","year")
colnames(file8) <- c("state", "temp_F","year")
colnames(file9) <- c("state", "temp_F","year")
colnames(file10) <- c("state", "temp_F","year")
colnames(file11) <- c("state", "temp_F","year")
colnames(file12) <- c("state", "temp_F","year")
colnames(file13) <- c("state", "temp_F","year")









# advanced annual temperature map
library(ggplot2)
#2023
plot_2023<- plot_usmap(data = file10,
           regions =  "states",
           values = "temp_F",
           labels = TRUE, exclude = c("AK", "HI"))+
  scale_fill_continuous(low = "green",
                        high = "red",
                        name = "Temperature in °F")+
  labs(title = "United States average annual temperature [°F] in 2023")+
  theme(legend.position = "right")
#Writing RDS
write_rds(plot_2023, "2023.rds")

#2014
plot_2014<- plot_usmap(data = file1,
           regions =  "states",
           values = "temp_F",
           labels = TRUE, exclude = c("AK", "HI"))+
  scale_fill_continuous(low = "green",
                        high = "red",
                        name = "Temperature in °F")+
  labs(title = "United States average annual temperature [°F]")+
  theme(legend.position = "right")

#Writing RDS
write_rds(plot_2014, "2014.rds")

#1900
plot_1900 <- plot_usmap(data = file11,
           regions =  "states",
           values = "temp_F",
           labels = TRUE, exclude = c("AK", "HI"))+
  scale_fill_continuous(low = "green",
                        high = "red",
                        name = "Temperature in °F")+
  labs(title = "United States average annual temperature [°F] in 1900")+
  theme(legend.position = "right")

#Writing RDS
write_rds(plot_1900, "1900.rds")

#1960
plot_1960<-plot_usmap(data = file12,
           regions =  "states",
           values = "temp_F",
           labels = TRUE, exclude = c("AK", "HI"))+
  scale_fill_continuous(low = "green",
                        high = "red",
                        name = "Temperature in °F")+
  labs(title = "United States average annual temperature [°F] in 1960")+
  theme(legend.position = "right")

#Writing RDS
write_rds(plot_1960, "1960.rds")

#2000
plot_2000<-plot_usmap(data = file13,
           regions =  "states",
           values = "temp_F",
           labels = TRUE, exclude = c("AK", "HI"))+
  scale_fill_continuous(low = "green",
                        high = "red",
                        name = "Temperature in °F")+
  labs(title = "United States average annual temperature [°F] in 2000")+
  theme(legend.position = "right")
#Writing RDS
write_rds(plot_2000, "2000.rds")
