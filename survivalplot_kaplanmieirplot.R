#Survival plot, kaplan-meier plot
#time to death, time to recovery, or time to relapse
library(survival)
library(survminer)
library(ggplot2)
library(dplyr)

#lung cancer survival (status 1 - censored, 2=dead)
data(lung)
sfit<-survfit(Surv(time, status) ~ 1, data=lung)
View(summary(sfit))

ggsurvplot(sfit, title='Kaplan-Meier Curve For Lung Cancer Survival')

# survival curve comparing men and women
sfit<-survfit(Surv(time, status)~sex, data=lung)
ggsurvplot(sfit,
           conf.int = T, 
           pval=T,
           legend.labs=c("Male", "Female"),
           legend.title="Sex",
           palette = c("cornflowerblue", "indianred3"),
           title='Kaplan-Meier Curve for lung cancer survival',
           xlab='Time (days')
