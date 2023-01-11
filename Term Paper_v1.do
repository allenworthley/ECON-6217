/******************************
	
	Manning Worthley
	Term Paper Code
	ECON 6217

******************************/
clear
import excel "H:\ECON 6217\Bitcoin Futures Data.xlsx", firstrow

gen time =_n
tset time
/*
dfuller FuturesPriceIndex, lag(1)
dfuller FuturesReturns, lag(1)
dfuller GemniReturns, lag(1)
dfuller Goog_Trend, lag(1) trend

gcause FuturesReturns GemniReturns, lags(1)
gcause GemniReturns FuturesReturns, lags(1)
gcause FuturesReturns CoinDeskReturns, lags(1)
gcause CoinDeskReturns FuturesReturns, lags(1)

local xlist "FuturesReturns GemniReturns CoinDeskReturns"

var `xlist'
vargranger

irf create var1, set(varirf,replace) step(10)
irf graph oirf, impulse(FuturesReturns) response(CoinDeskReturns GemniReturns)

*/

quietly arch FuturesReturns, arch(1) garch(1) vce(robust)
di [ARCH]_b[L.garch]
predict 
*

quietly arch CoinDeskReturns, arch(1) garch(1) vce(robust)
di [ARCH]_b[L.garch]
*

quietly reg GemniReturns
hettest GemniReturns
* Found to be constant variance

