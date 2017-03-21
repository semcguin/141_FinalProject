/*
Sophie McGuinness
Clean DSA_etracker_withdistricts data
Outputs DSA_K12_clean
*/

clear
global rawdir "/Users/SophieMcG/Dropbox/CCCapacity/K12Const/Raw"
global datadir "/Users/SophieMcG/Dropbox/CCCapacity/K12Const/Data"
insheet using "$rawdir/DSA_etracker_withdistricts.csv"
cd $rawdir
save DSA_Construction_K12, replace

use DSA_Construction_K12

*** Converts Dates and Prices into numeric format ***
replace clientname = strupper(clientname)
replace projectname = strupper(projectname)

destring projectcontractedamt, generate(contractedamt) ignore("$,")
destring projectestamt, generate(estamount) ignore("$,")
destring finalcost, generate(finalamount) ignore("$,")
destring projectchangeorderamt, generate(changeamt) ignore("$,")


gen stpos1 = strpos(projectreceived, "/")
gen stpos2 = strrpos(projectreceived, "/")
gen mnth_opened = substr(projectreceived, 1, stpos1-1)
gen day_opened = substr(projectreceived, stpos1+1, (stpos2-1)-stpos1)
gen yr_opened = substr(projectreceived, stpos2+1, 8)


gen stpos11 = strpos(closeddate, "/")
gen stpos22 = strrpos(closeddate, "/")
gen mnth_closed = substr(closeddate, 1, stpos11-1)
gen day_closed = substr(closeddate, stpos11+1, (stpos22-1)-stpos11)
gen yr_closed = substr(closeddate, stpos22+1, 8)

drop stpos1 stpos2 stpos11 stpos22

