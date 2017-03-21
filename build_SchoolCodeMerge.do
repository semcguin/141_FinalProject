/*
Sophie McGuinness
Cleans crosswalk data for merging school IDs into construction data 
*/

clear
cd /Users/SophieMcG/Dropbox/CCCapacity/K12Const/Raw
insheet using SchoolCodes.csv, names clear

*Drops duplicates and makes formatting consistent

	duplicates tag projectname, generate(DupTag)
	duplicates tag schoolid, generate(DupTag1)
	sort DupTag
	format schoolid %11.0f
	tostring schoolid, replace format(%11.0f)
	
	rename newdistcode1 newdistcode
	bysort newdistcode projectname: gen numduplicates = _N
	drop if numdup > 1
	rename projectname cleanschool
	save SchoolCodes, replace

*Takes out modifiers

use SchoolCodes
save SchoolCodesOne, replace
	gen shortschool = cleanschool
	replace shortschool = subinstr(shortschool, "JR. ", "JUNIOR ", .)
	replace shortschool = subinstr(shortschool, "SR. ", "SENIOR ", .)
	replace shortschool = subinstr(shortschool, "ED.", "EDUCATION", .)
	replace shortschool = subinstr(shortschool, "JT. ", "JOINT ", .)
	replace shortschool = subinstr(shortschool, "UN. ", "UNION ", .)
	replace shortschool = subinstr(shortschool, "ALTER.", "ALTERNATIVE", .)
	replace shortschool = subinstr(shortschool, "BLVD.", "BOULEVARD", .)
	replace shortschool = subinstr(shortschool, "PREP ", "PREPARATORY ", .)
	replace shortschool = subinstr(shortschool, "PREP.", "PREPARATORY", .)
	replace shortschool = subinstr(shortschool, "ACAD ", "ACADEMY ", .)
	replace shortschool = subinstr(shortschool, "AVE.", "AVENUE", .)
	replace shortschool = subinstr(shortschool, "AVE ", "AVENUE ", .)
	replace shortschool = subinstr(shortschool, "ST. ", " SAINT", .)
	replace shortschool = subinstr(shortschool, " ST.", " STREET", .)
	replace shortschool = subinstr(shortschool, "L.A.", "LOS ANGELES", .)
	replace shortschool = subinstr(shortschool, "L. A.", "LOS ANGELES ", .)
	replace shortschool = subinstr(shortschool, "_", "", .)
	replace shortschool = subinstr(shortschool, "SCHOOL", "", .)
	replace shortschool = subinstr(shortschool, "  ", " ", .)
	replace shortschool = strtrim(shortschool)
	bysort newdistcode shortschool: gen numduplicates1 = _N
	drop if numduplicates1 >1
	*format schoolid %11.0f
	*tostring schoolid, replace format(%11.0f)
save SchoolCodesOne.dta, replace

*Takes out more modifiers and shortens school name

use SchoolCodesOne
	save SchoolCodesTwo, replace
	gen shortschool2 = shortschool
	replace shortschool2 = subinstr(shortschool2, "CITY", "", .)
	replace shortschool2 = subinstr(shortschool2, "SENIOR ", "", .)
	replace shortschool2 = subinstr(shortschool2, "UNION", "", .)
	replace shortschool2 = subinstr(shortschool2, "JOINT", "", .)
	replace shortschool2 = subinstr(shortschool2, "UNIFIED", "", .)
	gen ppos1 = strpos(shortschool2, "(")
	gen ppos2 = strrpos(shortschool2, ")")
	replace shortschool2 = subinstr(shortschool2, substr(shortschool2, ppos1, ppos2 - ppos1+1), "", .)
	replace shortschool2 = subinstr(shortschool2, substr(shortschool2, ppos1, length(shortschool2) - ppos1+1), "", .) if ppos2 == 0  & ppos1 != 0
	replace shortschool2 = subinstr(shortschool2, substr(shortschool2, ppos1, length(shortschool2)), "", .) if ppos2 == length(shortschool2)  & ppos1 != 0
	gen ppos3 = strpos(shortschool2, "(")
	replace shortschool2 = subinstr(shortschool2, substr(shortschool2, ppos3, length(shortschool2)), "", .)
	replace shortschool2 = subinstr(shortschool2, "  ", " ", .)
	replace shortschool2 = strtrim(shortschool2)
	bysort newdistcode shortschool2: gen numduplicates2 = _N
	replace shortschool2 = shortschool if numduplicates2 > 1
