# Portfolio Script
# Get quantmod
if (!require("quantmod")) {
install.packages("quantmod")
library(quantmod)
}
library(PortfolioAnalytics)
library(PerformanceAnalytics)
library(zoo)
library(plotly)

# Start date of portfolio
start <- as.Date("2017-01-01")
end <- Sys.Date()
src <- "yahoo"

# We load a csv with our vanguard portfolio
vanguard <- read.csv("~/development/rstocks/ofxdownload.csv")

# We use the quantmod function getSymbols
# The default behavior for getSymbols is to load data directly into the
# global environment, with the object being named after the loaded ticker
# symbol. This feature may become deprecated in the future, but we exploit
# it now.
getSymbols(as.character(vanguard$Symbol), src = src, from = start, to = end)
#candleChart(AAPL, up.col = "black", dn.col = "red", theme = "white")
candleChart(AAPL, up.col = "black", dn.col = "red", theme = "white", subset = "2016-01-04/")
addSMA(n = c(20, 50, 200))

# merge into a data frame with columns as stocks and closing prices by date
# had to remove BRK-B and RDS-A as failing...need to fix this
closing_prices <- as.data.frame(merge.zoo(AAPL[,6],ADNT[,6],AMZN[,6],BLV[,6],BMY[,6],CDK[,6],COST[,6],DHR[,6],IBM[,6],JNJ[,6],MRK[,6],T[,6],TSLA[,6],UN[,6]))


# Get me my beloved pipe operator!
if (!require("magrittr")) {
  install.packages("magrittr")
  library(magrittr)
}
#stock_return = apply(closing_prices, 1, function(x) {x / closing_prices[1,]}) %>% 
#  t %>% as.xts

#head(stock_return)

