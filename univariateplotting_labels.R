library(mosaicData)
dataset<-Marriage
#simple barlot
ggplot(dataset, aes(x=race))+geom_bar()+geom_bar(fill="cornflowerblue", color="black")+labs(x="Race", y="Frequency", title="Participatns by race")
#showing barplot with percentage
ggplot(dataset, aes(x=race, y=..count../sum(..count..)))+geom_bar()+geom_bar(fill="cornflowerblue", color="black")+labs(x="Race", y="Frequency", title="Participatns by race")+scale_y_continuous(labels=scales::percent)
#reordering the bars #use -n for reordering in descending
data<-dataset%>%count(race)
ggplot(data, aes(x=reorder(race, n), y=n))+geom_bar(stat = "identity")+labs(x="Race", y="Frequency", title="Participatns by race")
#labelling bars
ggplot(data, aes(x=reorder(race, n), y=n))+geom_bar(stat = "identity")+geom_text(aes(label=n), vjust=-1)+labs(x="Race", y="Frequency", title="Participatns by race")
#showing percenteges instead of count in geom_text
#paste0 does not put a space between the pasted variables
library(tidyverse)
plotdata<-Marriage%>%count(race)%>%mutate(pct=n/sum(n), pctlabel=paste0(round(pct*100), "%"))
ggplot(plotdata, aes(reorder(race, -pct), y=pct))+geom_bar(stat="identity", fill="indianred3", color="black")+geom_text(aes(label=pctlabel), vjust=-0.25)+scale_y_continuous(labels = scales::percent)+labs(x="race", y="percent", title="participants by race")