#mean and standard error of mean plot
library(tidyverse)
library(carData)
data<-Salaries%>%group_by(rank)%>%summarise(n=n(), mean=mean(salary), sd=sd(salary), se=sd/sqrt(n), ci=qt(0.975, df=n-1)*sd/sqrt(n))
#showing the error using standard error
ggplot(data, aes(x=rank, y=mean, group=1))+geom_point(size=3)+geom_line()+geom_errorbar(aes(ymin=mean-se, ymax=mean+se), width=.1)
#grouping by sex
data<-Salaries%>%group_by(rank, sex)%>%summarise(n=n(), mean=mean(salary), sd=sd(salary), se=sd/sqrt(n), ci=qt(0.975, df=n-1)*sd/sqrt(n))
ggplot(data, aes(x=rank, y=mean, group=sex, color=sex))+geom_point(size=3)+geom_line(size=1.5)+geom_errorbar(aes(ymin=mean-se, ymax=mean+se), width=.1)
#overlapping so we dodge
pd<-position_dodge(0.2)
ggplot(data, aes(x=rank, y=mean, group=sex, color=sex))+geom_point(size=3, position = pd)+geom_line(size=1.5, position = pd)+geom_errorbar(aes(ymin=mean-se, ymax=mean+se), width=.1, position = pd)
#adding labels, beautifying
ggplot(data, aes(x=factor(rank, labels = c("Assistant\nProfessor", "Associate\nProfessor", "Full\nProfessor")), y=mean, group=sex, color=sex))+geom_point(size=3, position = pd)+geom_line(size=1.5, position = pd)+geom_errorbar(aes(ymin=mean-se, ymax=mean+se), width=.1, position = pd)+scale_y_continuous(breaks = seq(0, 130000, 20000), labels = scales::dollar)+scale_color_brewer(palette="Set1")+theme_minimal()+labs(title = "Mean salary by rank and sex", subtitle = "(mean +/- standard error)", x = "", y="", color="gender")
