# Load the required package
library(tidyverse)

# Read the raw data
book_lines <- c(read_lines("datasets/1.The_Hunger_Games.txt"),
                read_lines("datasets/2.Catching_Fire.txt"),
                read_lines("datasets/3.1.Mockingjay.txt"),
                read_lines("datasets/3.2.Mockingjay.txt"))

# Remove the punctuation from the book
book_lines <- gsub('[[:punct:]]+','',book_lines)

# Split the data by spaces
book_words <- strsplit(book_lines," ",fixed = T)

# Remove "character(0)" type
book_words <- book_words[!sapply(book_words, identical, character(0))]

# Flatten the list
book_words <- flatten(book_words)

# Covert all the words to lowercase
book_words <- lapply(book_words, tolower)

# Convert the list to a dataframe
book_words_df = data.frame(unlist(book_words))

# Count the number of words
count <- book_words_df %>% 
  group_by(unlist.book_words.) %>% 
  filter(!unlist.book_words.=="") %>% 
  count(sort=TRUE) %>%
  arrange(desc(n)) %>%
  head(50)

# Determine the maximum value of n
maxval = head(count,1)$n

# Add row number as a column
count <- tibble::rowid_to_column(count, "row_number")

# Add Zipf value based on the maximum value of n
count <- count %>%
  filter(!is.na(unlist.book_words.)) %>%
  arrange(desc(n)) %>%
  mutate(zipfval = maxval/row_number)

# Plot the findings
ggplot(count, aes(x=reorder(unlist.book_words., -n), y=n)) +
  geom_bar(stat = "identity") + 
  geom_line(aes(x=row_number, y=n, color="Actual frequency"), size=2) + 
  geom_line(aes(x=row_number, y=zipfval, color="Zipf frequency"), size=2) +
  coord_cartesian(xlim = c(0, 50)) +
  labs(title="Actual frequency vs Zipf frequency",
       subtitle="Word frequency in the hunger games novels vs zipf frequency",
       x="Word",
       y="Frequency",
       colour="") +
  theme(axis.text.x = element_text(angle = 90))



