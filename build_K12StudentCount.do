/* 
Sophie McGuinness
Converts student count data from wide format to long.
*/

insheet using/Users/SophieMcG/Dropbox/CCCapacity/K12Const/Raw/ELSI_csv_export_new.csv, names clear

forvalues y = 1994/2013 {
	preserve
	keep enr`y' schoolid
	rename enr`y' genenrollment
	gen yr = `y'
	tempfile year`y'
	save `year`y''
	restore
}


use  `year1994', clear 
forvalues y = 1994/2013 {
	append using `year`y''
}

replace schoolid = substr(schoolid, 2, .)
drop if missing(schoolid)
drop if regexm(schoolid, "/a")==1
rename schoolid newschoolid

gen newdistcode = substr(newschoolid, 1, 6)
	bysort newdistcode yr: egen distkids = total(genenrollment)
	bysort newschoolid yr: gen numduplicates = _N
drop if numdupl > 1

rename yr yr_op1

save K12Count, replace
