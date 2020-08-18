#grouped kernel density plot
library(tidyverse)
library(carData)
ggplot(Salaries, aes(x=salary, fill=rank))+geom_density(alpha=0.4)+labs(title = "Salary distribution by rank")
