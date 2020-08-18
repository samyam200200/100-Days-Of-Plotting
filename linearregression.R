library(mosaicData)
library(ggplot2)
library(dplyr)
library(visreg)
data<-SaratogaHouses
houses_lm<-lm(price~lotSize+age+landValue+
                livingArea+bedrooms+bathrooms+
                waterfront, data = data)
summary(houses_lm)
visreg(houses_lm, "livingArea", gg=T)
#The graph suggests that, after controlling for lot size, age, living area, number of bedrooms and bathrooms,and waterfront location, sales price increases with living area in a linear fashion.
visreg(houses_lm, "waterfront", gg=T)+
  scale_y_continuous(label=scales::dollar)+
  labs(title="Relationship between proce and location",
    subtitle = 'controlling for all',
    caption = 'Source; Saratoga Housing Data(2006)',
    y='Home price',
    x='waterfront')