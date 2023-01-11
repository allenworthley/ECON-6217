/********************

	Manning Worthley
	ECON 6217
	Assignment 6

*********************/

clear
use "D:\School\ECON 6217\cps88.dta", replace
gen ln_wage= log(rwage)

*gen region= neast+midwest+south+west
*sum region **all ones
*Need to omit a variable;... everything relative to the south

*Problem 1
reg ln_wage edu exper smsa parttime neast midwest west 

*Problem 2
	*0.05 quantile model
sqreg ln_wage edu exper smsa parttime neast midwest west, q(.05)
	*0.05 quantile model
sqreg ln_wage edu exper smsa parttime neast midwest west, q(.5)
	*0.95 quantile model
sqreg ln_wage edu exper smsa parttime neast midwest west, q(.95)

*Problem 3
sqreg ln_wage edu exper smsa parttime neast midwest west
outreg2



/*

grqreq

