read_rds("Delhi_1.rds")|>
  select(City, Date, temp)|>
  mutate(Date = year(Date))|>
  filter(City == "New Delhi")|>
  summarize(max_temp = mean(temp), .by = Date)|>
  ggplot(aes(x = Date, y = max_temp))+
  geom_line(linewidth = 1)+
  theme_minimal()+
  labs(title = "New Delhi Temperature",subtitle = "New Delhi's temperatures decreased by 1 degree celsius from 2018-2020",
       x = "Time", y = "Temperature", caption = "Source: Kaggle")