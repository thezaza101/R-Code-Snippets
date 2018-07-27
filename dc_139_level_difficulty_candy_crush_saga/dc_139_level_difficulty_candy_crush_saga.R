## Level difficulty in Candy Crush Saga
## https://projects.datacamp.com/projects/139

## Task 1
# This sets the size of plots to a good default.
options(repr.plot.width = 5, repr.plot.height = 4)

# Loading in packages
library(tidyverse)

## Task 2
# Reading in the data
data <- read_csv('datasets/candy_crush.csv')

# Printing out the first couple of rows
head(data)

## Task 3
print("Number of players:")
length(unique(data$player_id))

print("Period for which we have data:")
max(data$dt) - min(data$dt)
range(data$dt)

## Task 4
# Calculating level difficulty
difficulty <- data %>% group_by(level) %>%
  summarise(wins = sum(num_success), attempts = sum(num_attempts)) %>%
  mutate(p_win = wins / attempts)

# Printing out the level difficulty
difficulty

## Task 5
# Plotting the level difficulty profile
ggplot(difficulty, aes(x=level, y=p_win)) + geom_line() +
  scale_x_continuous(breaks = 1:15) +
  scale_y_continuous(label = scales::percent)

## Task 6
# Adding points and a dashed line
ggplot(difficulty, aes(x=level, y=p_win)) + geom_line() +
  scale_x_continuous(breaks = 1:15) +
  scale_y_continuous(label = scales::percent) +
  
# .... YOUR CODE FOR TASK 6 ....
# Adding points and a dashed line
ggplot(difficulty, aes(x=level, y=p_win)) + geom_line() + geom_point() +
  scale_x_continuous(breaks = 1:15) +
  scale_y_continuous(label = scales::percent) +
  geom_hline(yintercept = .1, linetype = 2)

## Task 7
# Computing the standard error of p_win for each level
difficulty <- difficulty %>%
  mutate(error = sqrt(p_win * (1 - p_win) / attempts))

## Task 8
# Adding standard error bars
ggplot(difficulty, aes(x=level, y=p_win)) + geom_line() + geom_point() +
  scale_x_continuous(breaks = 1:15) +
  scale_y_continuous(label = scales::percent) +
  geom_hline(yintercept = .1, linetype = 2)+
  geom_errorbar(aes(ymin = p_win - error, ymax = p_win + error))

## Task 9 
# The probability of completing the episode without losing a single time
p <- prod(difficulty$p_win)

# Printing it out
p

## Task 10
# Should our level designer worry about that a lot of 
# players will complete the episode in one attempt?
should_the_designer_worry = FALSE # TRUE / FALSE
