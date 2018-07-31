library(tidyverse)

rawData <- read_csv('datasets/UNdata.csv')

flaterData <- rawData %>% spread(sex, value)

unqueReligions <- unique(flaterData$religion)

totalChangeOverTime <- flaterData %>% group_by(religion) %>% filter(area=="Total")



## Non-religion = "Agnostic", "Atheist", "No religion, Agnostic, Atheist" 
## "Humanist", 