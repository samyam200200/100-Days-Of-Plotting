#cleaveland dot plot
library(gapminder)
library(tidyverse)
data<-gapminder%>%filter(continent=="Asia"&year==2007)
ggplot(data, aes(x=lifeExp, y=reorder(country, lifeExp)))+geom_point()
ggplot(data, aes(x=lifeExp, y=reorder(country, lifeExp)))+geom_point(size=3, col="blue")+geom_segment(aes(x=40, xend=lifeExp, y=reorder(country, lifeExp), yend=reorder(country, lifeExp)), color="lightgrey", size=2)+theme_minimal()+theme(panel.grid.major = element_blank())
