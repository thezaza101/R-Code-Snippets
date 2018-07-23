## https://projects.datacamp.com/projects/62
## Task 1
# This sets plot images to a nice size.
options(repr.plot.width = 4, repr.plot.height = 4)

# Loading in the ggplot2 package
library(ggplot2)


## Task 2
t <- seq(0, 2*pi, length.out = 50)
x <- sin(t)
y <- cos(t)
df <- data.frame(t, x, y)

# Make a scatter plot of points in a circle
p <- ggplot(df, aes(x, y))
p + geom_point()

## Task 3
# Defining the number of points
points <- 500

# Defining the Golden Angle
angle <- pi*(3-sqrt(5))

t <- (1:points) * angle
x <- sin(t)
y <-cos(t)
df <- data.frame(t, x, y)

# Make a scatter plot of points in a spiral
p <- ggplot(df, aes(x*t, y*t))
p  + geom_point()


## Task 4
df <- data.frame(t, x, y)

# Make a scatter plot of points in a spiral
p <- ggplot(df, aes(x*t, y*t))
p + geom_point() +
  theme(
    panel.grid = element_blank(),
    axis.ticks = element_blank(),
    title = element_blank(),
    text = element_blank(),
    panel.background = element_rect(fill = "white")
  )

## Task 5

p <- ggplot(df, aes(x*t, y*t))
p + geom_point(size=8, alpha=0.5, color="darkgreen") +
  theme(
    panel.grid = element_blank(),
    axis.ticks = element_blank(),
    title = element_blank(),
    text = element_blank(),
    panel.background = element_rect(fill = "white")
  )

## Task 6

p <- ggplot(df, aes(x*t, y*t))
p + geom_point(aes(size = t), alpha = 0.5, shape = 8, color = "black") +
  theme(
    panel.grid = element_blank(),
    axis.ticks = element_blank(),
    title = element_blank(),
    text = element_blank(),
    panel.background = element_rect(fill = "white"),
    legend.position = "none"
  )

## Task 7

p <- ggplot(df, aes(x*t, y*t))
p + geom_point(aes(size = t), alpha = 0.5, shape = 17, color = "yellow") +
  theme(
    panel.grid = element_blank(),
    axis.ticks = element_blank(),
    title = element_blank(),
    text = element_blank(),
    panel.background = element_rect(fill = "darkmagenta"),
    legend.position = "none"
  )

## Task 8

angle <- 2.0
points <- 1000

t <- (1:points)*angle
x <- sin(t)
y <- cos(t)

df <- data.frame(t, x, y)

p <- ggplot(df, aes(x*t, y*t))

p + geom_point(aes(size = t), alpha = 0.5, shape = 17, color = "yellow") +
  theme(
    panel.grid = element_blank(),
    axis.ticks = element_blank(),
    title = element_blank(),
    text = element_blank(),
    panel.background = element_rect(fill = "darkmagenta"),
    legend.position = "none"
  )

## Task 9

angle <- 13* pi/180
points <- 2000

t <- (1:points)*angle
x <- sin(t)
y <- cos(t)

df <- data.frame(t, x, y)

p <- ggplot(df, aes(x*t, y*t))

p + geom_point(aes(size = 80), alpha = 0.5, shape = 1, color = "magenta4") +
  theme(
    panel.grid = element_blank(),
    axis.ticks = element_blank(),
    title = element_blank(),
    text = element_blank(),
    panel.background = element_rect(fill = "white"),
    legend.position = "none"
  )