save SchoolCodesTwo.dta, replace

*Takes out more modifiers, atttempts to identify names (e.g.Thomas P. Ryan)

use SchoolCodesTwo
save SchoolCodesThree, replace
	gen shortschool3 = shortschool2
	replace shortschool3 = subinstr(shortschool3, "ELEMENTARY", "", .)
	replace shortschool3 = subinstr(shortschool3, "BOULEVARD", "", .)
	replace shortschool3 = subinstr(shortschool3, "CHARTER", "", .)
	replace shortschool3 = subinstr(shortschool3, "PRE", "", .) if length(shortschool3) == strpos(shortschool3, " PRE")+3
	replace shortschool3 = subinstr(shortschool3, "PRE ", " ", .)
	replace shortschool3 = subinstr(shortschool3, " EEC", "", .) if length(shortschool3) == strpos(shortschool3, " EEC")+3
	replace shortschool3 = subinstr(shortschool3, "DISTRICT", "", .)
	replace shortschool3 = subinstr(shortschool3, "NEW", "", .) if length(shortschool3) == strpos(shortschool3, " NEW")+3
	replace shortschool3 = subinstr(shortschool3, "PRIMARY", "", .)
	replace shortschool3 = subinstr(shortschool3, "ALTERNATIVE", "", .)
	replace shortschool3 = subinstr(shortschool3, "NEW ", " ", .)
	replace shortschool3 = subinstr(shortschool3, "K-12", "", .)
	replace shortschool3 = subinstr(shortschool3, "K-8", "", .)
	replace shortschool3 = subinstr(shortschool3, "K-6", "", .)
	replace shortschool3 = subinstr(shortschool3, "6-8", "", .)
	replace shortschool3 = subinstr(shortschool3, "COMMUNITY", "", .)
	replace shortschool3 = subinstr(shortschool3, "DAY", "", .)
	replace shortschool3 = subinstr(shortschool3, "INTERMEDIATE", "", .)
	replace shortschool3 = subinstr(shortschool3, "SATELLITE", "", .)
	replace shortschool3 = subinstr(shortschool3, "STREET", "", .)
	replace shortschool3 = subinstr(shortschool3, "AVENUE", "", .)
	replace shortschool3 = subinstr(shortschool3, "VALLEY", "", .)
	replace shortschool3 = subinstr(shortschool3, "VILLAGE", "", .)
	replace shortschool3 = subinstr(shortschool3, "VISTA", "", .)
	replace shortschool3 = subinstr(shortschool3, "MIDDLE", "", .)
	replace shortschool3 = subinstr(shortschool3, "JR. HIGH", "", .)
	replace shortschool3 = subinstr(shortschool3, "JUNIOR HIGH", "", .)
	replace shortschool3 = subinstr(shortschool3, "ADULT", "", .)
	replace shortschool3 = subinstr(shortschool3, "ACADEMY", "", .)
	replace shortschool3 = subinstr(shortschool3, "CONTINUATION", "", .)
	replace shortschool3 = subinstr(shortschool3, "JR./SR.", "", .)
	replace shortschool3 = subinstr(shortschool3, "HIGH", "", .)
	replace shortschool3 = subinstr(shortschool3, "H.S.", "", .)
	replace shortschool3 = subinstr(shortschool3, "/", "", .)
	replace shortschool3 = subinstr(shortschool3, " - ", " ", .)
	replace shortschool3 = subinstr(shortschool3, "-", " ", .)
	replace shortschool3 = subinstr(shortschool3, "`", " ", .)
	replace shortschool3 = subinstr(shortschool3, "'", " ", .)
	replace shortschool3 = subinstr(shortschool3, "  ", " ", .)
	replace shortschool3 = strtrim(shortschool3)
	bysort newdistcode shortschool3: gen numduplicates3 = _N
	tab shortschool if numduplicates3 > 1
	replace shortschool3 = shortschool if numduplicates3 > 1
	gen flag = regexm(shortschool3, "\.")
	gen name = reverse(ustrword(reverse(shortschool3), 1))
		bysort newdistcode name: gen numduplicates4 = _N
		replace name = shortschool3 if numduplicates4 > 1
	replace shortschool3 = name if flag == 1
	*tab shortschool if numduplicates4 > 1
	*gen slash = subinstr(cleanschool, substr(cleanschool, slpos, length(cleanschool) - slpos+1), "", .)
