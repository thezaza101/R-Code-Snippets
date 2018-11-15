library(tidyverse)

data <- iris

ggplot(data, aes(x=Sepal.Length, y=Sepal.Width, color=Species)) +
  geom_jitter() +
  labs(title="Sepal Length vs Sepal Width",
       caption="Data: Iris Dataset",
       x="Sepal Length",
       y="Sepal Width",
       colour="Classifier")

ggplot(data, aes(x=Sepal.Length, y=Petal.Length, color=Species)) + 
  geom_jitter() + 
  labs(title="Sepal Length vs Petal Length",
       caption="Data: Iris Dataset",
       x="Sepal Length",
       y="Sepal Width",
       colour="Classifier")

