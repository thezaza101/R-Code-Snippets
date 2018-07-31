library(tidyverse)
library(ggplot2)

data <- read_csv('data.csv')

plotx <- ggplot(data, aes(a,b)) + geom_boxplot()

ggsave("plot.png", plot=plotx)