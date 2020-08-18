library(tidyverse)
data<-Marriage
#drawwing a flipped barchart
ggplot(Marriage, aes(x=officialTitle))+geom_bar()+labs(x="officiate", y="frequency", title = "marriage by officiate")+coord_flip()
#roatting the axis label
ggplot(Marriage, aes(x=officialTitle))+geom_bar()+labs(x="officiate", y="frequency", title = "marriage by officiate")+theme(axis.text.x = element_text(angle=45, hjust=1))
#staggered labels #this code alternatively places a "" and a new line ("\n") between the labels
lbls <- paste0(c("", "\n"), levels(Marriage$officialTitle))
ggplot(data, aes(x=factor(officialTitle, labels = lbls)))+geom_bar()+labs(x="officiate", y="frequency", title = "marriage by officiate")
