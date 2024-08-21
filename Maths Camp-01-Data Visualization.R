library(tidyverse)

mpg

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(method = "lm") +
  theme_minimal()+
  labs(
    title = "Engine displacement and highway miles per gallon",
    subtitle = "Values for seven different classes of cars",
    x = "Engine displacement (L)",
    y = "Highway miles per gallon",
  )
  
select(mpg, manufacturer, model, drv)
ggplot (mpg, aes(x = drv)) +
  geom_bar()

ggplot(mpg, aes(x = fct_infreq(drv)))+
  geom_bar()

ggplot (mpg, aes(x=hwy)) +
  geom_histogram()

ggplot(mpg, aes(x = hwy, color = drv, fill = drv)) +
  geom_density(alpha = 0.5) 
