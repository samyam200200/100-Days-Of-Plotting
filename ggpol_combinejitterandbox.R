#combining jitter and boxplot with ggpol
library(ggpol)
library(tidyverse)
library(carData)
data<-Salaries%>%group_by(rank)%>%summarize(median=median(salary))
ggplot(Salaries, aes(x=factor(rank, labels=c("Assistant\nProfessor", "Associate\nProfessor", "Professor")), y=salary, fill=rank))+geom_boxjitter(color="black", jitter.color = "darkgrey", errorbar.draw = T)+scale_y_continuous(label=scales::dollar)+labs(x="", y="")+theme_minimal()+theme(legend.position = "none")+coord_flip()
