#ridgeline plots - similar to density plot with vertical faceting
library(tidyverse)
library(ggridges)
ggplot(mpg, aes(x=cty, y=class, fill=class))+geom_density_ridges(alpha=0.7)+theme_ridges()+labs("Highway mileage by auto class") +theme(legend.position = "none")
