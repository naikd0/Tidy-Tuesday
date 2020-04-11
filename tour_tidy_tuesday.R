install.packages("tidyverse")
install.packages("gganimate")
install.packages("gifski")
install.packages("gapminder")
library(readr)
library(tidyverse)
library(ggplot2)
library(gganimate)
library(ggrepel)


tdf_winners <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-04-07/tdf_winners.csv')

## combined distance with time to find the average speed
#tdf_winners %>%
  #mutate(average_speed = distance/time_overall)->tdf_winners_2

## make the plot
tdf_winners %>%
  ggplot(aes(x = time_overall,y =  distance,color = start_date ))+#average_speed, color = nationality )) +
  geom_point(na.rm = TRUE,alpha = 0.5) +
  geom_label_repel(data = tdf_winners %>% sample_n(20),
                   aes(label = winner_name),size= 2.0,
                   nudge_y = -10,na.rm = TRUE,
                   segment.alpha = 0.2)+
  labs(x = "Time overall", y = "Distance", 
       title = "Tour de France Winners ", 
       subtitle = "As the years progressed the distance of the races shortened leading to shorter timmings!") +
## set up the animation  
  transition_states(start_date, transition_length = 1,
                    state_length = 0.3)+
  transition_time(start_date)+
  shadow_mark(past = TRUE)


