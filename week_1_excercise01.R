

library(tidyverse)

mpg

dim(mpg)
?mpg

ggplot(mpg) +
  geom_point(aes(hwy, cyl))

ggplot(mpg) +
  geom_point(aes(class, drv))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), shape = 10, color = "red")


ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), stroke = 5, shape = 21, color = "red", fill = "black", size = 5)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = displ < 5))


?geom_point
             