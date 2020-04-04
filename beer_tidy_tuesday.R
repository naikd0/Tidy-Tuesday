install.packages("tidyverse")
library(readr)
library(tidyverse)
library(ggplot2)
library(lubridate)


beer_states <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-31/beer_states.csv')

beer_states %>%
  filter(state == "NJ" | state == "OR") %>%
  ggplot(aes(x = year, y = barrels)) +
  geom_histogram(aes(fill = state), stat = "identity") +
  scale_fill_manual(values = c("darkgreen","firebrick1"))+
  theme(axis.text.x = element_text(angle=65)) +
  labs(title = "Comparing Beer production in NJ vs OR")
 
