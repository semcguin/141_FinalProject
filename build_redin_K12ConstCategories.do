/*
Sophie McGuinness
Uses DSA_K12_clean and adds categories to spending types
Creates summary figures for category spending over time
*/

clear
global rawdir "/Users/SophieMcG/Dropbox/CCCapacity/K12Const/Raw"
global datadir "/Users/SophieMcG/Dropbox/CCCapacity/K12Const/Data"
use "$datadir/DSA_K12_Clean", clear
save "$datadir/DSA_K12_CleanCat", replace
replace projectscope = strupper(projectscope)

gen edu_building = 0
	replace edu_building = 1 if regexm(projectscope, "EDUCATION") == 1
	replace edu_building = 1 if regexm(projectscope, "RELOCATABLE") == 1
	replace edu_building = 1 if regexm(projectscope, "CLASSROOM") == 1
	replace edu_building = 1 if regexm(projectscope, "TEACH") == 1
	replace edu_building = 1 if regexm(projectscope, "CR BUILDING") == 1
	replace edu_building = 1 if regexm(projectscope, "C.R. BUILDING") == 1
	replace edu_building = 1 if regexm(projectscope, "C. R. BUILDING") == 1
	replace edu_building = 1 if regexm(projectscope, "C/R BUILDING") == 1
	replace edu_building = 1 if regexm(projectscope, " C R ") == 1
	replace edu_building = 1 if regexm(projectscope, " CR ") == 1
	replace edu_building = 1 if regexm(projectscope, "CR.") == 1
	replace edu_building = 1 if regexm(projectscope, "C.R.") == 1
	replace edu_building = 1 if regexm(projectscope, "CLSRM") == 1
	replace edu_building = 1 if regexm(projectscope, "C.R. BLDG") == 1
	replace edu_building = 1 if regexm(projectscope, "C. R. BLDG") == 1
	replace edu_building = 1 if regexm(projectscope, "ACADEMIC") == 1
	replace edu_building = 1 if regexm(projectscope, "HILB") == 1
	replace edu_building = 1 if regexm(projectscope, "MULTIDISCIPLINARY") == 1
	replace edu_building = 1 if regexm(projectscope, "CR BLDG") == 1
	replace edu_building = 1 if regexm(projectscope, "INSTRUCTIONAL") == 1
	replace edu_building = 1 if regexm(projectscope, "SCIENCE") == 1
	replace edu_building = 1 if regexm(projectscope, "MATH") == 1
	replace edu_building = 1 if regexm(projectscope, "STEM") == 1
	replace edu_building = 1 if regexm(projectscope, "CHEMISTRY") == 1
	replace edu_building = 1 if regexm(projectscope, "HUMANITIES") == 1
	replace edu_building = 1 if regexm(projectscope, "RESEARCH") == 1
	replace edu_building = 1 if regexm(projectscope, "LEARNING") == 1	
	replace edu_building = 1 if regexm(projectscope, "MUSIC") == 1
	replace edu_building = 1 if regexm(projectscope, "PERFORM") == 1
	replace edu_building = 1 if regexm(projectscope, "ART") == 1
	replace edu_building = 1 if regexm(projectscope, "ARTS") == 1
	replace edu_building = 1 if regexm(projectscope, "CERAMIC") == 1	
	replace edu_building = 1 if regexm(projectscope, "LAB") == 1	
	replace edu_building = 1 if regexm(projectscope, "HARLAN") == 1
	replace edu_building = 1 if regexm(projectscope, "STUDENT CENTER") == 1
	replace edu_building = 1 if regexm(projectscope, "STUDENT ACTIVITY") == 1
	replace edu_building = 1 if regexm(projectscope, "STUDENT UNION") == 1
	replace edu_building = 1 if regexm(projectscope, "HARLAN") == 1

