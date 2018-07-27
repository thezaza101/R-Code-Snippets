## Wrangling and Visualizing Musical Data
## https://projects.datacamp.com/projects/78

## Task 1
# Loading the tidyverse meta-package
library(tidyverse)

# Reading in the McGill Billboard chord data
bb <- read_csv('datasets/bb_chords.csv')

# Taking a look at the first rows in bb
head(bb)

## Task 2
# Counting the most common chords
bb_count <- bb %>% group_by(chord) %>% count(sort=TRUE)

# Displaying the top 20 chords
head(bb_count, 20)

## Task 3
# Creating a bar plot from `bb_count`
bb_count %>%
  slice(1:20) %>%
  mutate(share = n / sum(n),
         chord = reorder(chord, share)) %>%
  ggplot(aes(x = chord, y = share, fill = chord)) +
  geom_col() +
  coord_flip() +
  xlab("Chord") +
  ylab("Share of total chords") +
  theme(legend.position = 'none')