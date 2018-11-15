#https://medium.com/@NickDoesData/visualizing-geographic-data-in-r-fb2e0f5b59c5
library(tidyverse)
library(geofacet)
library(stringr)
library(fiftystater)

data <- read_csv("datasets//data_fixed.csv")

ggplot(data, aes(map_id = 1)) + 
  geom_map(aes(fill = "1 Homicide" ),color="#ffffff",size=.15, map = 1)
