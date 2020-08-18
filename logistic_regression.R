library(dplyr)
library(ggplot2)
library(visreg)
library(mosaicData)
data<-CPS85
cps85_glm<-glm(married~sex+age+race+sector,
  family='binomial',
  data=data
)
# scale='response' plots the probabilities
visreg(cps85_glm, "age",
  gg=T,
  scale='response'
)+
  labs(y="Probability Marries",
       x="Age",
       Title="Relationship between age and maraital status",
       subtitle = "controlling for sex, race, and job",
       caption="source: Curent Population Survey 1985")
# adding by allows for facet for example by="sex" allows facetting male and female
visreg(cps85_glm, "age",
       by="sex",
       gg=T, 
       scale='response')+
  labs(y="Probability Marries",
       x="Age",
       Title="Relationship between age and maraital status",
       subtitle = "controlling for race, and job sector",
       caption="source: Curent Population Survey 1985") 
