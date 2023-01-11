/******************************
	
	Manning Worthley
	Term Paper Code
	ECON 6217

******************************/

clear
log using "D:\School\ECON 6217\TermPaper.log", replace

import excel "D:\School\ECON 6217\Bitcoin Futures Data.xlsx", firstrow

gen time =_n
tset time
	*Differenced data calculated in excel
	*First row of data is blank
drop if time==1

*Summary Statistics
corr FuturesReturns BitstampReturns GemniReturns 
sum FuturesReturns BitstampReturns GemniReturns

*Level Stationarity Tests
	* None are stationary
dfuller FuturesPrice, lag(1)
dfuller Bitstamp, lag(1)
dfuller Gemni, lag(1)

*Return Stationarity Tests
	* All are stationary
dfuller FuturesReturns, lag(1)
dfuller BitstampReturns, lag(1)
dfuller GemniReturns, lag(1)


*Granger Causality Tests
gcause FuturesReturns GemniReturns, lags(1)
gcause GemniReturns FuturesReturns, lags(1)

gcause FuturesReturns BitstampReturns, lags(1)
gcause BitstampReturns FuturesReturns, lags(1)


*Var Models
	*AIC criteria used to choose lag order for VAR model
local xlist "FuturesReturns GemniReturns"
quietly var `xlist'
varsoc
var `xlist', lags(1/2)
vargranger

var `xlist', lags(1)
vargranger


local x1list "FuturesReturns BitstampReturns"
quietly var `x1list'
varsoc
var `x1list', lags(1)
vargranger



log close