save SchoolCodesThree.dta, replace

*Takes out a few more modifiers

use SchoolCodesThree
	save SchoolCodesFour, replace
	replace shortschool3 = subinstr(shortschool3, "CENTER", "", .)
	replace shortschool3 = subinstr(shortschool3, "EDUCATION", "", .)
	replace shortschool3 = subinstr(shortschool3, "USD", "", .)
	replace shortschool3 = subinstr(shortschool3, "  ", " ", .)
	replace shortschool3 = strtrim(shortschool3)
	replace name = reverse(ustrword(reverse(shortschool3), 1))
	replace name = strtrim(name)
		bysort newdistcode name: gen numduplicates8 = _N
		replace name = shortschool if numduplicates8 > 1
save SchoolCodesFour.dta, replace

*Permutes first and last word in entry 

use SchoolCodesThree
save SchoolCodesFive, replace
gen first = ustrword(cleanschool, 1)
	bysort newdistcode first: gen numduplicates5 = _N
	drop if numduplicates5 > 1
save SchoolCodesFive.dta, replace

use SchoolCodesThree
save SchoolCodesSix, replace
gen nametofirst = name
	bysort newdistcode nametofirst: gen numduplicates6 = _N
	drop if numduplicates6 > 1
save SchoolCodesSix.dta, replace

use SchoolCodesFive
save SchoolCodesSeven, replace
gen firsttoname = first
	bysort newdistcode firsttoname: gen numduplicates7 = _N
	drop if numduplicates7 > 1
save SchoolCodesSeven.dta, replace

*Deletes duplicate project names to merge on projectname alone

use SchoolCodesFour
save SchoolCodesTent, replace
drop if DupTag > 0
save SchoolCodesTent.dta, replace


use SchoolCodesFour
save SchoolCodesTentss, replace
duplicates tag shortschool, generate(DupTag2)
drop if DupTag2 > 0
save SchoolCodesTentss.dta, replace

use SchoolCodesFour
save SchoolCodesTentss3, replace
duplicates tag shortschool3, generate(DupTag3)
drop if DupTag3 > 0
save SchoolCodesTentss3.dta, replace

use SchoolCodesFour
save SchoolCodesTentn, replace
duplicates tag name, generate(DupTag4)
drop if DupTag4 > 0
save SchoolCodesTentn.dta, replace

*this layer drops out all duplicate school and distID pairs that have differing schoolIDs

insheet using SchoolCodes.csv, names clear
	save SchoolCodesTent1, replace
	destring newdistcode1, replace float
	rename newdistcode1 newdistcode
	bysort newdistcode projectname: gen numduplicates = _N
	keep if numdup > 1
	duplicates drop newdistcode, force
	rename projectname cleanschool
	format schoolid %11.0f
	tostring schoolid, replace format(%11.0f)
save SchoolCodesTent1.dta, replace

*Tentative merge on just the first word of the entry

use SchoolCodesTent1
	save SchoolCodesTent2, replace
	gen first = ustrword(cleanschool, 1)
	duplicates tag first, generate(DupTag4)
	drop if DupTag4 > 0
save SchoolCodesTent2.dta, replace

