#Maps
library(ggmap)
library(tidyverse)
rapes<-filter(crime, offense=="rape")%>%select(date, offense, address, lon, lat)
head(rapes)
#registered google map api
register_google(key="AIzaSyAV7-iXaIuChaPO4VzVVI9yi_GxwBZEUKs", write=T)
#using geocode to find the location
houston_center<-geocode("Houston, TX")
#getting the map 
#zoom - 3=continent and 21=Building, 10=city
#map type - terrain, terrain-background, satellite, roadmap, hybrid, watercolor, and toner
houston_map<-get_map(houston_center, zoom=13, maptype="roadmap")
#plotting the map
ggmap(houston_map)
#plotting the map with the relevent x and y coordinates
ggmap(houston_map, base_layer=ggplot(data=rapes, aes(x=lon, y=lat)))+geom_point(color="red", size=3, alpha=0.5)
# cleaning plot
ggmap(houston_map, base_layer = ggplot(aes(x=lon, y=lat), data=rapes))+geom_point(color="red", size=3, alpha=0.5)+theme_void()+labs(title = "Location of reported rapes", subtitle = "Houston Jan - Aug 2010",caption = "source: http://www.houstontx.gov/police/cs/")
