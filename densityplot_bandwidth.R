#density plot
#finding bandwidth
bw.nrd0(Marriage$age)
library(tidyverse)
ggplot(Marriage, aes(x=age))+geom_density(size=2, fill="indianred3", bw=1)+labs(title="Participants by age", subtitle = "bandwidth=1")
