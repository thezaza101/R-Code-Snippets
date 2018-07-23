## https://projects.datacamp.com/projects/49
## Task 1
# Load in the tidyverse package
library(tidyverse)
# Read datasets/yearly_deaths_by_clinic.csv into yearly
yearly <- read_csv('datasets/yearly_deaths_by_clinic.csv')

# Print out yearly
yearly

## Task 2
# Adding a new column to yearly with proportion of deaths per no. births
yearly <- yearly %>% mutate(proportion_deaths = deaths / births)

# Print out yearly
yearly

## Task 3
# Setting the size of plots in this notebook
options(repr.plot.width=7, repr.plot.height=4)

# Plot yearly proportion of deaths at the two clinics
ggplot(yearly, aes(x = year, y = proportion_deaths, color = clinic)) + geom_line()

## Task 4