gen career_tech = 0
	replace career_tech = 1 if regexm(projectscope, "COSMETOLOGY") == 1
	replace career_tech = 1 if regexm(projectscope, "AERONAUTICS") == 1
	replace career_tech = 1 if regexm(projectscope, "CULINARY") == 1
	replace career_tech = 1 if regexm(projectscope, "MEDIA") == 1
	replace career_tech = 1 if regexm(projectscope, "GREENHOUSE") == 1
	replace career_tech = 1 if regexm(projectscope, "PLANETARIUM") == 1
	replace career_tech = 1 if regexm(projectscope, "HORTICULTURE") == 1
	replace career_tech = 1 if regexm(projectscope, "NURSERY") == 1
	replace career_tech = 1 if regexm(projectscope, "COMMUNICATIONS") == 1
	replace career_tech = 1 if regexm(projectscope, "FAMILY") == 1
	replace career_tech = 1 if regexm(projectscope, "HOME ECONOMICS") == 1
	replace career_tech = 1 if regexm(projectscope, "FORESTRY") == 1
	replace career_tech = 1 if regexm(projectscope, "POULTRY BARN") == 1
	replace career_tech = 1 if regexm(projectscope, "CHILD") == 1
	replace career_tech = 1 if regexm(projectscope, "NURSING") == 1
	replace career_tech = 1 if regexm(projectscope, "CAREER") == 1
	replace career_tech = 1 if regexm(projectscope, "BUSINESS") == 1
	replace career_tech = 1 if regexm(projectscope, "TECH") == 1
	replace career_tech = 1 if regexm(projectscope, "BRAIN INJURY") == 1
	replace career_tech = 1 if regexm(projectscope, "SKILLS") == 1 
	replace career_tech = 1 if regexm(projectscope, "SHOP") == 1
	replace career_tech = 1 if regexm(projectscope, "HEALTH") == 1	
	replace career_tech = 1 if regexm(projectscope, "CHILD") == 1
	replace career_tech = 1 if regexm(projectscope, "NURSING") == 1
	replace career_tech = 1 if regexm(projectscope, "CAREER") == 1
	replace career_tech = 1 if regexm(projectscope, "BUSINESS") == 1
	replace career_tech = 1 if regexm(projectscope, "TECH") == 1
	replace career_tech = 1 if regexm(projectscope, "BRAIN INJURY") == 1
	replace career_tech = 1 if regexm(projectscope, "SKILLS") == 1 
	replace career_tech = 1 if regexm(projectscope, "SHOP") == 1
	replace career_tech = 1 if regexm(projectscope, "HEALTH") == 1
	*need to differentiate between potential nursing center or student health center	
	replace career_tech = 1 if regexm(projectscope, "VOCATIONAL") == 1	

gen community1 =0
	replace community1 = 1  if regexm(projectscope, "RESOURCE") == 1
	replace community1 = 1  if regexm(projectscope, "LIBRARY") == 1
	replace community1 = 1  if regexm(projectscope, "LIBRAY") == 1
	replace community1 = 1  if regexm(projectscope, "CAFETERIA") == 1
	replace community1 = 1  if regexm(projectscope, "KITCHEN") == 1
	replace community1 = 1  if regexm(projectscope, "WELLNESS") == 1
	replace community1 = 1  if regexm(projectscope, "DAY CARE") == 1
	replace community1 = 1  if regexm(projectscope, "CAMPUS CENTER") == 1
	replace community1 = 1  if regexm(projectscope, "STUDENT SERVICE") == 1
	replace community1 = 1  if regexm(projectscope, "DORMITORY") == 1
	replace community1 = 1  if regexm(projectscope, "LIB") == 1 
	replace community1 = 1  if regexm(projectscope, "MULTI-PURPOSE") == 1 
	replace community1 = 1  if regexm(projectscope, "MULTIPURPOSE") == 1 
	replace community1 = 1  if regexm(projectscope, "MULTI-USE") == 1 
	replace community1 = 1  if regexm(projectscope, "MULTI PURPOSE") == 1 
	replace community1 = 1  if regexm(projectscope, "MPR ") == 1 
	replace community1 = 1  if regexm(projectscope, "M. P.") == 1 
	replace community1 = 1  if regexm(projectscope, "M.P.") == 1 


