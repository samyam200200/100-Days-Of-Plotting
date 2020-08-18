#violin plot - are rotated and mirrored kernel density plot
library(tidyverse)
library(carData)
ggplot(Salaries, aes(x=rank, y=salary, fill=rank))+geom_violin()+labs(title = "Salary distribution by rank")+theme_minimal()
#superimposing violin plot and boxplot
ggplot(Salaries, aes(x=rank, y=salary))+geom_violin(fill="cornflowerblue")+geom_boxplot(width=.2, fill="orange", outlier.colour = "red", outlier.size = 2)+labs(title = "Salary distribution by rank")+theme_minimal()
