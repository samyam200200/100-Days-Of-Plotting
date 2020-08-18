#Area chart
library(ggplot2)
library(dplyr)
library(gcookbook)
data<-economics
ggplot(data, aes(x=date, y=psavert))+
  geom_area(fill='lightblue', color='black')+
  labs(title='Personal savings rate',
       x='Date',
       y='Personal savings rate')
#stacked area chart to show diffrences in group over time
data<-uspopage
ggplot(data, aes(x=Year,
                     y=Thousands, 
                     fill=AgeGroup))+
  geom_area()+
  labs(title = 'US population by age',
       x="Year",
       y="Population in Thousands")
#Cahnging sci notation of y-axis, reversing age group (using fct_rev function in forcats), diffrent vcolor, simple theme
ggplot(data, aes(x=Year,
                 y=Thousands/1000,
                 fill=forcats::fct_rev(AgeGroup)))+
  geom_area(color="black")+
  labs(title = 'US population by age',
       subtitle = '1990 to 2002',
       caption='source: US Census Bureau, 2003, HS-3',
       x='Year',
       y='Population in Millions',
       fill='Age group')+
  scale_fill_brewer(palette = 'Set2')+
  theme_minimal()