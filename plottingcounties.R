#Chorpleth map for USA
#USA maps can be created through counties, zipcodes etc.
library(tidyverse)
library(choroplethr)
library(choroplethrMaps)
install.packages("mapproj")
county.fips<-maps::county.fips
data("continental_us_states")
data<-read_tsv("mexican_american.csv")
#preparing data
data$region<-tolower(data$state)
data$value<-data$percent
#continental usa
state_choropleth(data, num_colors = 9, zoom=continental_us_states)+scale_fill_brewer(palette = "YlOrBr")+labs(title = "Mexican American Population",subtitle = "2010 US Census",caption = "source: https://en.wikipedia.org/wiki/List_of_U.S._states_by_Hispanic_and_Latino_popul", fill = "Percent")

#Mapping county
crimes_ct<-data.frame(county=c())
countycnn<-grep(x = county.fips$polyname, pattern = "connecticut")
countycnn<-county.fips[c(countycnn),]
countycnn<-separate(countycnn, col = "polyname",into = c("State", "region"),sep = ",")
#crimerates
countycnn<-cbind(countycnn, data.frame(value=c(3.00, 3.32, 1.02, 1.24, 4.13, 4.61, 0.16, 1.60)))
#value as crimerates, fips codes as region
countycnn<-countycnn%>%select(value, region=fips)

county_choropleth(countycnn, state_zoom = "connecticut", reference_map = F, num_colors = 8)+scale_fill_brewer(palette = "YlOrBr")+labs(title="Connecticut Violent Crime Rates", subtitle = "FBI2012 data", caption="source:https://ucr.fbi.gov", fill="Violent crime\n rate per 1000 ")
