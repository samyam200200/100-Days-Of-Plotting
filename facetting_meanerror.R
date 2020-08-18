#Facetting
library(tidyverse)
library(carData)
#arranging the facets
ggplot(Salaries, aes(x=salary))+geom_histogram(fill="cornflowerblue", color="white")+facet_wrap(~rank, ncol=1)+labs(title = "Salary histograms by rank")
#two variables defining the facets (facet_grid(row_variables~column_variables))
ggplot(Salaries, aes(x=salary/1000))+geom_histogram(color="white", fill="cornflowerblue")+facet_grid(sex~rank)+labs(title = "Salary histograms by sex and rank",x="salary ($1000)")
#facetting combined with mean and standard error
data<-Salaries%>%group_by(sex, rank, discipline)%>%summarize(n=n(), mean=mean(salary),sd=sd(salary), se=sd/sqrt(n))
data$discipline<-factor(data$discipline, labels = c("Theoritical" , "Applied"))
ggplot(data, aes(x=sex, y=mean, color=sex))+geom_point(size=3)+geom_errorbar(aes(ymin=mean-se, ymax=mean+se), width=.3)+scale_y_continuous(breaks=seq(70000, 140000, 10000), label=scales::dollar)+facet_grid(.~rank+discipline)+theme_bw()+theme(legend.position = "none", panel.grid.major.x = element_blank(),   panel.grid.minor.y = element_blank())+scale_color_brewer(palette="Set1")
