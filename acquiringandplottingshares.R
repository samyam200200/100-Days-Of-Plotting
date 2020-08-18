library(tidyverse)
#reformatting date #adding a smooth line
ggplot(economics, aes(x=date, y=psavert))+geom_line(color="indianred3", size=1)+labs(title="personal savings rate", x="date", y="personal savings rate")+geom_smooth()+scale_x_date(date_breaks = '5 years', labels = scales::date_format("%b-%y"))+theme_minimal()

#comparing prices of shares between apple and facebook
#getting the closing prices using getSymbols
library("quantmod")
apple<-getSymbols("AAPL", return.class="data.frame", from="2018-01-01")
AAPL
apple<-AAPL%>%mutate(Date=as.Date(row.names(.)))%>%select(Date, AAPL.Close)%>%rename(Close=AAPL.Close)%>%mutate(Company="Apple")
#getting clsong prices for FB
facebook<-getSymbols("FB", return.class="data.frame", from="2018-01-01")
facebook<-FB%>%mutate(Date=as.Date(row.names(.)))%>%select(Date, FB.Close)%>%rename(Close=FB.Close)%>%mutate(Company="Facebook")
#combining
mseries<-rbind(apple, facebook)
ggplot(mseries, aes(x=Date, y=Close, color=Company))+geom_line(size=2, alpha=.7)+scale_x_date(date_breaks = "1 month", labels = scales::date_format("%b"))+scale_y_continuous(limits = c(100, 400), breaks=seq(100, 400, 20), labels = scales::dollar)+labs(title = "NASDAQ Closing Prices", subtitle = "Jan - Aug 2018",caption = "source: Yahoo Finance",   y = "Closing Price") +  theme_minimal()+scale_color_brewer(palette = "Dark2")
