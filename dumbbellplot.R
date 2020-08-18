#Dumbbell plots
library(tidyverse)
data(gapminder, package = "gapminder")
plotdata_long<-filter(gapminder, continent=="Americas"&year%in% c(1952,2007))%>%select(country, year, lifeExp)
plotdata_wide<-spread(plotdata_long,year, lifeExp)
names(plotdata_wide)<-c("country", "y1952", "y2007")
ggplot(plotdata_wide, aes(y=county, x=y1952, xend=y2007))+geom_dumbbell()