options nodate; 
ods noproctitle; 

libname cleaned "C:\Users\niwi8\OneDrive\Documents\Practicum\opioid_prediction\data\cleaned";

* probit modeling for 1999; 

data specified99 unspecified99; 
	set cleaned.poisoning99; 
	if only_unspecified = 0 then output specified99; 
	else if only_unspecified = 1 then output unspecified99; 
run; 

data unspecified99; 
	set unspecified99; 
	drop any_opioid;  
run; 

title "1999: trained model"; 
proc logistic data = specified99 plots = roc outmodel = probitModel_99; 
	class sex race hispanic mar_cat education day place age_cat; 
	model any_opioid (event = "1") = sex | race hispanic mar_cat education day place age_cat
									 poverty_rate percent_hs_drop percent_hs_grad percent_some_col
							         percent_col_grad percent_female_head income pop_density dens_sq phys / link = probit; 
	score out = scoreTrain99; 
run;

proc logistic inmodel = probitModel_99; 
	score data = unspecified99 out = scoreTest99; 
run; 

data scoreTest99;  
	set scoreTest99; 
	any_opioid = input(I_any_opioid, 8.); 
	keep any_opioid; 
run;

data specifiedCounts99; 
	set specified99; 
	keep any_opioid; 
run;  

data correctedCounts99; 
	set specifiedCounts99 scoreTest99; 
run; 

proc freq data = correctedCounts99; 
	table any_opioid; 
run; 

* probit modeling for 2000; 
