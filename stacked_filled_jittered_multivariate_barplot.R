#Multivariate
#Stacked barchart
library(tidyverse)
ggplot(mpg, aes(x=class, fill=drv))+geom_bar(position = "stack")
#grouped bar plot
ggplot(mpg, aes(x=class, fill=drv))+geom_bar(position = "dodge")
#for not making other bars wider
ggplot(mpg, aes(x=class, fill=drv))+geom_bar(position = position_dodge(preserve = "single"))
#segmented bar plot
ggplot(mpg,aes(x = class,fill = drv)) +geom_bar(position = "fill") +labs(y = "Proportion")
#factors can be used to modify the order of the bars (in albhabetical order), scale_fill_brewer changes the fill color scheme, the factor can also be used to change labels (see y-axis)
ggplot(mpg, aes(x=factor(class, levels=c("2seater", "subcompact", "compact", "midsize", "minivan", "suv", "pickup")), fill=factor(drv, levels = c("f", "r", "4"), labels=c("front-wheel", "rear-wheel", "4-wheel"))))+geom_bar(position = "fill")+scale_y_continuous(breaks = seq(0,1,.2), label=scales::percent)+scale_fill_brewer(palette = "Set2")+labs(y="percent", fill="drive train", x="Class", title = "Automobile drive by class")+theme_minimal()
# adding percent label to each segment
data<-mpg%>%group_by(class, drv)%>%summarise(n=n())%>%mutate(pct=n/sum(n), lbl=scales::percent(pct))
#using geom_text to addpercent labels
ggplot(data, aes(x=factor(class, levels=c("2seater", "subcompact", "compact", "midsize", "minivan", "suv", "pickup")), y=pct, fill=factor(drv, levels = c("f", "r", "4"), labels=c("front-wheel", "rear-wheel", "4-wheel"))))+geom_bar(stat="identity",position = "fill")+scale_y_continuous(breaks = seq(0,1,.2), label=scales::percent)+scale_fill_brewer(palette = "Set2")+labs(y="percent", fill="drive train", x="Class", title = "Automobile drive by class")+theme_minimal()+geom_text(aes(label=lbl), size=5, position = position_stack(vjust = 0.5))
