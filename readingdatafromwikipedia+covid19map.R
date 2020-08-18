library(rvest)
url<-"https://en.wikipedia.org/wiki/Template:COVID-19_pandemic_data/California_medical_cases_by_county"
temp <- url %>% html %>%  html_nodes("table")
list<-html_table(temp[1], fill = T)
b<-as.data.frame(list)
b<-b[c(-1,-60, -61),]
b$Cases.a.<-str_replace(b$Cases.a., pattern = ",", replacement = "")
b$value<-as.numeric(b$Cases.a.)
countycali<-grep(x = county.fips$polyname, pattern = "california")
countycali<-county.fips[c(countycali),]
countycali<-separate(countycali, col = "polyname",into = c("State", "County"),sep = ",")
b$County<-tolower(b$County)
c<-inner_join(b, countycali, "County")
c<-c%>%select(value, region=fips)
c<-rbind(c, data.frame(value=5493, region=6001))
png("COVID-california.png", width = 600, height = 600)
county_choropleth(c, state_zoom = "california", reference_map = F, num_colors = 9)+scale_fill_brewer(palette = "YlOrBr")+labs(title="California Countywise COVID Cases", subtitle = "30th June", caption="https://en.wikipedia.org/wiki/Template:COVID-19_pandemic_data/California_medical_cases_by_county", fill="Number of cases")
dev.off()
