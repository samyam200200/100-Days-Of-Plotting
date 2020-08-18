library(tidyverse)
#building a tree map
library(treemapify)
Marriage<-mosaicData::Marriage
data<-Marriage%>%count(officialTitle)
ggplot(data, aes(fill=officialTitle, area=n, label=officialTitle))+geom_treemap()+geom_treemap_text(color="white", place="centre")+labs(title = "Marriages by officiate")+theme(legend.position = "none")
