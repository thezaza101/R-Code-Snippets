# Load the required package
library(tidyverse)

# Read the raw data
lines <- c(read_lines("datasets/1.The_Hunger_Games.txt"),
                read_lines("datasets/2.Catching_Fire.txt"),
                read_lines("datasets/3.1.Mockingjay.txt"),
                read_lines("datasets/3.2.Mockingjay.txt"))

# Remove the punctuation from the book
lines <- gsub('[[:punct:]]+','',lines)

# Split the data by spaces
words <- strsplit(lines," ",fixed = T)

# Remove "character(0)" type
words <- words[!sapply(words, identical, character(0))]

# Flatten the list
words <- flatten(words)

# Covert all the words to lowercase
words <- lapply(words, tolower)

# Convert the list to a dataframe
words_df = data.frame(unlist(words))

# Count the number of words
count <- words_df %>% 
  group_by(unlist.words.) %>% 
  filter(!unlist.words.=="") %>% 
  count(sort=TRUE) %>%
  arrange(desc(n)) %>%
  head(50)

# Determine the maximum value of n
maxval = head(count,1)$n

# Add row number as a column
count <- tibble::rowid_to_column(count, "row_number")

# Add Zipf value based on the maximum value of n
# count <- count %>%
count %<>%
  filter(!is.na(unlist.words.)) %>%
  arrange(desc(n)) %>%
  mutate(zipfval = maxval/row_number)

# Plot the findings
ggplot(count, aes(x=reorder(unlist.words., -n), y=n)) +
  geom_bar(stat = "identity", fill="deepskyblue1") + 
  geom_bar(aes(y=zipfval),stat = "identity", fill="dodgerblue4") + 
  geom_line(aes(x=row_number, y=n, color="Actual frequency"), size=1) + 
  geom_line(aes(x=row_number, y=zipfval, color="Zipf frequency"), size=1) +
  coord_cartesian(xlim = c(0, 50), ylim = c(0, maxval)) +
  labs(title="Actual frequency vs Zipf frequency",
       subtitle="Word frequency in the hunger games",
       x="Word",
       y="Frequency",
       colour="") +
  theme(axis.text.x = element_text(angle = 90))



