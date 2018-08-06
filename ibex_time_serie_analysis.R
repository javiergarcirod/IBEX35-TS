library(tseries)
library(fpp)
ibex <- get.hist.quote(instrument = "^ibex", 
                       start = '2017-01-01', end = Sys.Date()-1)

dat<-ibex$Close
dat_train<-dat[1:round((0.95*length(dat)))]
dat_test<-dat[round((0.95*length(dat))):length(dat)]
fit1<-auto.arima(dat_train)
fit2<-ets(dat_train)
pred1<-summary(forecast(fit1,length(dat_test)))
pred2<-summary(forecast(fit2,length(dat_test)))
mean(abs(as.vector(dat_test)-pred1$`Point Forecast`)/dat_test)
mean(abs(as.vector(dat_test)-pred2$`Point Forecast`)/dat_test)


