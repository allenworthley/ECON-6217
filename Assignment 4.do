/********************

	Manning Worthley
	Econ 6217 
	Assignment 4

*********************/

*Get Data

use "D:\School\ECON 6217\laguna-replicate.dta", replace
*log using "D:\School\ECON 6217\Assignment4.log", replace
drop time
*Generate time variable & dummy variable for pre_post
gen time = ym(year,month)

gen pre_post = time 
replace pre_post = 1 if time >= 536
replace pre_post = 0 if time < 536

gen tcrime = burglary_res_percap+burglary_nonres_percap+ robbery_res_percap +robbery_nonres_percap +rape_percap +autotheft_percap +larceny_percap
gen laguna_post = pre_post*lagunabeach

*Setup panel data
xtset lagunabeach time

*Problem 4

local varlist1 tcrime pre_post lagunabeach laguna_post officers_percap
 
xtreg `varlist1'



*log close
