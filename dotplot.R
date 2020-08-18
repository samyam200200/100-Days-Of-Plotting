#dotchart
library(tidyverse)
ggplot(Marriage, aes(x=age))+geom_dotplot(fill="gold", color="black")+labs(title = "Participants by age", y="Proportion", x="Age")