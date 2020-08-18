#Choropleth maps - use color or shading to define the average values in area #use choroplethr package
data("df_pop_country")
library(choroplethr)
library(choroplethrMaps)
data<-data("gapminder", package="gapminder")
data<-gapminder%>%filter(year==2007)%>%rename(region=country, value=lifeExp)%>%mutate(region=tolower(region))%>%mutate(region=recode(region, "united states" = "united states of america","congo, dem. rep." = "democratic republic of the congo","congo, rep." = "republic of congo",   "korea, dem. rep." = "south korea", "korea. rep." = "north korea", "tanzania" = "united republic of tanzania", "serbia" = "republic of serbia",  "slovak republic" = "slovakia","yemen, rep." = "yemen"))
country_choropleth(data)
country_choropleth(data, num_colors = 9)+scale_fill_brewer(palette="YlOrRd")+labs(title = "Life expectancy by country",subtitle = "Gapminder 2007 data",caption = "source: https://www.gapminder.org",      fill = "Years")
#choroplethr for US
