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

indian_floods <- read_csv(file = "India_Floods_Inventory.csv", show_col_types = FALSE)
colnames(indian_floods)<- c("UEI","Start_Date","End_Date","Duration","Main_Cause",
                            "Location","Districts","State","Latitude","Longitude","Severity","Area_Affected",
                            "Human_Fatality","Human_Injured","Human_Displaced","Animal_Fatality")
rain_data <-indian_floods |>
  select(Start_Date, Duration, Main_Cause, State)|>
  arrange((Start_Date))|>
  na.omit()|>
  filter(Main_Cause == "Heavy rain")|>
  filter(Duration >1)|>
  mutate(Start_Date = year(Start_Date))

ggplot(rain_data, aes(x = Start_Date))+
  geom_bar()
    