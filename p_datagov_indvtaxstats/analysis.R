# load the required libraries
library(tidyverse)

# read csv file
rawData <- read_csv("datasets\\Data1016.csv")

head(rawData)

# summerise the data to determine income per state by Income_year
income_by_state_year <- rawData %>% 
  group_by(Income_year, State_Territory) %>% 
  summarise_if(is.numeric, sum) %>%
  select(Income_year, State_Territory, Total_Income_or_Loss, Total_Income_or_Loss_no)

# plot the income by state/year data
ggplot(income_by_state_year, aes(x = Income_year, y=Total_Income_or_Loss/Total_Income_or_Loss_no, group=State_Territory, color=State_Territory)) + 
  geom_point() +
  geom_line() +
  scale_y_continuous(label = scales::dollar_format()) +
  labs(title="Average income by state",
       subtitle="Years. Period: 10-11 to 15-16. Average.",
       caption="Source: data.gov.au",
       x="Income Year",
       y="Total Income or Loss",
       colour="State/Territory")

# summerise the data to determine income per gender by Income_year
income_by_gender_year <- rawData %>% 
  group_by(Income_year, Gender) %>% 
  summarise_if(is.numeric, sum) %>%
  select(Income_year, Gender, Total_Income_or_Loss, Total_Income_or_Loss_no)

# plot the income by gender/year data
ggplot(income_by_gender_year, aes(x = Income_year, y=Total_Income_or_Loss/Total_Income_or_Loss_no, group=Gender, color=Gender)) + 
  geom_point() +
  geom_line() +
  scale_y_continuous(label = scales::dollar_format()) +
  labs(title="Average income by gender",
       subtitle="Years. Period: 10-11 to 15-16. Average.",
       caption="Source: data.gov.au",
       x="Income Year",
       y="Total Income or Loss")

# summerise the data to determine income per gender/state by Income_year
income_by_state_gender_year <- rawData %>% 
  group_by(Income_year, State_Territory, Gender) %>% 
  summarise_if(is.numeric, sum) %>%
  mutate(Avr_incpme=Total_Income_or_Loss/Total_Income_or_Loss_no) %>%
  spread(Gender, Avr_incpme) %>% 
  select(Income_year, State_Territory, Male, Female)

# plot the income by state/gender/year data
ggplot(income_by_state_gender_year, aes(x = Income_year, y=Male+Female, group=State_Territory, color=State_Territory)) + 
  geom_point() +
  scale_y_continuous(label = scales::dollar_format()) +
  labs(title="Average income by state/gender",
       subtitle="Years. Period: 10-11 to 15-16. Average.",
       caption="Source: data.gov.au",
       x="Income Year",
       y="Total Income or Loss",
       colour="State/Territory")
