# ideally they are supposed to be following a GBM, that black scholes shit I am always talking about
#u = drift
# sigma = volatility 
#W_t = standarfd brownian motion

#if you solve the differential equation using ito calculus
#you get something similar to the normal distdribution but
#the constant multiplied to e is the stock_price at time 0
#so the exponent has a brownian part which means its normally distributed
#beacause of the exponent, it means if we find ln(S_t) and ln of the other side
#we realize that the percentage change in price is the one that's normally distributed


#to import relevant libraries
#install.packages(c("curl","TTR","quantmod"))
library(quantmod)


#to get/download stock prices example apple
getSymbols("AAPL", from = "2023-01-01", to  = "2023-12-31")

#for closing prices alone
prices <- Cl(AAPL)

#to make sure we have the set
head(prices)


#to get the logs of the prices
log_prices <- log(prices)

#to get the histogram of the prices
hist(log_prices,
     breaks = 100,
     probavility = T,
     main = "Histogram of logarithms of stock prices for APPLE",
     xlab = "log of prices")

#to add a normal density curve on top of the histogram
curve(dnorm(x, mean = mean(log_prices), sd = sd(log_prices)),
      add = T,
      col = "red",
      lwd = "2")

#to check for normality
shapiro.test(as.numeric(log_prices))
#If log_prices are approximately normal
#(bell-shaped histogram, p-value not too tiny in Shapiro test), 
#then stock prices follow a lognormal distribution.