gen community2 = 0
	replace community2 = 1  if regexm(projectscope, "MONARCH") == 1
	replace community2 = 1  if regexm(projectscope, "THEATER") == 1
	replace community2 = 1  if regexm(projectscope, "THEATRE") == 1
	replace community2 = 1  if regexm(projectscope, "AUDITORIUM") == 1
	replace community2 = 1  if regexm(projectscope, "BLEACHERS") == 1
	replace community2 = 1  if regexm(projectscope, "BLEACHER") == 1
	replace community2 = 1  if regexm(projectscope, "GOLF") == 1
	replace community2 = 1  if regexm(projectscope, "SOFTBALL") == 1
	replace community2 = 1  if regexm(projectscope, "TENNIS") == 1
	replace community2 = 1  if regexm(projectscope, "WRESTLING") == 1
	replace community2 = 1  if regexm(projectscope, "FOOTBALL") == 1
	replace community2 = 1  if regexm(projectscope, "BASEBALL") == 1
	replace community2 = 1  if regexm(projectscope, "DUGOUT") == 1
	replace community2 = 1  if regexm(projectscope, "STADIUM") == 1
	replace community2 = 1  if regexm(projectscope, "TRAINING") == 1
	replace community2 = 1  if regexm(projectscope, "WEIGHT") == 1
	replace community2 = 1  if regexm(projectscope, "SCOREBOARD") == 1
	replace community2 = 1  if regexm(projectscope, "SCORREBOARD") == 1
	replace community2 = 1  if regexm(projectscope, "SCORE BOARD") == 1
	replace community2 = 1  if regexm(projectscope, "GYM") == 1
	replace community2 = 1  if regexm(projectscope, "POOL") == 1
	replace community2 = 1  if regexm(projectscope, "FEILD") == 1
	replace community2 = 1  if regexm(projectscope, "FIELD") == 1
	replace community2 = 1  if regexm(projectscope, "FITNESS") == 1
	replace community2 = 1  if regexm(projectscope, "PE") == 1 
	replace community2 = 1  if regexm(projectscope, "PLAYGROUND") == 1 
	replace community2 = 1  if regexm(projectscope, "PLAY") == 1 
	replace community2 = 1  if regexm(projectscope, "SPORTS") == 1 
	replace community2 = 1  if regexm(projectscope, "ATHLETIC") == 1 
	replace community2 = 1  if regexm(projectscope, "CHOIR") == 1 
	replace community2 = 1  if regexm(projectscope, "BANDROOM") == 1 
	replace community2 = 1  if regexm(projectscope, "KILN") == 1 
	replace community2 = 1  if regexm(projectscope, "COURT") == 1
	replace community2 = 1  if regexm(projectscope, "GRANDSTAND") == 1 
	replace community2 = 1  if regexm(projectscope, "BATTING") == 1 
	replace community2 = 1  if regexm(projectscope, "DUG-OUT") == 1 

