#Mosaic plot
#For categorical variables - area represents the proportion of cases for given combination of levels. Color can also be used to denote that #use vcd package
#The size of the tile is proportional to the percentage of cases in that combination of levels. Clearly more passengers perished, than survived.
library(dplyr)
library(ggplot2)
library(vcd)
Titanic<-read.csv('titanic.csv')
#Selects survived, pclass, and sex records frequency
tbl<-xtabs(~Survived+Pclass+Sex, Titanic)
View(tbl)
#flat contingency table
ftable(tbl)
mosaic(tbl, main = "Titanic Data")
#plotting expected (given independence holds)and observed. Dark blue more cases than expected. Dark red less cases than expected
mosaic(tbl,
       shade = TRUE,
       legend = TRUE,
       labeling_args = list(set_varnames = c(Sex = "Gender",
                                             Survived = "Survived",
                                             class="Passenger Class")), 
       set_labels=list(Sur)