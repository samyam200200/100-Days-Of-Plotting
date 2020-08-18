library(tidyverse)
#constructing piecharts
#lab.ypors is used for labelling - it places the label exactly at the middle of the barchart (hence subtracted with 0.5*prop)
data<-Marriage%>%count(race)%>%arrange(desc(race))%>%mutate(prop=round(n*100/sum(n),1), lab.ypros=cumsum(prop)-0.5*prop)
data$label<-paste0(data$race, "\n", round(data$prop), "%")
ggplot(data, aes(x="", y=prop, fill=race))+geom_bar(width=1,  stat="identity", color="black")+coord_polar("y", start=0, direction=-1)+theme_void()#removes the angles measures
#labelling the pie chart
ggplot(data, aes(x="", y=prop, fill=race))+geom_bar(width = 1, stat="identity", color="black")+geom_text(aes(y=lab.ypros, label=label), color="black")+coord_polar("y", direction = -1, start=0)+theme_void()+theme(legend.position = "FALSE")+labs(title = "Participants by race")