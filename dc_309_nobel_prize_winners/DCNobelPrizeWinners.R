## Note that this is not based on the official data camp project
## Taskes were sourced from github and the data from kaggle

## Task 1
# Loading in required libraries
library(tidyverse)
#source("R/formatDate.R")

# Reading in the Nobel Prize data
nobel <- read_csv('datasets/nobel1.csv')

# This is required to make all the dates consistant in the dataset
frmtdate  <- as.Date(nobel$birth_date, format="%Y-%m-%d")
nobel$birth_date[!is.na(frmtdate)] <- format(frmtdate[!is.na(frmtdate)], "%d/%m/%Y")


#nobel[,"birth_date"] <- sapply(nobel[,"birth_date"], function(x) formatDate(x))

# Taking a look at the first couple of winners
head(nobel)

## Task 2
# Counting the number of (possibly shared) Nobel Prizes handed
# out between 1901 and 2016
nobel %>%  count()

# Counting the number of prizes won by male and female recipients.
nobel %>% group_by(sex) %>% count(sort=TRUE)

# Counting the number of prizes won by different nationalities.
nobel %>% group_by(birth_country) %>% count(sort=TRUE)

## Task 3
# Calculating the proportion of USA born winners per decade
prop_usa_winners <- nobel %>% 
  mutate(usa_born_winner = birth_country == "United States of America")%>%
  mutate(decade = floor(year / 10) * 10)%>%
  group_by(decade)%>%
  summarise(proportion = mean(usa_born_winner, na.rm=TRUE))

# Display the proportions of USA born winners per decade
prop_usa_winners

## Task 4
# Setting the size of plots in this notebook
options(repr.plot.width=7, repr.plot.height=4)

# Plotting USA born winners
ggplot(prop_usa_winners, aes(x=decade, y=proportion)) + 
  geom_line() + 
  geom_point() + 
  scale_y_continuous(limits = c(0, 1), labels = scales::percent, expand = c(0,0))

## Task 5
# Calculating the proportion of female laureates per decade
prop_female_winners <- nobel %>%
  mutate(female_winner = sex == "Female")%>%
  mutate(decade = floor(year / 10) * 10)%>%
  group_by(decade, category)%>%
  summarise(proportion = mean(female_winner, na.rm=TRUE))

# Plotting the proportion of female laureates per decade
ggplot(prop_female_winners, aes(x=decade, y=proportion, color = category)) + 
  geom_line() + 
  geom_point() + 
  scale_y_continuous(limits = c(0, 1), labels = scales::percent, expand = c(0,0))

## Task 6
# Picking out the first woman to win a Nobel Prize
nobel %>%
  filter(sex == "Female")%>%
  top_n(1, desc(year))

## Task 7
# Selecting the laureates that have received 2 or more prizes.
nobel %>%
  group_by(full_name)%>%
  count()%>%
  filter(n > 1)

## Task 8
# Loading the lubridate package
library(lubridate)

# Calculating the age of Nobel Prize winners
nobel_age <- nobel %>%
  mutate(age = year - year(as.Date(birth_date, "%d/%m/%Y")))

# Plotting the age of Nobel Prize winners
ggplot(nobel_age, aes(x=year, y=age)) +   geom_point() +  geom_smooth()

## Task 9
# Same plot as above, but faceted by the category of the Nobel Prize
ggplot(nobel_age, aes(x=year, y=age)) +  geom_point() +   geom_smooth(se = FALSE) + facet_wrap(~category)

## Task 10
# The oldest winner of a Nobel Prize as of 2018
nobel_age %>% top_n(1, age)

# The youngest winner of a Nobel Prize as of 2018
nobel_age %>% top_n(1, desc(age))

## Task 11
youngest_winner <- "Malala Yousafzai"


# png("myplot.png")
# myplot <- ggplot(mtcars, aes(wt, mpg)) + geom_point()
# print(myplot)
# dev.off()

# sapply
