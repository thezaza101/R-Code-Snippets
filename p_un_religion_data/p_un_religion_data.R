library(tidyverse)

rawData = read_csv('datasets/UNdata.csv')

flaterData = rawData %>% spread(Sex, Value)

totalChangeOverTime = flaterData %>% group_by("Religion") %>% filter(Area=="Total") 
