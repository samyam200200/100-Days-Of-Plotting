#Combining barplot with mutate
library(tidyverse)
library(carData)
data<-Salaries
data<-data%>%group_by(rank)%>%summarize(mean_salary=mean(salary))
ggplot(data, aes(x=rank, y=mean_salary))+geom_bar(stat="identity")
#adding the salary labels
ggplot(data, aes(x=factor(rank, labels=c("Assistant\nProfessor", "Associate\nProfessor", "Full\nProfessor")), y=mean_salary))+geom_bar(stat="identity", fill="cornflowerblue")+geom_text(aes(label=scales::dollar(mean_salary)), vjust=-0.50)+scale_y_continuous(breaks = seq(0, 130000, 20000), labels = scales::dollar)+labs(title = "Mean salary by rank", subtitle = "9 month academic salary", x="", y="")
