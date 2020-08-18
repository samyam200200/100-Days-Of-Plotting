library(tidyverse)
library(sf)
library(leaflet)
library(viridis)

neighborhoods <- read_sf("shp_file.shp")
hud_grants <- read_csv("Housing_and_Urban_Development__HUD__Grants.csv") %>% 
  st_as_sf(coords = c("Longitude", "Latitude"), 
           crs = 4326, agr = "field")

capwords <- function(s) {
  cap <- function(s) paste(toupper(substring(s, 1, 1)),
                           {tolower(substring(s, 2))},
                           sep = "", collapse = " ")
  sapply(strsplit(s, split = " "), cap, USE.NAMES = !is.null(names(s)))
}

neighborhoods_clean <- neighborhoods %>% 
  st_transform(4326) %>% 
  mutate(neighborhood_label = paste0('<b>Neighborhood:</b> ', 
                                     capwords(gnocdc_lab)))

hud_grants_clean <- hud_grants %>% 
  rename(OCD_Program = `OCD Program`) %>% 
  filter(OCD_Program != "None") %>% 
  mutate(popup_label = paste(paste0('<b>Partner: ', Partnership, '</b>'),
                             paste0('Address: ', Address), 
                             sep = '<br/>'))

leaflet() %>% 
  addTiles()

leaflet() %>% 
  addTiles() %>% 
  addPolygons(data = neighborhoods_clean,
              color = 'white',
              weight = 1.5,
              opacity = 1,
              fillColor = 'black',
              fillOpacity = .8,
              highlightOptions = highlightOptions(color = "#FFF1BE", 
                                                  weight = 5),
              popup = ~neighborhood_label)


pal <- colorFactor(
  palette = viridis_pal(begin = .4, end = .95, option = 'A')(3),
  domain = hud_grants_clean$OCD_Program
)

leaflet() %>% 
  addTiles() %>% 
  addPolygons(data = neighborhoods_clean,
              color = 'white',
              weight = 1.5,
              opacity = 1,
              fillColor = 'black',
              fillOpacity = .8,
              highlightOptions = highlightOptions(color = "#FFF1BE", 
                                                  weight = 5),
              popup = ~neighborhood_label) %>% 
      addCircleMarkers(data = hud_grants_clean,
                   popup = ~popup_label,
                   stroke = F,
                  radius=4,
                   fillColor = ~pal(OCD_Program),
                   fillOpacity = 1)
leaflet() %>% 
  addTiles() %>% 
  addPolygons(data = neighborhoods_clean,
              color = 'white',
              weight = 1.5,
              opacity = 1,
              fillColor = 'black',
              fillOpacity = .8,
              highlightOptions = highlightOptions(color = "#FFF1BE", 
                                                  weight = 5),
              popup = ~neighborhood_label) %>% 
  addCircleMarkers(data = hud_grants_clean,
                   popup = ~popup_label,
                   stroke = F,
                   radius = 4,
                   fillColor = ~pal(OCD_Program),
                   fillOpacity = 1) %>% 
  addLegend(data = hud_grants_clean,
            pal = pal,
            values =~OCD_Program,
            title = "HUD Grant Program")