*** Corrects typos in school names ***
replace clientname = subinstr(clientname, "JT.", "JOINT", .)
replace clientname = subinstr(clientname, "UNFIED", "UNIFIED", .)
replace clientname = subinstr(clientname, "MT ", "MT. ", .)
replace clientname = subinstr(clientname, "MT.", "MT. ", .)
replace clientname = subinstr(clientname, "MT.  ", "MT. ", .)
replace clientname = subinstr(clientname, "EUDATION", "EDUCATION", .)
replace clientname = subinstr(clientname, "ALBANY  UNIFIED SCHOOL DISTRICT", "ALBANY UNIFIED SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "BALDY VIEW REGIONAL OCCUPATIONAL PROGRAM", "BALDY VIEW ROP", .)
replace clientname = subinstr(clientname, "BEARDSLEY ELEMEMENTARY SCHOOL DISTRICT", "BEARDSLEY ELEMENTARY SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "BONITA UNFIED SCHOOL DISTRICT", "BONITA UNIFIED SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "BIG OAK FLAT GROVELAND UNIFIED SCHOOL DISTRICT", "BIG OAK FLAT-GROVELAND UNIFIED SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "CALISTOGA JT. UNIFIED SCHOOL DISTRICT", "CALISTOGA JOINT UNIFIED SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "CENTER UNIFIED SCHOOL DISTRICT", "CENTER JOINT UNIFIED SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "CHICO COUNTRY DAY SCHOOL", "CHICO UNIFIED SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "COLD SPRINGS ELEMENTARY SCHOOL DISTRICT", "COLD SPRING ELEMENTARY SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "COVINA VALLEY UNIFIED SCHOOL DISTRICT", "COVINA-VALLEY UNIFIED", .)
replace clientname = subinstr(clientname, "CULVER CITY UNIFIED SCHOL DISTRICT", "CULVER CITY UNIFIED SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "DUBLIN JT. UNIFIED SCHOOL DISTRICT", "DUBLIN UNIFIED SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "DUNSMUIR JT. UNION HIGH SCHOOL DISTRICT", "DUNSMUIR JOINT UNION HIGH SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "EXELSIOR EDUCATION CENTER", "EXCELSIOR EDUCATION CENTER", .)
replace clientname = subinstr(clientname, "EUREKA CITY HIGH SCHOOL DISTRICT", "EUREKA CITY SCHOOLS", .)
replace clientname = subinstr(clientname, "EUREKA CITY ELEMENTARY SCHOOL DISTRICT", "EUREKA CITY SCHOOLS", .)
replace clientname = subinstr(clientname, "FAIRFIELD - SUISUN UNIFIED SCHOOL DISTRICT", "FAIRFIELD-SUISUN UNIFIED SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "FOLSOM CORDOVA UNIFIED SCHOOL DISTRICT", "FOLSOM-CORDOVA UNIFIED SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "FULLERTON SCHOOL DISTRICT", "FULLERTON ELEMENTARY SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "EXELSIOR EDUCATION CENTER", "EXCELSIOR EDUCATION CENTER", .)
replace clientname = subinstr(clientname, "G E CAPITAL MODULAR SPACE", "G.E. CAPITAL MODULAR SPACE", .)
replace clientname = subinstr(clientname, "GERNADA ELEMENTARY SCHOOL DISTRICT", "GRENADA ELEMENTARY SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "HACIENDA-LA PUENTE UNIFIED SCHOOL DISTRICT", "HACIENDA LA PUENTE UNIFIED SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "HART RANSOM UNION ELEMENTARY SCHOOL DISTRICT", "HART-RANSOM UNION ELEMENTARY SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "HAPPY VALLEY ELEMENTARY USD", "HAPPY VALLEY UNION ELEMENTARY SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "HUMBOLDT COUNTY OF EDUCATION", "HUMBOLDT COUNTY OFFICE OF EDUCATION", .)
replace clientname = subinstr(clientname, "HUMBOLDT UNION HIGH SCHOOL", "NORTHERN HUMBOLDT UNION HIGH SCHOOL", .)
replace clientname = subinstr(clientname, "IGO, ONO, PLATINA UNION ELEMENTARY", "IGO ONO PLATINA UNION ELEMENTARY", .)
replace clientname = subinstr(clientname, "JAMUL DULZURA UNION ELEMENTARY SCHOOL DISTRICT", "JAMUL-DULZURA UNION ELEMENTARY SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "KLAMATH -TRINTY JOINT UNIFIED SCHOOL DISTRICT", "KLAMATH-TRINITY JOINT UNIFIED SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "KINGS CITY UNION ELEMENTARY SCHOOL DISTRICT", "KING CITY UNION ELEMENTARY SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "LAGUNITA ELEMENTARY SCHOOL DISTRICT", "LAGUNITAS ELEMENTARY SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "LAGUNA BEACH UNFIED SCHOOL DISTRICT", "LAGUNA BEACH UNIFIED SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "LA MESA SPRING VALLEY SCHOOL DISTRICT", "LA MESA-SPRING VALLEY SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "LIVERMORE VALLEY JT. UNIFIED SCHOOL DISTRICT", "LIVERMORE VALLEY JOINT UNIFIED SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "LIBERTY SCHOOL DISTRICT", "LIBERTY ELEMENTARY SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "LUCERNE VALLEY SCHOOL DISTRICT", "LUCERNE VALLEY UNIFIED SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "MENDOCINO OFFICE OF EDUCATION", "MENDOCINO COUNTY OFFICE OF EDUCATION", .)
replace clientname = subinstr(clientname, "MOBILE MODULAR MANAGEMENT CORP", "MOBILE MODULAR MANAGEMENT CORP.", .)
replace clientname = subinstr(clientname, "MOUNTAIN VIEW-WHISMAN ELEMENTARY SCHOOL DISTRICT", "MOUNTAIN VIEW WHISMAN ELEMENTARY SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "MT DIABLO UNIFIED SCHOOL DISTRICT", "MT. DIABLO UNIFIED SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "MT. SHASTA UNION SCHOOL DISTRICT", "MT. SHASTA UNION ELEMENTARY SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "MUROC UNIFIED SCHOOL DISTRICT", "MUROC JOINT UNIFIED SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "NEWMAN CROWS LANDING UNIFIED SCHOOL DISTRICT", "NEWMAN-CROWS LANDING UNIFIED SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "R.O.P. - NORTH ORANGE COUNTY", "NORTH ORANGE COUNTY ROP", .)
replace clientname = subinstr(clientname, "OCEANSIDE CITY", "OCEANSIDE", .)
replace clientname = subinstr(clientname, "ONTARIO MONTCLAIR", "ONTARIO-MONTCLAIR", .)
replace clientname = subinstr(clientname, "ORANGE COUNTY OFFICE OF EDUCATION", "ORANGE COUNTY DEPARTMENT OF EDUCATION", .)
replace clientname = subinstr(clientname, "OPHIR ELEMENTARY SCHOOL DISTRICT", "LOOMIS UNION SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "PACIFIC MOBILE STRUCTURES, INC.      ..", "PACIFIC MOBILE STRUCTURES, INC.", .)
replace clientname = subinstr(clientname, "PACIFIC UNION ELEMENTARY SCHOOL", "PACIFIC UNION ELEMENTARY SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "PALOS VERDES UNIFIED SCHOOL DISTRICT", "PALOS VERDES PENINSULA UNIFIED SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "PALERMO UNION SCHOOL DISTRICT.", "PALERMO UNION SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "PARLIER UNIFIED SCHOOL  DISTRICT", "PARLIER UNIFIED SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "PATTERSON JT. UNIFIED SCHOOL DISTRICT", "PATTERSON JOINT UNIFIED SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "PANAMA BUENA VISTA UNION SCHOOL DISTRICT", "PANAMA-BUENA VISTA UNION SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "RAMONA UNIFIED SCHOOL DISTRICT", "RAMONA CITY UNIFIED SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "RIALTO UNIFIED  SCHOOL DISTRICT", "RIALTO UNIFIED SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "RIO-BRAVO GREELEY UNION ELEMENTARY SCHOOL DISTRICT", "RIO BRAVO-GREELEY UNION ELEMENTARY SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "RIVERDALE JT. UNIFIED SCHOOL DISTRICT", "RIVERDALE JOINT UNIFIED SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "SAN BERNARDINO COUNTY  OFFICE OF EDUCATION", "SAN BERNARDINO COUNTY OFFICE OF EDUCATION", .)
replace clientname = subinstr(clientname, "SAN LEANDRO UNIFIED SCHOOL  DISTRICT", "SAN LEANDRO UNIFIED SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "SAN RAFAEL CITY SCHOOL DISTRICT", "SAN RAFAEL CITY ELEMENTARY SCHOOL DISTRICT", .) if regexm(projectname, "HIGH") != 1
replace clientname = subinstr(clientname, "SAN RAFAEL CITY SCHOOL DISTRICT", "SAN RAFAEL CITY HIGH SCHOOL DISTRICT", .) if regexm(projectname, "HIGH") == 1
replace clientname = subinstr(clientname, "SANTA ROSA CITY HIGH", "SANTA ROSA HIGH", .)
replace clientname = subinstr(clientname, "CITY OF SANTA ROSA HIGH", "SANTA ROSA HIGH", .)
replace clientname = subinstr(clientname, "ST. HELENA", "SAINT HELENA", .)
replace clientname = subinstr(clientname, "SHASTA TRINITY ROP", "SHASTA-TRINITY ROP", .)
replace clientname = subinstr(clientname, "SOUTHERN HUMBOLDT JT. UNIFIED SCHOOL DISTRICT", "SOUTHERN HUMBOLDT UNIFIED SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "SOUTHERN CALIFORNIA REGIONAL OCCUPATIONAL CENTER", "SOUTHERN CALIFORNIA ROC", .)
replace clientname = subinstr(clientname, "ST HELENA UNIFIED SCHOOL DISTRICT", "SAINT HELENA UNIFIED SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "SIERRA PLUMAS JOINT UNIFIED SCHOOL DISTRICT", "SIERRA-PLUMAS JOINT UNIFIED SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "SWETT UNIFIED", "JOHN SWETT UNIFIED", .) if regexm(clientname, "JOHN") != 1
replace clientname = subinstr(clientname, "TAHOE TRUCKEE UNIFIED SCHOOL DISTRICT", "TAHOE-TRUCKEE UNIFIED SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "TEHACHAPI UNIF SCHOOL DISTRICT", "TEHACHAPI UNIFIED SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "TEHANA COUNTY OFFICE OF EDUCATION", "TEHAMA COUNTY OFFICE OF EDUCATION", .)
replace clientname = subinstr(clientname, "TRI-VALLEY REGIONAL OCCUPATIONAL CENTERS", "TRI-VALLEY ROC", .)
replace clientname = subinstr(clientname, "UPPER LAKE ELEMENTARY SCHOOL DISTRICT", "UPPER LAKE UNION ELEMENTARY SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "VALLEY CENTER - PAUMA UNIFIED", "VALLEY CENTER-PAUMA UNIFIED", .)
replace clientname = subinstr(clientname, "WEST COVINA UNIFIED SCHOOL DIST.", "WEST COVINA UNIFIED SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "WHISMAN", "MOUNTAIN VIEW WHISMAN", .)
replace clientname = subinstr(clientname, "MOUNTAIN VIEW MOUNTAIN VIEW WHISMAN", "MOUNTAIN VIEW WHISMAN", .)
replace clientname = subinstr(clientname, "WILLIAM S HART UNION HIGH SCHOOL DISTRICT", "WILLIAM S. HART UNION HIGH SCHOOL DISTRICT", .)
replace clientname = subinstr(clientname, "YOLO  COUNTY OFFICE OF EDUCATION", "YOLO COUNTY OFFICE OF EDUCATION", .)

replace projectname = subinstr(projectname, "ALOHA ELEM. SCHOOL", "ALOHA ELEMENTARY SCHOOL", .)
replace projectname = subinstr(projectname, "ALOHA ELEMENTARY", "ALOHA ELEMENTARY SCHOOL", .)
replace projectname = subinstr(projectname, "BRAGG ELEM. SCHOOL", "BRAGG ELEMENTARY SCHOOL ", .)
replace projectname = subinstr(projectname, "CABRILLO LANE ADUDLT SCHOOL", "CABRILLO LANE ADULT SCHOOL", .)
replace projectname = subinstr(projectname, "CARVER ACADEMY", "CARVER ACADEMY ELEMENTARY SCHOOL", .)
replace projectname = subinstr(projectname, "CARVER ELEMENTARY SCHOOL", "CARVER ACADEMY ELEMENTARY SCHOOL", .)
replace projectname = subinstr(projectname, "FURGESON ELEM. SCHOOL", "FURGESON ELEMENTARY SCHOOL", .)
replace projectname = subinstr(projectname, "FURGESON ELEMENTARY", "FURGESON ELEMENTARY SCHOOL", .)
replace projectname = subinstr(projectname, "GARH HIGH SCHOOL", "GAHR HIGH SCHOOL", .)
replace projectname = subinstr(projectname, "WINTERS JT. UNIFIED SCHOOL DISTRICT", "WINTERS JOINT UNIFIED SCHOOL DISTRICT", .)
replace projectname = subinstr(projectname, "WOODLAND JT. UNIFIED SCHOOL DISTRICT", "WOODLAND JOINT UNIFIED SCHOOL DISTRICT", .)
replace projectname = subinstr(projectname, "WINTERS JT. UNIFIED SCHOOL DISTRICT", "WINTERS JOINT UNIFIED SCHOOL DISTRICT", .)



*** MERGE IN DISTRICT IDs ***

/*Layer 1: Takes "School" and "District" out of clientname 
so that it can merge more consistently with the using data*/

gen shortname = clientname
	replace shortname = subinstr(shortname, "SCHOOL", "", .)
	replace shortname = subinstr(shortname, "DISTRICT", "", .)
	replace shortname = strtrim(shortname)
		merge m:1 shortname using Crosswalk, gen(merge_approve)
		drop if merge_approve == 2
		gen newdistcode = distcode
		drop distcode

/*Layer 2: Builds on layer 1. Cuts clientname short after
 16 characters to further reduce inconsistencies*/

gen shortname1 = clientname
	replace shortname1 = subinstr(shortname1, "SCHOOL", "", .)
	replace shortname1 = subinstr(shortname1, "DISTRICT", "", .)
	replace shortname1 = substr(shortname1, 1, 16)
	replace shortname1 = strtrim(shortname1)
		merge m:1 shortname1 using CrosswalkOne, gen(merge1_approve) 
		drop if merge1_approve == 2
		replace newdistcode = distcode if newdistcode == .
		drop distcode
		
/*Layer 3: Builds on Layer 2. Takes out more inconsistent words*/

gen shortname2 = clientname
	replace shortname2 = subinstr(shortname2, "SCHOOL", "", .)
	replace shortname2 = subinstr(shortname2, "DISTRICT", "", .)
	replace shortname2 = subinstr(shortname2, "DIST.", "", .)
	replace shortname2 = subinstr(shortname2, "JOINT", "", .)
	replace shortname2 = subinstr(shortname2, "ELEMENTARY", "", .)
	replace shortname2 = subinstr(shortname2, "UNION", "", .)
	replace shortname2 = subinstr(shortname2, "UNIFIED", "", .)
	replace shortname2 = subinstr(shortname2, "HIGH", "", .)
	replace shortname2 = subinstr(shortname2, "CITY OF", "", .)
	replace shortname2 = strtrim(shortname2)
		merge m:1 shortname2 using CrosswalkTwo, gen(merge2_approve) 
		drop if merge2_approve == 2
		replace newdistcode = distcode if newdistcode == .
		drop distcode
		drop shortname shortname1 shortname2 distcode1 distcode2 DupTag DupTag1 DupTag2

/* Some manual entry for names that could not be merged in layers 1-3*/

replace newdistcode = 691051 if regexm(clientname, "ALAMEDA COUNTY OFFICE OF EDUCATION") == 1
replace newdistcode = 601770 if regexm(clientname, "ALAMEDA CITY") == 1
replace newdistcode = 601860 if regexm(clientname, "ALBANY UNIFIED") == 1
replace newdistcode = 603180 if regexm(clientname, "ARMONA UNION ELEMENTARY") == 1
replace newdistcode = 691136 if regexm(clientname, "AROMAS-SAN JUAN UNIFIED") == 1
replace newdistcode = 607200 if regexm(clientname, "CAMPBELL UNION ELEMENTARY SCHOOL DISTRICT") == 1
replace newdistcode = 600052 if regexm(clientname, "EUREKA CITY SCHOOLS") == 1
replace newdistcode = 601420 if regexm(clientname, "FORTUNA UNION ELEMENTARY SCHOOL DISTRICT") == 1
replace newdistcode = 614790 if regexm(clientname, "GALT JOINT UNION HIGH SCHOOL DISTRICT") == 1
replace newdistcode = 614820 if regexm(clientname, "GALT JOINT UNION ELEMENTARY SCHOOL DISTRICT") == 1
replace newdistcode = 602370 if regexm(clientname, "ALVINA ELEMENTARY SCHOOL DISTRICT") == 1
replace newdistcode = 601415 if regexm(clientname, "AMERICAN UNION ELEMENTARY SCHOOL DIST") == 1
replace newdistcode = 600160 if regexm(clientname, "COARSEGOLD UNION SCHOOL DISTRICT") == 1
replace newdistcode = 601332 if regexm(clientname, "DEL PASO HEIGHTS ELEMENTARY SCHOOL") == 1
replace newdistcode = 626370 if regexm(clientname, "DELTA VIEW JOINT UNION ELEMENTARY") == 1
replace newdistcode = 600033 if regexm(clientname, "DOS PALOS ORO-LOMA JOINT UNIFIED") == 1
replace newdistcode = 600159 if regexm(clientname, "ETNA UNION ELEMENTARY SCHOOL DISTRICT") == 1
replace newdistcode = 600159 if regexm(clientname, "ETNA UNION HIGH SCHOOL DISTRICT") == 1
replace newdistcode = 600159 if regexm(clientname, "FORT JONES UNION ELEMENTARY SCHOOL") == 1
replace newdistcode = 622230 if regexm(clientname, "HOLT UNION SCHOOL DISTRICT") == 1
replace newdistcode = 618510 if regexm(clientname, "ISLAND UNION ELEMENTARY SCHOOL") == 1
replace newdistcode = 618660 if regexm(clientname, "JACOBY CREEK ELEMENTARY SCHOOL DISTRICT") == 1
replace newdistcode = 619770 if regexm(clientname, "KINGS RIVER-HARDWICK UNION ELEMENTARY") == 1
replace newdistcode = 634320 if regexm(clientname, "LA JOLLA HIGH SCHOOL FACILITIES EXPAN") == 1
replace newdistcode = 628710 if regexm(clientname, "LOS ALAMOS ELEMENTARY SCHOOL DISTRICT") == 1
replace newdistcode = 623460 if regexm(clientname, "MAGNOLIA SCHOOL DISTRICT") == 1
replace newdistcode = 614370 if regexm(clientname, "MCKINLEY UNION ELEMENTARY SCHOOL DIST.") == 1
replace newdistcode = 600116 if regexm(clientname, "MINARETS JOINT UNION HIGH SCHOOL DIST.") == 1
replace newdistcode = 600069 if regexm(clientname, "PAUMA ELEMENTARY SCHOOL DISTRICT") == 1
replace newdistcode = 622560 if regexm(clientname, "PENRYN ELEMENTARY SCHOOL DISTRICT") == 1
replace newdistcode = 600159 if regexm(clientname, "QUARTZ VALLEY ELEMENTARY SCHOOL DISTR.") == 1
replace newdistcode = 601332 if regexm(clientname, "RIO LINDA UNION ELEMENTARY SCHOOL DIS.") == 1
replace newdistcode = 614190 if regexm(clientname, "ROHNERVILLE SCHOOL DISTRICT") == 1
replace newdistcode = 601331 if regexm(clientname, "TRINITY UNION HIGH SCHOOL DISTRICT") == 1
replace newdistcode = 640200 if regexm(clientname, "TWAIN HARTE ELEMENTARY SCHOOL") == 1
replace newdistcode = 601331 if regexm(clientname, "WEAVERVILLE ELEMENTARY SCHOOL DISTRICT") == 1
replace newdistcode = 601415 if regexm(clientname, "WEST FRESNO ELEMENTARY SCHOOL DISTRICT") == 1

replace newdistcode = 999999 if regexm(clientname, "COMMUNITY COLLEGE") == 1
replace newdistcode = 999999 if regexm(clientname, "COMMUNITY COLLEGE-") == 1
replace newdistcode = 999999 if regexm(clientname, "CITY COLLEGE") == 1
replace newdistcode = 999999 if regexm(clientname, "JUNIOR COLLEGE") == 1
replace newdistcode = 999999 if regexm(clientname, "CHARTER") == 1
replace newdistcode = 999999 if regexm(clientname, "MOBILE MODULAR") == 1
replace newdistcode = 999999 if regexm(clientname, "AMERICAN MODULAR") == 1


*** MERGE IN SCHOOL NAMES ***
replace projectname = subinstr(projectname, "ACAD.", "ACADEMY", .)
replace projectname = subinstr(projectname, " ACAD ", " ACADEMY ", .)
replace projectname = subinstr(projectname, "BLVD.", "BOULEVARD", .)
replace projectname = subinstr(projectname, "CHART.", "CHARTER", .)
replace projectname = subinstr(projectname, "CONT.", "CONTINUATION", .)
replace projectname = subinstr(projectname, "COMM.", "COMMUNITY", .)
replace projectname = subinstr(projectname, " HGH", " HIGH", .)
replace projectname = subinstr(projectname, "PL.", "PLACE", .)
replace projectname = subinstr(projectname, "ELEM.", "ELEMENTARY", .)
replace projectname = subinstr(projectname, "ELEMEN.", "ELEMENTARY", .)
replace projectname = subinstr(projectname, "ELEMANTARY", "ELEMENTARY", .)
replace projectname = subinstr(projectname, "ELEMEENTARY", "ELEMENTARY", .)
replace projectname = subinstr(projectname, "ED.", "EDUCATION", .)
replace projectname = subinstr(projectname, "EDU.", "EDUCATION", .)
replace projectname = subinstr(projectname, "EDUC.", "EDUCATION", .)
replace projectname = subinstr(projectname, "H.S.", "HIGH SCHOOL", .)
replace projectname = subinstr(projectname, "H. S.", "HIGH SCHOOL", .)
replace projectname = subinstr(projectname, " HS ", " HIGH SCHOOL ", .)
replace projectname = subinstr(projectname, "H.S", "HIGH SCHOOL", .) if length(projectname) == strpos(projectname, "H.S")+2
replace projectname = subinstr(projectname, " HS", "HIGH SCHOOL", .) if length(projectname) == strpos(projectname, " HS")+2
replace projectname = subinstr(projectname, " MS ", " MIDDLE SCHOOL", .)
replace projectname = subinstr(projectname, " MS", " MIDDLE SCHOOL", .)
replace projectname = subinstr(projectname, "M.S.", "MIDDLE SCHOOL", .)
replace projectname = subinstr(projectname, "M. S.", "MIDDLE SCHOOL", .)
replace projectname = subinstr(projectname, "ELEM ", " ELEMENTARY ", .)
replace projectname = subinstr(projectname, " ES ", " ELEMENTARY ", .)
replace projectname = subinstr(projectname, " ES", " ELEMENTARY", .) if length(projectname) == strpos(projectname, " ES")+2
replace projectname = subinstr(projectname, " E.S", " ELEMENTARY", .) if length(projectname) == strpos(projectname, " E.S")+3
replace projectname = subinstr(projectname, "E.S.", "ELEMENTARY", .)
replace projectname = subinstr(projectname, "E. S.", "ELEMENTARY", .)
replace projectname = subinstr(projectname, "JR", "JUNIOR", .)
replace projectname = subinstr(projectname, "J.R.", "JUNIOR", .)
replace projectname = subinstr(projectname, "JR.", "JUNIOR", .)
replace projectname = subinstr(projectname, "JUNIOR.", "JUNIOR", .)
replace projectname = subinstr(projectname, " SR ", " SENIOR ", .)
replace projectname = subinstr(projectname, " SR", " SENIOR", .) if length(projectname) == strpos(projectname, " SR")+2
replace projectname = subinstr(projectname, "S.R.", "SENIOR", .)
replace projectname = subinstr(projectname, "SR.", "SENIOR", .)
replace projectname = subinstr(projectname, "SENIOR.", "SENIOR", .)
replace projectname = subinstr(projectname, "JUNIOR. H. S.", "JUNIOR HIGH", .)
replace projectname = subinstr(projectname, "INTERM.", "INTERMEDIATE", .)
replace projectname = subinstr(projectname, "ALTER.", "ALTERNATIVE", .)
replace projectname = subinstr(projectname, "ALT.", "ALTERNATIVE", .)
replace projectname = subinstr(projectname, "AVE.", "AVENUE", .)
replace projectname = subinstr(projectname, " AVE ", " AVENUE ", .)
replace projectname = subinstr(projectname, "DIST.", "DISTRICT", .)
replace projectname = subinstr(projectname, "PREP ", "PREPARATORY ", .)
replace projectname = subinstr(projectname, "PREP.", "PREPARATORY", .)
replace projectname = subinstr(projectname, " ST.", " STREET", .)
replace projectname = subinstr(projectname, "ST. ", " SAINT", .)
replace projectname = subinstr(projectname, "SCH.", "SCHOOL", .)
replace projectname = subinstr(projectname, "S CHOOL", "SCHOOL", .)
replace projectname = subinstr(projectname, "SO.", "SOUTH", .)
replace projectname = subinstr(projectname, "ST. ", "SAINT ", .)
replace projectname = subinstr(projectname, "PT. ", "POINT ", .)
replace projectname = subinstr(projectname, "JT. ", "JOINT ", .)
replace projectname = subinstr(projectname, "UN. ", "UNION ", .)
replace projectname = subinstr(projectname, "CENT.", "CENTER", .)
replace projectname = subinstr(projectname, "CEN.", "CENTER", .)
replace projectname = subinstr(projectname, "L.A.", "LOS ANGELES", .)
replace projectname = subinstr(projectname, "L. A.", "LOS ANGELES ", .)
replace projectname = subinstr(projectname, "MC ", "MC", .)
replace projectname = subinstr(projectname, ",", "", .)
replace projectname = subinstr(projectname, "/", "", .)
*Typos
replace projectname = subinstr(projectname, "NIXION", "NIXON", .)
replace projectname = subinstr(projectname, "TAMALPIAS", "TAMALPAIS", .)
replace projectname = subinstr(projectname, "ARCHOE", "ARCOHE", .)
replace projectname = subinstr(projectname, "BEL AIRE", "BELLE AIRE", .) if newdistcode == 634230
replace projectname = subinstr(projectname, "ADAMS", "ADDAMS", .) if newdistcode == 622500
replace projectname = subinstr(projectname, "ACKSON", "JACKSON", .) if newdistcode == 602450
replace projectname = subinstr(projectname, "JJACKSON", "JACKSON", .) if newdistcode == 602450
replace projectname = subinstr(projectname, "GREENOAKS", "GREEN OAKS", .) if newdistcode == 631860
replace projectname = subinstr(projectname, "PETALUM A", "PETALUMA", .)
replace projectname = subinstr(projectname, "MC AULIFFE", "MCCAULIFFE", .) if newdistcode == 622590
replace projectname = subinstr(projectname, "MC CARDLE", "MCCARDLE", .) if newdistcode == 614550
replace projectname = subinstr(projectname, "CHAPPARAL", "CHAPARRAL", .)
replace projectname = subinstr(projectname, "BORN", "BORON", .) if newdistcode == 626490
replace projectname = subinstr(projectname, "BRIGHWOOD", "BRIGHTWOOD", .) if newdistcode == 600153
replace projectname = subinstr(projectname, "BULTER", "BUTLER", .) if newdistcode == 600048
replace projectname = subinstr(projectname, "E V CAIN", "EV CAIN", .)
replace projectname = subinstr(projectname, "COVERLAND", "CLOVERLAND", .)
replace projectname = subinstr(projectname, "EDISION", "EDISON", .)
replace projectname = subinstr(projectname, "EDMONSON", "DEMONDSON", .) if newdistcode == 627690
replace projectname = subinstr(projectname, "YOSIMTE", "YOSEMITE", .)
replace projectname = subinstr(projectname, "YOSIMITE", "YOSEMITE", .)
replace projectname = subinstr(projectname, "CATHEY'S", "CATHEYS", .)
replace projectname = subinstr(projectname, "HILL SIDE", "HILLSIDE", .)
replace projectname = subinstr(projectname, "GONZALVES", "GONSALVES", .)
replace projectname = subinstr(projectname, "GLASELL", "GLASSELL", .)
replace projectname = subinstr(projectname, "FREEMONT", "FREMONT", .)
replace projectname = subinstr(projectname, "EMPRESSA", "EMPRESA", .)
replace projectname = subinstr(projectname, "ELLIOT ", "ELLIOTT ", .)
replace projectname = subinstr(projectname, "MT. VIEW", "MOUNTAIN VIEW", .)
replace projectname = subinstr(projectname, "EADT", "EAST", .)




*LAYER 1: Merge on raw entry of projectname
gen cleanschool = projectname
	merge m:1 cleanschool newdistcode using SchoolCodes, gen(mergeSchool_approve)
	drop if mergeSchool_approve == 2
	gen newschoolid = schoolid
	drop schoolid

*LAYER 2: Identify school level and cut that out of schoolname entry to reduce inconsistencies
gen elem = 0
	replace elem = 1 if regexm(projectname, "ELEMENTARY") == 1
	gen pose = strpos(projectname, "ELEMENTARY") + 9

gen middle = 0
	replace middle = 1 if regexm(projectname, "MIDDLE ") == 1
	gen posm = strpos(projectname, "MIDDLE ") + 5

gen high = 0
	replace high = 1 if regexm(projectname, "HIGH SCHOOL") == 1
	replace high = 1 if regexm(projectname, "HIGH ") == 1
	gen posh = strpos(projectname, "HIGH ") + 3
	replace posh = length(projectname) if length(projectname) == strpos(projectname, " HIGH")+4

gen inter = 0
	replace inter = 1 if regexm(projectname, "INTERMEDIATE") == 1
	gen posi = strpos(projectname, "INTERMEDIATE") + 11

	replace cleanschool = substr(projectname, 1, pose) if elem ==1
	replace cleanschool = substr(projectname, 1, posm) if middle ==1
	replace cleanschool = substr(projectname, 1, posh) if high ==1
	replace cleanschool = substr(projectname, 1, posi) if inter ==1
	replace cleanschool = projectname if elem == 0 & middle == 0 & high == 0 & inter == 0
	replace cleanschool = subinstr(cleanschool, "SCHOOL", "", .)
	replace cleanschool = strtrim(cleanschool)
	replace cleanschool = subinstr(cleanschool, "  ", " ", .)
	
gen shortschool = cleanschool
	merge m:1 shortschool newdistcode using SchoolCodesOne, gen(mergeSchool1_approve)
	drop if mergeSchool1_approve == 2
	replace newschoolid = schoolid if missing(newschoolid)
	drop schoolid

*LAYER 3: Take out modifiers to reduce inconsistency
gen shortschool2 = shortschool
	replace shortschool2 = subinstr(shortschool2, "CITY", "", .)
	replace shortschool2 = subinstr(shortschool2, "SENIOR", "", .)
	replace shortschool2 = subinstr(shortschool2, "UNION", "", .)
	replace shortschool2 = subinstr(shortschool2, "JOINT", "", .)
	replace shortschool2 = subinstr(shortschool2, "UNIFIED", "", .)
	replace shortschool2 = subinstr(shortschool2, ".", "", .)
gen ppos1 = strpos(shortschool2, "(")
gen ppos2 = strrpos(shortschool2, ")")
	replace shortschool2 = subinstr(shortschool2, substr(shortschool2, ppos1, ppos2 - ppos1+1), "", .)
	replace shortschool2 = subinstr(shortschool2, substr(shortschool2, ppos1, length(shortschool2) - ppos1+1), "", .) if ppos2 == 0  & ppos1 != 0
	replace shortschool2 = subinstr(shortschool2, substr(shortschool2, ppos1, length(shortschool2)), "", .) if ppos2 == length(shortschool2)  & ppos1 != 0
	replace shortschool2 = strtrim(shortschool2)
	replace shortschool2 = subinstr(shortschool2, "  ", " ", .)
merge m:1 shortschool2 newdistcode using SchoolCodesTwo, gen(mergeSchool2_approve) 
	drop if mergeSchool2_approve == 2
	replace newschoolid = schoolid if missing(newschoolid)
	drop schoolid

 *LAYER 4: Take out more modifiers, correct some typos
gen shortschool3 = shortschool2
	replace shortschool3 = subinstr(shortschool3, "BOULEVARD", "", .)
	replace shortschool3 = subinstr(shortschool3, "ELEMENTARY", "", .)
	replace shortschool3 = subinstr(shortschool3, "CHARTER", "", .)
	replace shortschool3 = subinstr(shortschool3, "ALTERNATIVE", "", .)
	replace shortschool3 = subinstr(shortschool3, "PRE", "", .) if length(shortschool3) == strpos(shortschool3, " PRE")+3
	replace shortschool3 = subinstr(shortschool3, "PRE ", " ", .)
	replace shortschool3 = subinstr(shortschool3, "PRIMARY", "", .)
	replace shortschool3 = subinstr(shortschool3, "MAGNET", "", .)
	replace shortschool3 = subinstr(shortschool3, "DISTRICT", "", .)
	replace shortschool3 = subinstr(shortschool3, "NEW", "", .) if length(shortschool3) == strpos(shortschool3, " NEW")+3
	replace shortschool3 = subinstr(shortschool3, "K-6", "", .)
	replace shortschool3 = subinstr(shortschool3, "6-8", "", .)
	replace shortschool3 = subinstr(shortschool3, "COMMUNITY", "", .)
	replace shortschool3 = subinstr(shortschool3, "DAY", "", .)
	replace shortschool3 = subinstr(shortschool3, "VILLAGE", "", .)
	replace shortschool3 = subinstr(shortschool3, "NEW ", " ", .)
	replace shortschool3 = subinstr(shortschool3, "VALLEY", "", .)
	replace shortschool3 = subinstr(shortschool3, "VISTA", "", .)
	replace shortschool3 = subinstr(shortschool3, "STREET", " ", .)
	replace shortschool3 = subinstr(shortschool3, "AVENUE", " ", .)
	replace shortschool3 = subinstr(shortschool3, "INTERMEDIATE", "", .)
	replace shortschool3 = subinstr(shortschool3, "SATELLITE", "", .)
	replace shortschool3 = subinstr(shortschool3, "MIDDLE", "", .)
	replace shortschool3 = subinstr(shortschool3, "JR. HIGH", "", .)
	replace shortschool3 = subinstr(shortschool3, "JUNIOR HIGH", "", .)
	replace shortschool3 = subinstr(shortschool3, "ACADEMY", "", .)
	replace shortschool3 = subinstr(shortschool3, "ADULT", "", .)
	replace shortschool3 = subinstr(shortschool3, "CONTINUATION", "", .)
	replace shortschool3 = subinstr(shortschool3, "DA VINCI", "DAVINCI", .)
	replace shortschool3 = subinstr(shortschool3, "DELAVEAGA", "DE LAVEAGA", .)
	replace shortschool3 = subinstr(shortschool3, "DEPORTOLA", "DE PORTOLA", .)
	replace shortschool3 = subinstr(shortschool3, "DRYCREEK", "DRY CREEK", .)
	replace shortschool3 = subinstr(shortschool3, "DESCANSOBEDFORD", "DESCANSO", .)
	replace shortschool3 = subinstr(shortschool3, "DOW'S PRAIREIE", "DOWS PRAIRIE", .)
	replace shortschool3 = subinstr(shortschool3, "DOW 'S PRAIRIE", "DOWS PRAIRIE", .)
	replace shortschool3 = subinstr(shortschool3, "HIGH", "", .)
	replace shortschool3 = subinstr(shortschool3, "K-12", "", .)
	replace shortschool3 = subinstr(shortschool3, "K-8", "", .)
	replace shortschool3 = subinstr(shortschool3, "-", " ", .)
	replace shortschool3 = subinstr(shortschool3, "/", "", .)
	replace shortschool3 = subinstr(shortschool3, "`", " ", .)
	replace shortschool3 = subinstr(shortschool3, "'", " ", .)
gen name = reverse(ustrword(reverse(shortschool3), 1))
	replace shortschool3 = strtrim(shortschool3)
	replace shortschool3 = subinstr(shortschool3, "  ", " ", .)

merge m:1 shortschool3 newdistcode using SchoolCodesThree, gen(mergeSchool3_approve) 
	drop if mergeSchool3_approve == 2
	replace newschoolid = schoolid if missing(newschoolid)
	drop schoolid
	
 *Layer 5: Take out a few more modifiers 
	replace shortschool3 = subinstr(shortschool3, "CENTER", "", .)
	replace shortschool3 = subinstr(shortschool3, "EDUCATION", "", .)
	replace shortschool3 = subinstr(shortschool3, "USD", "", .)
	replace shortschool3 = shortschool if length(shortschool3) == 0
	replace shortschool3 = strtrim(shortschool3)
	replace shortschool3 = subinstr(shortschool3, "  ", " ", .)
	replace name = reverse(ustrword(reverse(shortschool3), 1))
	replace name = reverse(ustrword(reverse(shortschool), 1)) if length(shortschool3) == 0
	replace name = strtrim(name)

merge m:1 name newdistcode using SchoolCodesFour, gen(mergeSchool4_approve) 
	drop if mergeSchool4_approve == 2
	replace newschoolid = schoolid if missing(newschoolid)
	drop schoolid

*Layer 6: Merge just on the first word of the entry
gen first = ustrword(cleanschool, 1)
	merge m:1 first newdistcode using SchoolCodesFive, gen(mergeSchool5_approve) 
	drop if mergeSchool5_approve==2
	replace newschoolid = schoolid if missing(newschoolid)
	drop schoolid

*Layer 7: Merge on the last word of the entry
gen nametofirst = first
	merge m:1 nametofirst newdistcode using SchoolCodesSix, gen(mergeSchool6_approve) 
	drop if mergeSchool6_approve==2
	replace newschoolid = schoolid if missing(newschoolid)
	drop schoolid

*Layer 8: Swap the first and last words and merge
gen firsttoname = name
	merge m:1 firsttoname newdistcode using SchoolCodesSeven, gen(mergeSchool7_approve) 
	drop if mergeSchool7_approve==2
	replace newschoolid = schoolid if missing(newschoolid)
	drop schoolid

replace newschoolid = "62430003650" if regexm(shortschool3, "DOWS PRAIRIE")== 1

merge m:1 cleanschool using SchoolCodesTent, gen(mergeTent_approve)
	drop if mergeTent_approve == 2
	gen Tentative = 0
	replace Tentative = 1 if missing(newschoolid) & !mi(schoolid) 
	replace newschoolid = schoolid if missing(newschoolid)
	drop schoolid

merge m:1 shortschool using SchoolCodesTentss, gen(mergeTentss_approve)
	drop if mergeTentss_approve == 2
	replace Tentative = 1 if missing(newschoolid) & !mi(schoolid) 
	replace newschoolid = schoolid if missing(newschoolid)
	drop schoolid

merge m:1 shortschool3 using SchoolCodesTentss3, gen(mergeTentss3_approve)
	drop if mergeTentss3_approve == 2
	replace Tentative = 1 if missing(newschoolid) & !mi(schoolid) 
	replace newschoolid = schoolid if missing(newschoolid)
	drop schoolid

merge m:1 name using SchoolCodesTentn, gen(mergeTentn_approve)
	drop if mergeTentn_approve == 2
	replace Tentative = 1 if missing(newschoolid) & !mi(schoolid) 
	replace newschoolid = schoolid if missing(newschoolid)
	drop schoolid

merge m:1 cleanschool using SchoolCodesTent1, gen(mergeTent1_approve)
	drop if mergeTent1_approve == 2
	replace Tentative = 1 if missing(newschoolid) & !mi(schoolid) 
	replace newschoolid = schoolid if missing(newschoolid)
	drop schoolid

merge m:1 first using SchoolCodesTent2, gen(mergeTent2_approve)
	drop if mergeTent2_approve == 2
	replace Tentative = 1 if missing(newschoolid) & !mi(schoolid) 
	replace newschoolid = schoolid if missing(newschoolid)
	drop schoolid

replace newschoolid = "999999" if newdistcode == 999999 & mi(newschoolid)
replace newschoolid = "999999" if newdistcode == .
replace newschoolid = "999999" if regexm(projectname, "COMMUNITY COLLEGE-") == 1
replace newschoolid = "999999" if regexm(projectname, "COMMUNITY COLLEGE") == 1
replace newschoolid = "999999" if regexm(projectname, "CITY COLLEGE") == 1
replace newschoolid = "999999" if regexm(projectname, "COLLEGE OF") == 1
replace newschoolid = "999999" if regexm(projectname, "JUNIOR COLLEGE") == 1
replace newschoolid = "999999" if regexm(projectname, "MOBILE MODULAR") == 1
replace newschoolid = "999999" if regexm(projectname, "AMERICAN MODULAR") == 1
replace newschoolid = "999999" if regexm(projectname, "VARIOUS") == 1 & mi(newschoolid)
replace newschoolid = "999999" if regexm(projectname, "CHARTER") == 1 & mi(newschoolid)
replace newschoolid = "999999" if regexm(projectname, "STOCKPILE") == 1 & mi(newschoolid)
replace newschoolid = "999999" if regexm(projectname, "ADULT") == 1 & mi(newschoolid)
replace newschoolid = "999999" if regexm(projectname, "SPECIAL ED") == 1 & mi(newschoolid)
replace newschoolid = "999999" if regexm(projectname, "DISTRICT OFFICE") == 1 & mi(newschoolid)
replace newschoolid = "999999" if regexm(projectname, "COLLEGE") == 1 & mi(newschoolid)
replace newschoolid = "999999" if missing(projectname)


*** MERGE IN CPI DATA FOR INFLATION ADJUSTMENT ***
merge m:1 yr_opened mnth_opened using monthly_CPI_submit.csv, gen(merge_submit)
	gen CPI_estamount = .
	replace CPI_estamount = (estamount/(cpaltt01usm661s/100)) * 2.34954
gen CPI_contamount = .
	replace CPI_contamount = (contractedamt/(cpaltt01usm661s/100)) * 2.34954
gen CPI_changeamt = .
	replace CPI_changeamt = (changeamt/(cpaltt01usm661s/100)) * 2.34954
	replace CPI_changeamt = . if changeamt == 0
	
merge m:1 yr_closed mnth_closed using monthly_CPI_closed.csv, gen(merge_closed)
	gen CPI_closedamount = .
	replace CPI_closedamount = (finalamount/(cpaltt01usm661s/100)) * 2.34954

gen calculated_cost = .
	replace calculated_cost = CPI_contamount if CPI_change == .
	replace calculated_cost = CPI_estamount if CPI_change == . & CPI_contamount == 0
	replace calculated_cost = CPI_closed if CPI_closed != . & CPI_closed != 0
	replace calculated_cost = CPI_contamount + CPI_change if calculated_cost == . 

destring yr_opened mnth_opened day_opened yr_closed mnth_closed day_closed, replace	
drop if yr_opened > 16 & yr_opened < 90
drop if missing(projectrec)

	
**Merge in Student Enrollment

tostring(newdistcode), replace

*Re format year so that it inlcudes 1900 and 2000
gen yr_op1 = yr_opened + 2000 if yr_opened <17
	replace yr_op1 = yr_opened +1900 if yr_opened > 80

*Merge in demographic variables. Replace construction cost = 0 if merge_demog == 2 because this means no construction happened during that time
merge m:1 newschoolid yr_op1 using DemogCount, gen(merge_demog)
	gen CPI_perstu = calculated_cost/genenrollment
	gen CPIdist_kid = calculated_cost/distkids
	replace calculated_cost = 0 if merge_demog == 2
	replace CPI_perstu = 0 if merge_demog == 2
	replace CPIdist_kid = 0 if merge_demog == 2

gen NotContracted = 1
	replace NotContracted = 0 if yr_closed != 0	
	replace NotContracted = 0 if contractedamt !=0
	replace NotContracted = 0 if CPI_closed !=0
	replace NotContracted = 0 if CPI_change !=0


gen maybecanceled = 0
	replace maybecanceled = 1 if contractedamt == 0 & yr_closed == 0

**Collapse data in different ways for further analysis
	
preserve
collapse (sum) CPI_estamount (count) applicationnumber, by(yr_opened newdistcode)
	gen yr = yr_opened + 2000 if yr_opened <17
	replace yr = yr_opened +1900 if yr_opened > 80
	bysort newdistcode yr: gen numduplicates = _N
save DSA_Collapsed_K12, replace
restore

preserve
drop if CPI_closed == 0
collapse (sum) calculated_cost (count) applicationnumber, by(yr_closed newdistcode)
	gen yr = yr_closed + 2000 if yr_closed <17
	replace yr = yr_closed +1900 if yr_closed > 80
	bysort newdistcode yr: gen numduplicates = _N
save DSA_CollapsedClosed_K12, replace
restore

preserve
drop if maybecanceled == 1
collapse (sum) calculated_cost (count) applicationnumber, by(yr_opened newdistcode)
	gen yr = yr_opened + 2000 if yr_opened <17
	replace yr = yr_opened +1900 if yr_opened > 80
	bysort newdistcode yr: gen numduplicates = _N
save DSA_CollapsedNoCancel_K12, replace
restore

preserve
drop if maybecanceled == 1
collapse (sum) CPI_perstu (count) applicationnumber, by(yr_opened newdistcode)
	gen yr = yr_opened + 2000 if yr_opened <17
	replace yr = yr_opened +1900 if yr_opened > 80
	bysort newdistcode yr: gen numduplicates = _N
save DSA_CollapsedPerStu_K12, replace
restore

preserve
drop if NotContracted == 1
collapse (sum) CPIdist_kid distkids (count) applicationnumber, by(yr_opened newdistcode)
	gen yr = yr_opened + 2000 if yr_opened <17
	replace yr = yr_opened +1900 if yr_opened > 80
	bysort newdistcode yr: gen numduplicates = _N
save DSA_CollapsedPerStuCon_K12, replace
restore

**Drop extra variables
drop pose posm posh posi numduplicates1 ppos1 ppos2 ppos3 numduplicates numduplicates2 numduplicates3 numduplicates4 numduplicates5 numduplicates6 numduplicates7 numduplicates8
drop stpos11 stpos22 stpos1 stpos2 merge_closed merge_submit merge_approve merge1_approve merge2_approve
drop mergeSchool_approve mergeSchool1_approve mergeSchool2_approve mergeSchool3_approve mergeSchool4_approve mergeSchool5_approve mergeSchool6_approve mergeSchool7_approve
drop mergeTent_approve mergeTentss_approve mergeTentss3_approve mergeTentn_approve mergeTent1_approve mergeTent2_approve merge_demog
drop DupTag DupTag1 DupTag2 DupTag3 DupTag4 name first shortschool shortschool2 shortschool3 flag nametofirst firsttoname
drop access firelife structural energy projectestamt estamount contractedamt projectcontractedamt changeamt finalcost
drop middle inter high elem cpaltt01usm661s origin applicationnumber mnth* day* closeddate projectreceived projectchangeorder finalamount cleanschool 


saveold "$datadir/DSA_K12_Clean", replace


