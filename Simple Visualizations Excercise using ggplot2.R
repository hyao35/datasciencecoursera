
library(tidyverse)

iris %>%
  ggplot(aes(Sepal.Length, Sepal.Width, color = Species, shape = Species)) +
  geom_point() +
  geom_density2d() +
  ggtitle('IRIS') +
  theme_light()


iris %>%
  ggplot(aes(Sepal.Length, Sepal.Width, color = Species, shape = Species)) +
  geom_point() +
  geom_density2d() +
  ggtitle('IRIS') +
  theme_light()


iris %>%
  mutate(Species = 'ALL') %>%
  bind_rows(iris) %>%
  ggplot(aes(Petal.Length, Petal.Width, color = Species)) +
  geom_point() +
  geom_smooth() +
  xlab('Petal Length') +
  ylab('Petal Width') +
  facet_wrap(~Species, scales = 'free') +
  theme_bw()
## Warning in bind_rows_(x, .id): binding character and factor vector,
## coercing into character vector

mtcars %>%
  rownames_to_column() %>%
  mutate(rowname = forcats::fct_reorder(rowname, mpg)) %>%
  ggplot(aes(rowname, mpg, label = rowname)) +
  geom_point() +
  geom_text(nudge_y = .3, hjust = 'left') +
  coord_flip() +
  ylab('Miles per gallon fuel consumption') +
  ylim(10, 40) +
  theme_classic() +
  theme(plot.title = element_text(hjust = 0, size = 16),
        axis.title.x = element_text(face = 'bold'),
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.line.y = element_blank())


mtcars %>%
  ggplot(aes(mpg, qsec, size = disp, color = as.factor(am))) +
  geom_point() +
  scale_colour_discrete(name  ="Gear",
                        breaks=c(0, 1),
                        labels=c("Manual", "Automatic")) +
  scale_size_continuous(name = 'Displacement') +
  xlab('Miles per gallon') +
  ylab('1/4 mile time') +
  theme_light()


economics %>%
  ggplot(aes(date, uempmed)) +
  geom_line() +
  expand_limits(y  = 0) +
  ggtitle('Median duration of unemployment [weeks]') +
  ylab('Median duration of unemployment [weeks]') +
  ggthemes::theme_economist_white() +
  theme(axis.title.x = element_blank())



diamonds2plot <- diamonds %>%
  group_by(cut, color) %>%
  summarise(price = mean(price)) %>%
  arrange(color, price) %>%
  ungroup() %>%
  mutate(id = row_number(),
         angle = 90 - 360 * (id - 0.5) / n())

diamonds2plot  %>%
  ggplot(aes(factor(id), price, fill = color, group = cut, label = cut)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  geom_text(hjust = 0, angle = diamonds2plot$angle, alpha = .5) +
  coord_polar() +
  ggtitle('Mean dimond price') +
  ylim(-3000, 7000) +
  theme_void() +
  theme(plot.title = element_text(hjust = 0.5, size = 16, face = 'bold'))











