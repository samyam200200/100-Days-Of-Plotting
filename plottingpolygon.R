dataset<-dataset
ggplot(dataset, 
       aes(x=exper, y=wage)) +
  geom_point(alpha=.7,
             size=3, aes(color=sex)) +
  geom_smooth(method = "lm",
              formula = y ~ poly(x,2),
              se=F,
              size=1.5)+
  theme_bw()
