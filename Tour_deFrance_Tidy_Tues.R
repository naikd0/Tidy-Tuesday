library(tidyverse)
library(ggplot2)
library(gganimate)
library(ggrepel)



tdf_winners <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-04-07/tdf_stages.csv')

tdf_winners %>%
ggplot(aes(x = Distance,y = Date, color = Type)) +
  geom_point(na.rm = TRUE,alpha = 0.5) +
  geom_label_repel(data = tdf_winners%>% sample_n(20),
                   aes(label = Winner),size= 2.0,
                   nudge_y = -10,na.rm = TRUE,
                   segment.alpha = 0.2)+
  labs(x = "Distance in KM", y = "Date", 
       title = "Tour deFrance How each winner Won for their countries", 
       subtitle = "The racers really stepped up their game over the decades!") +
  ## set up the animation  
  transition_states(start_date, transition_length = 1,
                    state_length = 0.3)+
  transition_time(start_date)+
  shadow_mark(past = TRUE)



