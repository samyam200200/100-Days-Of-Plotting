#data cleaning
library(dplyr)
starwars<-starwars
newdata<-starwars%>%select(name, height, gender)
newdata<-starwars%>%filter(gender=="feminine" & homeworld %in% c("Alderaan", "Coruscant", "Endor"))
newdata <- mutate(height = ifelse(height < 75 | height > 200, NA,height))
newdata <- starwars %>% filter(sex == "female") %>% group_by(species) %>% summarize(mean_ht = mean(height, na.rm = TRUE))

library(ggplot2)
colSums(is.na(msleep))/nrow(msleep)
