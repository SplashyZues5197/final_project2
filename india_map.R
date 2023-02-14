structure(list(NAME_1 = structure(c(12L, 34L, 2L, 17L, 21L, 10L, 
                                    31L, 1L, 3L, 4L, 5L, 6L, 7L, 9L, 8L, 11L, 14L, 13L, 16L, 15L, 
                                    18L, 19L, 23L, 22L, 20L, 24L, 25L, 26L, 28L, 27L, 29L, 30L, 32L, 
                                    33L, 35L, 36L), .Label = c("Andaman and Nicobar Islands", "Andhra Pradesh", 
                                                               "Arunachal Pradesh", "Assam", "Bihar", "Chandigarh", "Chhattisgarh", 
                                                               "Dadra and Nagar Haveli", "Daman and Diu", "Delhi", "Goa", "Gujarat", 
                                                               "Haryana", "Himachal Pradesh", "Jammu and Kashmir", "Jharkhand", 
                                                               "Karnataka", "Kerala", "Lakshadweep", "Madhya Pradesh", "Maharashtra", 
                                                               "Manipur", "Meghalaya", "Mizoram", "Nagaland", "Odisha", "Puducherry", 
                                                               "Punjab", "Rajasthan", "Sikkim", "Tamil Nadu", "Telangana", "Tripura", 
                                                               "Uttar Pradesh", "Uttarakhand", "West Bengal"), class = "factor"), 
               Score = c(100L, 92L, 42L, 37L, 26L, 19L, 13L, 5L, 5L, 5L, 
                         5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 
                         5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L)), class = "data.frame", row.names = c(NA, 
                                                                                                           -36L))
library(dplyr)
library(tmap)    
library(ggplot2)
b<-read.csv("2004.csv")
cmap<-st_read("IND_adm/IND_adm1.shp")

b_cmap<-inner_join(cmap, b)
ggplot(b_cmap)+ geom_sf(aes(fill=Score))