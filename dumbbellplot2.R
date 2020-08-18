library("ggalt")
library(tidyr)
library(dplyr)
library(ggplot2)
data(gapminder, package = 'gapminder')
#First convert the data to wide format
longdata<-filter(gapminder, 
                 continent=='Americas'&
                   year%in%c(1952, 2007))%>%
  select(country, year, lifeExp)
longdata<-spread(longdata, year, lifeExp)
names(longdata)<-c("country", "y1952", "y2007")
ggplot(longdata, aes(
  y=country,
  x=y1952,
  xend=y2007
))+
  geom_dumbbell()
# adding colors, modifying lines
ggplot(longdata,
       aes(y=reorder(country, y1952),
           x=y1952,
           xend=y2007))+
  geom_dumbbell(size=1.2,
                size_x=3,
                size_xend = 3,
                color='grey', 
                colour_x = 'blue',
                colour_xend = 'red')+
  theme_minimal()+
  labs(title = 'Change in life exp',
       subtitle = '1952 to 2007',
       x='life expectancy (years)',
       y='')