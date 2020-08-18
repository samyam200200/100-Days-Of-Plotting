library(mosaicData)
dataset<-CPS85
dataset<-dataset%>%filter(wage<40)
ggplot(dataset, 
       aes(x=exper, 
           y=wage, 
           color=sex))+
  geom_point(alpha=.7, 
           size=3) +
  geom_smooth(method="lm", 
            se=F, 
            size=1.5) +
  scale_x_continuous(breaks = seq(0,60,10))+          
  scale_y_continuous(breaks = seq(0,30,5), label=scales::"dollar") +
  scale_color_manual(values = c("indianred3", "cornflowerblue"))+
  facet_wrap(~sector)+
  labs(title="Relationship between wages and experience", 
     subtitle = "Current Population Survey", 
     caption= "source: http://mosaic-web.org/", 
     x="Years of experience", 
     y="Hourly wage", 
     color="Gender")+
  theme_minimal()

