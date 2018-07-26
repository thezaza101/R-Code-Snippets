## https://projects.datacamp.com/projects/74
## Project: Exploring the Kaggle Data Science Survey

## Task 1
# Loading necessary packages
library(tidyverse)

# Loading the data
responses <- read_csv('datasets/kagglesurvey.csv')

# Printing the first 10 rows
head(responses, 10)

## Task 2
# Printing the first respondents' tools and languages
head(responses$WorkToolsSelect)

# Creating a new data frame called tools
tools <- responses

# Adding a new column to tools which splits the WorkToolsSelect column at the commas and unnests the new column
tools <- tools  %>% 
  mutate(work_tools = strsplit(WorkToolsSelect, ",")) %>%
  unnest(work_tools)

# Viewing the first 6 rows of tools
head(tools, 6)

## Task 3
# Creating a new data frame
tool_count <- tools

# Grouping the data by work_tools, calculate the number of responses in each group
tool_count <- tool_count  %>% 
  group_by(work_tools)  %>% 
  summarise(n = n())

# Sorting tool_count so that the most popular tools are at the top
tool_count <- tool_count %>%
  arrange(desc(n))

# Printing the first 6 results
head(tool_count, 6)

## Task 4
# Creating a bar chart of the work_tools column. 
# Arranging the bars so that the tallest are on the far right
ggplot(tool_count, aes(x = reorder(work_tools, n), y = n)) + 
  geom_bar(stat = 'identity') +
  
  # Rotating the bar labels 90 degrees
  theme(axis.text.x = element_text(angle = 90))

## Task 5
# Creating a new data frame called debate_tools
debate_tools <- responses

# Creating a new column called language preference, based on the conditions specified in the Instructions
debate_tools <- debate_tools  %>% 
  mutate(language_preference = case_when(
    grepl("Python", WorkToolsSelect) & grepl("R", WorkToolsSelect) ~ "both",
    grepl("R", WorkToolsSelect) ~ "R",
    grepl("Python", WorkToolsSelect) ~ "Python",
    !(grepl("R", WorkToolsSelect) & grepl("Python", WorkToolsSelect)) ~ "neither"))

# Printing the first 6 rows
head(debate_tools, 6)

## Task 6
# Creating a new data frame
debate_plot <- debate_tools

# Grouping by language preference and calculate number of responses
debate_plot <- debate_plot  %>% 
  group_by(language_preference)  %>% 
  summarise(n=n())  %>% 
  
  # Removing the row for users of "neither"
  filter(language_preference != "neither")

# Creating a bar chart
ggplot(debate_plot, aes(x = language_preference, y = n)) + 
  geom_bar(stat = 'identity')

## Task 7
# Creating a new data frame
recommendations <- debate_tools

# Grouping by language_preference and then LanguageRecommendationSelect
recommendations <- recommendations  %>% 
  group_by(language_preference, LanguageRecommendationSelect)  %>% 
  summarise(n = n()) %>%
  
  # Removing empty responses and include the top recommendations
  filter(!is.na(LanguageRecommendationSelect)) %>%
  arrange(desc(n)) %>%
  mutate(row_number = row_number()) %>%
  filter((row_number <= 4))
# Or replace the last 3 lines with 'filter(row_number() <= 4)'

  ## Task 8
  # Creating a faceted bar plot
  ggplot(recommendations, aes(x=LanguageRecommendationSelect, y=n, color=LanguageRecommendationSelect)) +
    geom_bar(stat="identity") +
    facet_wrap(~language_preference) +
    theme(axis.text.x = element_text(angle = 90),legend.position="none")

## Task 9
# Would R users find this statement TRUE or FALSE?
R_is_number_one = TRUE



