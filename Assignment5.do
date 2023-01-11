
/************************
	Manning Worthley
	Assignment 5
	Econ 6217
************************/
clear



use "D:\School\ECON 6217\kiel.dta"

* Problem 1

reg price y81 nearinc y81nearinc

*Problem 2

*Nearest Neighbor
psmatch2 nearinc age agesq area baths rooms land if y81==1, outcome(price) ate
pstest age agesq area baths rooms land, t(nearinc)
psgraph 

	*Nearest 5
psmatch2 nearinc age agesq area baths rooms land if y81==1, outcome(price) n(5) ate
pstest age agesq area baths rooms land, t(nearinc)
psgraph

	*Nearest 10
psmatch2 nearinc age agesq area baths rooms land if y81==1, outcome(price) n(10) ate
pstest age agesq area baths rooms land, t(nearinc)
psgraph


	*Caliber radius .1
psmatch2 nearinc age agesq area baths rooms land if y81==1, outcome(price) radius caliper(.1) ate
pstest age agesq area baths rooms land, t(nearinc)
psgraph


	*Caliber radius .2
psmatch2 nearinc age agesq area baths rooms land if y81==1, outcome(price) radius caliper(.2) ate
pstest age agesq area baths rooms land, t(nearinc)
psgraph

	*Caliber radius .5
psmatch2 nearinc age agesq area baths rooms land if y81==1, outcome(price) radius caliper(.5) ate
pstest age agesq area baths rooms land, t(nearinc)
psgraph
