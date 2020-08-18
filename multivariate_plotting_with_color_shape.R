#Multivariate graphs
#Grouping
#first two variable - x and y axis then shape, size, color
library(tidyverse)
library(carData)
#using color and shape
ggplot(Salaries, aes(x=yrs.since.phd, y=salary, color=rank, shape=sex))+geom_point( size=3, alpha=.6)+labs(title = "Academic salary by years since degree")
#using size
ggplot(Salaries, aes(x=yrs.since.phd, y=salary, color=rank, size=yrs.service))+geom_point( alpha=.6)+labs(title = "Academic salary by years since degree")
#plottinng the best fit line
ggplot(Salaries, aes(x=yrs.since.phd, y=salary, color=sex))+geom_point(alpha=.4, size=3)+geom_smooth(se=F, method="lm", formula = y~poly(x,3), size=1.5)+labs(x="Yrs since phd", y="", color="Sex")+scale_y_continuous(label=scales::dollar)+scale_color_brewer(palette = "Set1")+theme_minimal()
