#creating box plot #with notches
library(tidyverse)
library(carData)
ggplot(Salaries, aes(x=rank, y=salary))+geom_boxplot(notch=T, fill="cornflowerblue", alpha=.7)+labs(title="Salary distribution by rank")
