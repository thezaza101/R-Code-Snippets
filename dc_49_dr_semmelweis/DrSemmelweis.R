## https://projects.datacamp.com/projects/49
## Dr. Semmelweis and the discovery of handwashing

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
# Read datasets/monthly_deaths.csv into monthly
monthly <- read_csv('datasets/monthly_deaths.csv')

# Adding a new column with proportion of deaths per no. births
monthly <- monthly %>% mutate(proportion_deaths = deaths / births)

# Print out the first rows in monthly
head(monthly)

## Task 5
# Plot monthly proportion of deaths
ggplot(monthly, aes(x = date, y = proportion_deaths, color = 'red')) + labs(title ="Monthly death proportion", x = "Date", y = "Death / Birth ratio") + geom_line()

## Task 6
# From this date handwashing was made mandatory
handwashing_start = as.Date('1847-06-01')

# Add a TRUE/FALSE column to monthly called handwashing_started
monthly <- monthly %>% mutate(handwashing_started = date >= handwashing_start)

# Plot monthly proportion of deaths before and after handwashing
ggplot(monthly, aes(x = date, y = proportion_deaths, color = handwashing_started)) + labs(title ="Monthly death proportion", x = "Date", y = "Death / Birth ratio") + geom_line()

## Task 7
# Calculating the mean proportion of deaths 
# before and after handwashing.
monthly_summary <- monthly %>% group_by(handwashing_started) %>% summarise(mean_proportion_deaths = mean(proportion_deaths))


# Printing out the summary.
monthly_summary

## Task 8
# Calculating a 95% Confidence intrerval using t.test 
test_result <- t.test( proportion_deaths ~ handwashing_started, data = monthly)
test_result

## Task 9 
# The data Semmelweis collected points to that:
doctors_should_wash_their_hands <- TRUE

