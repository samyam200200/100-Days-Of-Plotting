#Slope graphs
library(ggplot2)
library(gapminder)
library(dplyr)
library(CGPfunctions)
#newggslopegraph takes 3 params - dataset, time variable (which is factor), numeric variable to be plotted
data<-gapminder%>%
  filter(year %in% c(1992, 1997, 2002, 2007) &
           country %in% c("Panama", "Costa Rica", "Nicaragua", "Honduras", "El Salvador", "Guatemala", "Belize"))%>%
  mutate(year=factor(year), lifeExp=round(lifeExp))

newggslopegraph(data, year, lifeExp, country, LineThickness = 2, DataTextSize = 4)+
  labs(title='Life Exp. By country',
       subtitle = 'Central america',
       caption='SOurce: Gapminder')
