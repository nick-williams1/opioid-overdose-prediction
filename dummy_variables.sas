
* creating dummy for variables for SVM models in R; 

libname cleaned "C:\Users\niwi8\OneDrive - cumc.columbia.edu\Practicum\opioid_prediction\data\cleaned";

data cleaned.all_poisoning_county; 
	set cleaned.all_poisoning_county; 
	
	if sex = "M" then sex_dummy = 1; 
		else sex_dummy = 0; 

	if race = "white" then race1 = 1; 
		else race1 = 0; 
	if race = "black" then race2 = 1; 
		else race2 = 0; 

	if mar_cat = "Married" then mar_dummy = 1; 
		else mar_dummy = 0; 

	if education = "hs_drop" then educ1 = 1; 
		else educ1 = 0; 
	if education = "hs_grad" then educ2 = 1; 
		else educ2 = 0; 
	if education = "some_co" then educ3 = 1; 
		else educ3 = 0; 
	if education = "college" then educ4 = 1; 
		else educ4 = 0; 

	if age_cat = "<31" then age1 = 1; 
		else age1 = 0; 
	if age_cat = "31-40" then age2 = 1; 
		else age2 = 0; 
	if age_cat = "41-50" then age3 = 1; 
		else age3 = 0; 
	if age_cat = "51-60" then age4 = 1; 
		else age4 = 0; 
	if age_cat = "61-70" then age5 = 1; 
		else age5 = 0; 
	if age_cat = "71-80" then age6 = 1; 
		else age6 = 0; 

	if day = 1 then day1 = 1; 
		else day1 = 0; 
	if day = 2 then day2 = 1; 
		else day2 = 0; 
	if day = 3 then day3 = 1; 
		else day3 = 0; 
	if day = 4 then day4 = 1; 
		else day4 = 0; 
	if day = 5 then day5 = 1; 
		else day5 = 0; 
	if day = 6 then day6 = 1; 
		else day6 = 0; 
	if day = 7 then day7 = 1; 
		else day7 = 0; 

	if place = "home" then place1 = 1; 
		else place1 = 0; 
	if place = "hospital_DOA" then place2 = 1; 
		else place2 = 0; 
	if place = "hospital_inpatient" then place3 = 1; 
		else place3 = 0; 
	if place = "hospital_outpatien" then place4 = 1; 
		else place4 = 0; 
run; 
