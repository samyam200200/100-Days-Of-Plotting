library(tidyverse)
#making a histogram
ggplot(Marriage, aes(x=age))+geom_histogram(fill="cornflowerblue", col="white")+labs(title="Participants by age", x="Age")
#changing bins
ggplot(Marriage, aes(x=age))+geom_histogram(fill="cornflowerblue", col="white", bins = 20)+labs(title="Participants by age",subtitle = "number of bins = 20" ,x="Age")
#showing binwidth of the bar
ggplot(Marriage, aes(x=age))+geom_histogram(fill="cornflowerblue", col="white", binwidth = 5)+labs(title="Participants by age",subtitle = "number of binwidth = 5years" ,x="Age")
#plotting with percentage on y-axis
ggplot(Marriage, aes(x=age, y=..count../sum(..count..)))+geom_histogram(fill="cornflowerblue", color="white", binwidth = 5)+labs(title = "Participants by age",y="Percent", x="Age")+scale_y_continuous(labels = scales::percent)
