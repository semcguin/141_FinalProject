/* 
Sophie McGuinness
Converts student demographic data from wide format to long.
*/

clear
cd /Users/SophieMcG/Dropbox/CCCapacity/K12Const/Raw
insheet using Demographics.csv, names clear

*Free and Reduced Lunch
forvalues y = 1999/2014 {
	preserve
	keep lunch`y' schoolid
	rename lunch`y' ctReduced_lunch
	gen yr = `y'
	tempfile year`y'
	save `year`y''
	restore
}


use  `year1999', clear 
forvalues y = 1999/2014 {
	append using `year`y''
}

drop if missing(schoolid)
drop if regexm(schoolid, "/a")==1
rename schoolid newschoolid
bysort newschoolid yr: gen numduplicates = _N
drop if numdupl > 1
drop numdupl

rename yr yr_op1
save LunchCount, replace
clear

*Hispanic Count
insheet using Demographics.csv, names clear

forvalues y = 1995/2014 {
preserve
	keep hispanic`y' schoolid
	rename hispanic`y' cthispanic
	gen yr = `y'
	tempfile year`y'
	save `year`y''
	restore
}


use  `year1995', clear 
forvalues y = 1995/2014 {
	append using `year`y''
}

drop if missing(schoolid)
drop if regexm(schoolid, "/a")==1
rename schoolid newschoolid
bysort newschoolid yr: gen numduplicates = _N
drop if numdupl > 1
drop numdupl

rename yr yr_op1
save HispCount, replace
clear 

*Black Count
insheet using Demographics.csv, names clear

forvalues y = 1995/2014 {
	preserve
	keep black`y' schoolid
	rename black`y' ctblack
	gen yr = `y'
	tempfile year`y'
	save `year`y''
	restore
}


use  `year1995', clear 
forvalues y = 1995/2014 {
	append using `year`y''
}

drop if missing(schoolid)
drop if regexm(schoolid, "/a")==1
rename schoolid newschoolid
bysort newschoolid yr: gen numduplicates = _N
drop if numdupl > 1
drop numdupl

rename yr yr_op1
save BlkCount, replace
clear 

*White Count
insheet using Demographics.csv, names clear

forvalues y = 1999/2014 {
	preserve
	keep white`y' schoolid
	rename white`y' ctwhite
	gen yr = `y'
	tempfile yearw`y'
	save `yearw`y''
	restore
}


use  `yearw1999', clear 
forvalues y = 1999/2014 {
append using `yearw`y''
}

drop if missing(schoolid)
drop if regexm(schoolid, "/a")==1
rename schoolid newschoolid
bysort newschoolid yr: gen numduplicates = _N
drop if numdupl > 1
drop numdupl

rename yr yr_op1
save WhtCount, replace

*Merges all previous counts into one dta file

merge 1:1 newschoolid yr using BlkCount, gen(merge_blk)
merge 1:1 newschoolid yr using HispCount, gen(merge_hisp)
merge 1:1 newschoolid yr using LunchCount, gen(merge_lunch)
merge 1:1 newschoolid yr_op1 using K12Count, gen(merge_total)

drop merge*
drop if genenrollment == 0

*gen newdistcode = substr(newschoolid, 1, 6)

foreach var of varlist ct* {
	bysort newdistcode yr_op1: egen dist`var' = total(`var')
	replace dist`var' = . if dist`var' == 0
}



save DemogCount, replace
