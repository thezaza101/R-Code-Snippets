library(tidyverse)

rawData <- read_csv('datasets/UNdata.csv')

flaterData <- rawData %>% spread(sex, value)

unqueReligions <- unique(flaterData$religion)

totalChangeOverTime <- flaterData %>% 
  group_by(religion) %>% 
  filter(area=="Total", country_or_area=="Australia", religion!="Total") %>% 
  select(country_or_area, year, religion, Male, Female) 

totalChangeOverTime <- totalChangeOverTime %>% arrange(desc(Male + Female)) %>% head(30)

ggplot(totalChangeOverTime, aes(year, Male+Female, color = religion)) + 
  geom_line() 
## + theme(legend.position="none")
