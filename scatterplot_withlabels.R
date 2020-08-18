#scatter plot using various scales in x-axis and y-axis along with smooth line
library(tidyverse)
library(carData)
ggplot(Salaries, aes(x=yrs.since.phd, y=salary))+geom_point(color="steelblue")+scale_x_continuous(breaks = seq(0,60,10), limits = c(0,60))+scale_y_continuous(label =scales::dollar, limits=c(50000, 250000))+geom_smooth(method ="loess", se=F, color="indianred3")+labs(x = "Years Since PhD" , y= "", title = "Experience vs. Salary", subtitle = "9-month salary for 2008-2009") + theme_minimal()