gen gen_facilities = 0
	replace gen_facilities = 1   if regexm(projectscope, "PARKING") == 1
	replace gen_facilities = 1   if regexm(projectscope, "FOOD SERVICE") == 1
	replace gen_facilities = 1   if regexm(projectscope, "DINING") == 1
	replace gen_facilities = 1   if regexm(projectscope, "ELEVATOR") == 1
	replace gen_facilities = 1   if regexm(projectscope, "RESTROOM") == 1
	replace gen_facilities = 1   if regexm(projectscope, "TOILET") == 1
	replace gen_facilities = 1   if regexm(projectscope, "TOWER") == 1
	replace gen_facilities = 1   if regexm(projectscope, "LOCKER") == 1
	replace gen_facilities = 1   if regexm(projectscope, "HVAC") == 1
	replace gen_facilities = 1   if regexm(projectscope, "FIRE ALARM") == 1
	replace gen_facilities = 1   if regexm(projectscope, "SHADE STRUCTURE") == 1
	replace gen_facilities = 1   if regexm(projectscope, "WALL") == 1
	replace gen_facilities = 1   if regexm(projectscope, "RETAINING WALL") == 1
	replace gen_facilities = 1   if regexm(projectscope, "ROOFTOP") == 1
	replace gen_facilities = 1   if regexm(projectscope, "ROOF") == 1
	replace gen_facilities = 1   if regexm(projectscope, "RAMP") == 1
	replace gen_facilities = 1   if regexm(projectscope, "UTILITY") == 1
	replace gen_facilities = 1   if regexm(projectscope, "UTILITIES") == 1
	replace gen_facilities = 1   if regexm(projectscope, "SITE WORK") == 1
	replace gen_facilities = 1   if regexm(projectscope, "SITEWORK") == 1
	replace gen_facilities = 1   if regexm(projectscope, "CENTRAL PLANT") == 1
	replace gen_facilities = 1   if regexm(projectscope, "STORAGE") == 1
	replace gen_facilities = 1   if regexm(projectscope, "ELECTRICAL") == 1
	replace gen_facilities = 1   if regexm(projectscope, "PLANT") == 1
	replace gen_facilities = 1   if regexm(projectscope, "SECURITY") == 1
	replace gen_facilities = 1   if regexm(projectscope, "EQUIPMENT") == 1
	replace gen_facilities = 1   if regexm(projectscope, "STORE") == 1
	replace gen_facilities = 1   if regexm(projectscope, "FIRE") == 1
	replace gen_facilities = 1   if regexm(projectscope, "HEAT") == 1
	replace gen_facilities = 1   if regexm(projectscope, "PORTABLE") == 1
	replace gen_facilities = 1   if regexm(projectscope, "KIOSK") == 1
	replace gen_facilities = 1   if regexm(projectscope, "ROAD") == 1 
	replace gen_facilities = 1   if regexm(projectscope, "ADA") == 1 
	replace gen_facilities = 1   if regexm(projectscope, "POLE") == 1
	replace gen_facilities = 1   if regexm(projectscope, "POLICE") == 1
	replace gen_facilities = 1   if regexm(projectscope, "MARQUEE") == 1
	replace gen_facilities = 1   if regexm(projectscope, "MARQUIS") == 1
	replace gen_facilities = 1   if regexm(projectscope, "BILLBOARD") == 1
	replace gen_facilities = 1   if regexm(projectscope, "SITE") == 1
	replace gen_facilities = 1   if regexm(projectscope, "SAFETY") == 1
	replace gen_facilities = 1   if regexm(projectscope, "SOLAR") == 1
	replace gen_facilities = 1   if regexm(projectscope, "CONCESSION") == 1
	replace gen_facilities = 1   if regexm(projectscope, "EMERGENCY") == 1
	replace gen_facilities = 1   if regexm(projectscope, "CANOPY") == 1
	replace gen_facilities = 1   if regexm(projectscope, "ENTRY") == 1
	replace gen_facilities = 1   if regexm(projectscope, "FUEL") == 1
	replace gen_facilities = 1   if regexm(projectscope, "SEISMIC") == 1
	replace gen_facilities = 1   if regexm(projectscope, "ACCESSIBILITY") == 1 
	replace gen_facilities = 1   if regexm(projectscope, "VARIOUS") == 1 
	replace gen_facilities = 1   if regexm(projectscope, "DATA CENTER") == 1 
	replace gen_facilities = 1   if regexm(projectscope, "SHELTER") == 1 
	replace gen_facilities = 1   if regexm(projectscope, "CANOPIES") == 1 
	replace gen_facilities = 1   if regexm(projectscope, "GAZEBO") == 1 
	replace gen_facilities = 1   if regexm(projectscope, "PHOTOVOLTAIC") == 1
	replace gen_facilities = 1   if regexm(projectscope, "WATER") == 1 
	replace gen_facilities = 1   if regexm(projectscope, "PUMP") == 1 
	replace gen_facilities = 1   if regexm(projectscope, "PIPING") == 1 
	replace gen_facilities = 1   if regexm(projectscope, "DECK") == 1 
	replace gen_facilities = 1   if regexm(projectscope, "BUS") == 1 
	replace gen_facilities = 1   if regexm(projectscope, "GAS") == 1 
	replace gen_facilities = 1   if regexm(projectscope, "BRIDGE") == 1
	replace gen_facilities = 1   if regexm(projectscope, "STRUCTURE") == 1
	replace gen_facilities = 1   if regexm(projectscope, "PIPE") == 1
	replace gen_facilities = 1   if regexm(projectscope, "SIGN") == 1
	replace gen_facilities = 1   if regexm(projectscope, "ASPHALT") == 1
	replace gen_facilities = 1   if regexm(projectscope, "CARPORT") == 1
	replace gen_facilities = 1   if regexm(projectscope, "STOCKPILE") == 1
	replace gen_facilities = 1   if regexm(projectscope, "WALKWAY") == 1
	replace gen_facilities = 1   if regexm(projectscope, "WHEELCHAIR") == 1
	replace gen_facilities = 1   if regexm(projectscope, "MAINTENANCE") == 1
	replace gen_facilities = 1   if regexm(projectscope, "MECHANICAL") == 1
	replace gen_facilities = 1   if regexm(projectscope, "SHELTER") == 1
	replace gen_facilities = 1   if regexm(projectscope, "LIGHT") == 1
	replace gen_facilities = 1   if regexm(projectscope, "GENERATOR") == 1
	replace gen_facilities = 1   if regexm(projectscope, "CONCRETE") == 1
	replace gen_facilities = 1   if regexm(projectscope, "FENCING") == 1
	replace gen_facilities = 1   if regexm(projectscope, "WALK-IN") == 1
	replace gen_facilities = 1   if regexm(projectscope, "BATHROOM") == 1
	replace gen_facilities = 1   if regexm(projectscope, "LAVATORY") == 1

gen admin = 0
	replace admin = 1  if regexm(projectscope, "ADMINISTRATION") == 1
	replace admin = 1  if regexm(projectscope, "ADMIN") == 1
	replace admin = 1  if regexm(projectscope, "ADMINISTR.") == 1
	replace admin = 1  if regexm(projectscope, "OFFICE") == 1
	
