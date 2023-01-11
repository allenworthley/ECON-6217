/******************************
	
	Manning Worthley
	Term Paper Code
	ECON 6217

******************************/
clear
import excel "D:\School\ECON 6217\Bitcoin Futures Data.xlsx", firstrow

gen time =_n
tset time

dfuller FuturesPrice, lag(1)
dfuller FuturesReturns, lag(1)
dfuller GemniReturns, lag(1)

gcause FuturesReturns GemniReturns, lags(1)
gcause GemniReturns FuturesReturns, lags(1)
gcause FuturesReturns CoinDeskReturns, lags(1)
gcause CoinDeskReturns FuturesReturns, lags(1)

/*
local xlist "FuturesReturns GemniReturns"
var `xlist'
vargranger

local x1list "FuturesReturns CoinDeskReturns"
var `x1list'
vargranger
*/

quietly arch FuturesReturns, arch(1) garch(1) vce(robust)
di [ARCH]_b[L.garch]
predict f_var, variance
*
gen f_futures = FuturesReturns / f_var^(1/2)

quietly arch CoinDeskReturns, arch(1) garch(1) vce(robust)
di [ARCH]_b[L.garch]
predict cd_var, variance
gen f_coindesk = CoinDeskReturns / cd_var^(1/2)

quietly arch GemniReturns, arch(1) garch(1) vce(robust)
di [ARCH]_b[L.garch]
predict gem_var, variance
gen f_gemni = GemniReturns / gem_var^(1/2)

gcause f_futures f_coindesk, lags(1)
gcause f_coindesk f_futures, lags(1)
gcause f_futures f_gemni, lags(3)
gcause f_gemni f_futures, lags(3)

/*


local x2list "f_futures GemniReturns"
var `x2list'
vargranger

local x3list "f_futures f_coindesk"
var `x3list'
vargranger

/*irf create var1, set(varirf,replace) step(10)
irf graph oirf, impulse(FuturesReturns) response(CoinDeskReturns GemniReturns)





