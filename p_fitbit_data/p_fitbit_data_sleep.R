library(tidyverse)

rawData <- read_csv('datasets/sleep_clean.csv')

ggplot(rawData,aes(x=time_in_bed,colour=data_catagory, fill=data_catagory)) +
  geom_density(alpha=0.55) +
  labs(title="Distribution of number of minuites spent in bed",
       subtitle="Enhanced = HR info",
       caption="Fitbit",
       x="Minuites in bed",
       y="Density")

ggplot(rawData, aes(rawData)) + 
  geom_histogram(data = time_in_bed, fill = "red", alpha = 0.2) + 
  geom_histogram(data = minutes_asleep, fill = "blue", alpha = 0.2) +
  labs(title="Distribution of number of minuites spent in bed",
       subtitle="Enhanced = HR info",
       caption="Fitbit",
       x="Minuites in bed",
       y="Density")