*"new" flags new schools being built	
gen new = 0
	replace new = 1 if regexm(projectname, "NEW") == 1

gen modern = 0
	replace modern = 1 if regexm(projectscope, "MODERN") == 1

*Creates a variable that takes phrases that make project scope less precise

gen clean_scope = subinstr(projectscope, "CONSTRUCTION OF 1-", "", .)

gen const = 0
	replace const = 1 if regexm(clean_scope, "CONSTRUCTION") == 1
	replace const = 1 if regexm(clean_scope, "CONSRUCTION") == 1
	replace const = 1 if regexm(clean_scope, "CONST") == 1

gen alt = 0 
	replace alt = 1 if regexm(clean_scope, "ALTERATION") == 1
	replace alt = 1 if regexm(clean_scope, "ALT") == 1 

gen reconst = 0
	replace reconst = 1 if regexm(clean_scope, "RECONSTRUCTION") == 1

gen repair = 0
	replace repair = 1 if regexm(clean_scope, "REPAIR") == 1

gen relocate = 0
	replace relocate = 1 if regexm(clean_scope, "RELOCATION") == 1

gen rehab = 0
	replace rehab = 1 if regexm(clean_scope, "REHABILITATION") == 1

*Generate speding per student by category
		
foreach y in career_tech edu_building community1 community2 gen_facilities admin {
	gen `y'spending = CPI_perstu if `y' == 1
}
foreach y in career_tech edu_building community1 community2 gen_facilities admin {
	gen `y'student = CPI_perstu if `y' == 1
}

*Summary Figures

preserve
	collapse(sum)career_tech edu_building community1 community2 gen_facilities admin career_techspending edu_buildingspending community1spending community2spending gen_facilitiesspending adminspending, by(yr_op1)
	gen cte_rat = (career_techspending/career_tech)
	gen edu_rat = (edu_buildingspending/edu_building)
	gen com1_rat = (community1spending/community1)
	gen com2_rat = (community2spending/community2)
	gen gen_rat = (gen_facilitiesspending/gen_facilities) 
	gen admin_rat = (adminspending/admin) 
	twoway scatter *_rat yr_op1, connect(l l l l l l) title("Spending per Project") ytitle("Per Student Dollars per Project (Millions)") xtitle(Year)
	graph export "/Users/SophieMcG/Dropbox/CCCapacity/K12Const/Figures/ProjectSize.png", replace
restore

preserve 
	collapse (count) career_techspending edu_buildingspending community1spending community2spending gen_facilitiesspending adminspending, by(yr_op1)
	twoway scatter career_techspending edu_buildingspending community1spending community2spending gen_facilitiesspending adminspending yr_op1, connect(l l l l l l)  title("Project Counts per Category") ytitle("Number of Projects Approved") xtitle(Year)  
	graph export "/Users/SophieMcG/Dropbox/CCCapacity/K12Const/Figures/ProjectCount.png", replace
restore

preserve
	collapse (sum) career_techspending edu_buildingspending community1spending community2spending gen_facilitiesspending adminspending, by(yr_op1)
	twoway scatter career_techspending edu_buildingspending community1spending community2spending gen_facilitiesspending adminspending yr_op1, connect(l l l l l l)  title("Sum of Spending per Category") ytitle("Sum Spending") xtitle(Year)  
	graph export "/Users/SophieMcG/Dropbox/CCCapacity/K12Const/Figures/ProjectSum.png", replace
restore

preserve
	collapse (mean) career_techspending edu_buildingspending community1spending community2spending gen_facilitiesspending adminspending, by(yr_op1)
	twoway scatter career_techspending edu_buildingspending community1spending community2spending gen_facilitiesspending adminspending yr_op1, connect(l l l l l l)  title("Mean of Spending per Category") ytitle("Mean Spending") xtitle(Year)  
	graph export "/Users/SophieMcG/Dropbox/CCCapacity/K12Const/Figures/ProjectMean.png", replace
restore

save "$datadir/DSA_K12_CleanCat", replace


/*
Dont have enrollment data after 2014!

interesting modifiers
new
modernization
number of projects in a bundle

- Can we see how new schools are entered into the data
- Put projects into broader categories 
- more writeup for k12 - where is bond data and k12 -raw data set, do file that cleans it, clean data set- for bond and k12
- comment code more - add titles and what it does and name
- where is updated k12 clean with new school IDs with enrollment numbers
- most updated bond data set

Signe-Mary Mckernan
caroline ratcliffe
