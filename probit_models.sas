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

title "Estimated corrected opioid overdoses: 1999"; 
proc freq data = correctedCounts99; 
	table any_opioid; 
run; 

* probit modeling for 2000; 

data specified00 unspecified00; 
	set cleaned.poisoning00; 
	if only_unspecified = 0 then output specified00; 
	else if only_unspecified = 1 then output unspecified00; 
run; 

data unspecified00; 
	set unspecified00; 
	drop any_opioid;  
run; 

title "2000: trained model"; 
proc logistic data = specified00 plots = roc outmodel = probitModel_00; 
	class sex race hispanic mar_cat education day place age_cat; 
	model any_opioid (event = "1") = sex | race hispanic mar_cat education day place age_cat
									 poverty_rate percent_hs_drop percent_hs_grad percent_some_col
							         percent_col_grad percent_female_head income pop_density dens_sq phys / link = probit; 
	score out = scoreTrain00; 
run;

proc logistic inmodel = probitModel_00; 
	score data = unspecified00 out = scoreTest00; 
run; 

data scoreTest00;  
	set scoreTest00; 
	any_opioid = input(I_any_opioid, 8.); 
	keep any_opioid; 
run;

data specifiedCounts00; 
	set specified00; 
	keep any_opioid; 
run;  

data correctedCounts00; 
	set specifiedCounts00 scoreTest00; 
run; 

title "Estimated corrected opioid overdoses: 2000"; 
proc freq data = correctedCounts00; 
	table any_opioid; 
run; 

* probit modeling for 2001; 

data specified01 unspecified01; 
	set cleaned.poisoning01; 
	if only_unspecified = 0 then output specified01; 
	else if only_unspecified = 1 then output unspecified01; 
run; 

data unspecified01; 
	set unspecified01; 
	drop any_opioid;  
run; 

title "2001: trained model"; 
proc logistic data = specified01 plots = roc outmodel = probitModel_01; 
	class sex race hispanic mar_cat education day place age_cat; 
	model any_opioid (event = "1") = sex race age_cat sex*race hispanic mar_cat education day place 
									 poverty_rate percent_hs_drop percent_hs_grad percent_some_col
							         percent_col_grad percent_female_head income pop_density dens_sq phys / link = probit; 
	score out = scoreTrain01; 
run;

proc logistic inmodel = probitModel_01; 
	score data = unspecified01 out = scoreTest01; 
run; 

data scoreTest01;  
	set scoreTest01; 
	any_opioid = input(I_any_opioid, 8.); 
	keep any_opioid; 
run;

data specifiedCounts01; 
	set specified01; 
	keep any_opioid; 
run;  

data correctedCounts01; 
	set specifiedCounts01 scoreTest01; 
run; 

title "Estimated corrected opioid overdoses: 2001"; 
proc freq data = correctedCounts01; 
	table any_opioid; 
run; 

* probit modeling for 2002; 

data specified02 unspecified02; 
	set cleaned.poisoning02; 
	if only_unspecified = 0 then output specified02; 
	else if only_unspecified = 1 then output unspecified02; 
run; 

data unspecified02; 
	set unspecified02; 
	drop any_opioid;  
run; 

title "2002: trained model"; 
proc logistic data = specified02 plots = roc outmodel = probitModel_02; 
	class sex race hispanic mar_cat education day place age_cat; 
	model any_opioid (event = "1") = sex race age_cat sex*race hispanic mar_cat education day place 
									 poverty_rate percent_hs_drop percent_hs_grad percent_some_col
							         percent_col_grad percent_female_head income pop_density dens_sq phys / link = probit; 
	score out = scoreTrain02; 
run;

proc logistic inmodel = probitModel_02; 
	score data = unspecified02 out = scoreTest02; 
run; 

data scoreTest02;  
	set scoreTest02; 
	any_opioid = input(I_any_opioid, 8.); 
	keep any_opioid; 
run;

data specifiedCounts02; 
	set specified02; 
	keep any_opioid; 
run;  

data correctedCounts02; 
	set specifiedCounts02 scoreTest02; 
run; 

title "Estimated corrected opioid overdoses: 2002"; 
proc freq data = correctedCounts02; 
	table any_opioid; 
run; 

* probit modeling for 2003; 

data specified03 unspecified03; 
	set cleaned.poisoning03; 
	if only_unspecified = 0 then output specified03; 
	else if only_unspecified = 1 then output unspecified03; 
run; 

data unspecified03; 
	set unspecified03; 
	drop any_opioid;  
run; 

title "2003: trained model"; 
proc logistic data = specified03 plots = roc outmodel = probitModel_03; 
	class sex race hispanic mar_cat education day place age_cat; 
	model any_opioid (event = "1") = sex race age_cat sex*race hispanic mar_cat education day place 
									 poverty_rate percent_hs_drop percent_hs_grad percent_some_col
							         percent_col_grad percent_female_head income pop_density dens_sq phys / link = probit; 
	score out = scoreTrain03; 
run;

proc logistic inmodel = probitModel_03; 
	score data = unspecified03 out = scoreTest03; 
run; 

data scoreTest03;  
	set scoreTest03; 
	any_opioid = input(I_any_opioid, 8.); 
	keep any_opioid; 
run;

data specifiedCounts03; 
	set specified03; 
	keep any_opioid; 
run;  

data correctedCounts03; 
	set specifiedCounts03 scoreTest03; 
run; 

title "Estimated corrected opioid overdoses: 2003"; 
proc freq data = correctedCounts03; 
	table any_opioid; 
run; 

* probit modeling for 2004; 

data specified04 unspecified04; 
	set cleaned.poisoning04; 
	if only_unspecified = 0 then output specified04; 
	else if only_unspecified = 1 then output unspecified04; 
run; 

data unspecified04; 
	set unspecified04; 
	drop any_opioid;  
run; 

title "2004: trained model"; 
proc logistic data = specified04 plots = roc outmodel = probitModel_04; 
	class sex race hispanic mar_cat education day place age_cat; 
	model any_opioid (event = "1") = sex race age_cat sex*race hispanic mar_cat education day place 
									 poverty_rate percent_hs_drop percent_hs_grad percent_some_col
							         percent_col_grad percent_female_head income pop_density dens_sq phys / link = probit; 
	score out = scoreTrain04; 
run;

proc logistic inmodel = probitModel_04; 
	score data = unspecified04 out = scoreTest04; 
run; 

data scoreTest04;  
	set scoreTest04; 
	any_opioid = input(I_any_opioid, 8.); 
	keep any_opioid; 
run;

data specifiedCounts04; 
	set specified04; 
	keep any_opioid; 
run;  

data correctedCounts04; 
	set specifiedCounts04 scoreTest04; 
run; 

title "Estimated corrected opioid overdoses: 2004"; 
proc freq data = correctedCounts04; 
	table any_opioid; 
run; 

* probit modeling for 2005; 

data specified05 unspecified05; 
	set cleaned.poisoning05; 
	if only_unspecified = 0 then output specified05; 
	else if only_unspecified = 1 then output unspecified05; 
run; 

data unspecified05; 
	set unspecified05; 
	drop any_opioid;  
run; 

title "2005: trained model"; 
proc logistic data = specified05 plots = roc outmodel = probitModel_05; 
	class sex race hispanic mar_cat education day place age_cat; 
	model any_opioid (event = "1") = sex race age_cat sex*race hispanic mar_cat education day place 
									 poverty_rate percent_hs_drop percent_hs_grad percent_some_col
							         percent_col_grad percent_female_head income pop_density dens_sq phys / link = probit; 
	score out = scoreTrain05; 
run;

proc logistic inmodel = probitModel_05; 
	score data = unspecified05 out = scoreTest05; 
run; 

data scoreTest05;  
	set scoreTest05; 
	any_opioid = input(I_any_opioid, 8.); 
	keep any_opioid; 
run;

data specifiedCounts05; 
	set specified05; 
	keep any_opioid; 
run;  

data correctedCounts05; 
	set specifiedCounts05 scoreTest05; 
run; 

title "Estimated corrected opioid overdoses: 2005"; 
proc freq data = correctedCounts05; 
	table any_opioid; 
run; 

* probit modeling for 2006; 

data specified06 unspecified06; 
	set cleaned.poisoning06; 
	if only_unspecified = 0 then output specified06; 
	else if only_unspecified = 1 then output unspecified06; 
run; 

data unspecified06; 
	set unspecified06; 
	drop any_opioid;  
run; 

title "2006: trained model"; 
proc logistic data = specified06 plots = roc outmodel = probitModel_06; 
	class sex race hispanic mar_cat education day place age_cat; 
	model any_opioid (event = "1") = sex race age_cat sex*race hispanic mar_cat education day place 
									 poverty_rate percent_hs_drop percent_hs_grad percent_some_col
							         percent_col_grad percent_female_head income pop_density dens_sq phys / link = probit; 
	score out = scoreTrain06; 
run;

proc logistic inmodel = probitModel_06; 
	score data = unspecified06 out = scoreTest06; 
run; 

data scoreTest06;  
	set scoreTest06; 
	any_opioid = input(I_any_opioid, 8.); 
	keep any_opioid; 
run;

data specifiedCounts06; 
	set specified06; 
	keep any_opioid; 
run;  

data correctedCounts06; 
	set specifiedCounts06 scoreTest06; 
run; 

title "Estimated corrected opioid overdoses: 2006"; 
proc freq data = correctedCounts06; 
	table any_opioid; 
run; 

* probit modeling for 2007; 

data specified07 unspecified07; 
	set cleaned.poisoning07; 
	if only_unspecified = 0 then output specified07; 
	else if only_unspecified = 1 then output unspecified07; 
run; 

data unspecified07; 
	set unspecified07; 
	drop any_opioid;  
run; 

title "2007: trained model"; 
proc logistic data = specified07 plots = roc outmodel = probitModel_07; 
	class sex race hispanic mar_cat education day place age_cat; 
	model any_opioid (event = "1") = sex race age_cat sex*race hispanic mar_cat education day place 
									 poverty_rate percent_hs_drop percent_hs_grad percent_some_col
							         percent_col_grad percent_female_head income pop_density dens_sq phys / link = probit; 
	score out = scoreTrain07; 
run;

proc logistic inmodel = probitModel_07; 
	score data = unspecified07 out = scoreTest07; 
run; 

data scoreTest07;  
	set scoreTest07; 
	any_opioid = input(I_any_opioid, 8.); 
	keep any_opioid; 
run;

data specifiedCounts07; 
	set specified07; 
	keep any_opioid; 
run;  

data correctedCounts07; 
	set specifiedCounts07 scoreTest07; 
run; 

title "Estimated corrected opioid overdoses: 2007"; 
proc freq data = correctedCounts07; 
	table any_opioid; 
run; 

* probit modeling for 2008; 

data specified08 unspecified08; 
	set cleaned.poisoning08; 
	if only_unspecified = 0 then output specified08; 
	else if only_unspecified = 1 then output unspecified08; 
run; 

data unspecified08; 
	set unspecified08; 
	drop any_opioid;  
run; 

title "2008: trained model"; 
proc logistic data = specified08 plots = roc outmodel = probitModel_08; 
	class sex race hispanic mar_cat education day place age_cat; 
	model any_opioid (event = "1") = sex race age_cat sex*race hispanic mar_cat education day place 
									 poverty_rate percent_hs_drop percent_hs_grad percent_some_col
							         percent_col_grad percent_female_head income pop_density dens_sq phys / link = probit; 
	score out = scoreTrain08; 
run;

proc logistic inmodel = probitModel_08; 
	score data = unspecified08 out = scoreTest08; 
run; 

data scoreTest08;  
	set scoreTest08; 
	any_opioid = input(I_any_opioid, 8.); 
	keep any_opioid; 
run;

data specifiedCounts08; 
	set specified08; 
	keep any_opioid; 
run;  

data correctedCounts08; 
	set specifiedCounts08 scoreTest08; 
run; 

title "Estimated corrected opioid overdoses: 2008"; 
proc freq data = correctedCounts08; 
	table any_opioid; 
run; 

* probit modeling for 2009; 

data specified09 unspecified09; 
	set cleaned.poisoning09; 
	if only_unspecified = 0 then output specified09; 
	else if only_unspecified = 1 then output unspecified09; 
run; 

data unspecified09; 
	set unspecified09; 
	drop any_opioid;  
run; 

title "2009: trained model"; 
proc logistic data = specified09 plots = roc outmodel = probitModel_09; 
	class sex race hispanic mar_cat education day place age_cat; 
	model any_opioid (event = "1") = sex race age_cat sex*race hispanic mar_cat education day place 
									 poverty_rate percent_hs_drop percent_hs_grad percent_some_col
							         percent_col_grad percent_female_head income pop_density dens_sq phys / link = probit; 
	score out = scoreTrain09; 
run;

proc logistic inmodel = probitModel_09; 
	score data = unspecified09 out = scoreTest09; 
run; 

data scoreTest09;  
	set scoreTest09; 
	any_opioid = input(I_any_opioid, 8.); 
	keep any_opioid; 
run;

data specifiedCounts09; 
	set specified09; 
	keep any_opioid; 
run;  

data correctedCounts09; 
	set specifiedCounts09 scoreTest09; 
run; 

title "Estimated corrected opioid overdoses: 2009"; 
proc freq data = correctedCounts09; 
	table any_opioid; 
run; 

* probit modeling for 2010; 

data specified10 unspecified10; 
	set cleaned.poisoning10; 
	if only_unspecified = 0 then output specified10; 
	else if only_unspecified = 1 then output unspecified10; 
run; 

data unspecified10; 
	set unspecified10; 
	drop any_opioid;  
run; 

title "2010: trained model"; 
proc logistic data = specified10 plots = roc outmodel = probitModel_10; 
	class sex race hispanic mar_cat education day place age_cat; 
	model any_opioid (event = "1") = sex race age_cat sex*race hispanic mar_cat education day place 
									 poverty_rate percent_hs_drop percent_hs_grad percent_some_col
							         percent_col_grad percent_female_head income pop_density dens_sq phys / link = probit; 
	score out = scoreTrain10; 
run;

proc logistic inmodel = probitModel_10; 
	score data = unspecified10 out = scoreTest10; 
run; 

data scoreTest10;  
	set scoreTest10; 
	any_opioid = input(I_any_opioid, 8.); 
	keep any_opioid; 
run;

data specifiedCounts10; 
	set specified10; 
	keep any_opioid; 
run;  

data correctedCounts10; 
	set specifiedCounts10 scoreTest10; 
run; 

title "Estimated corrected opioid overdoses: 2010"; 
proc freq data = correctedCounts10; 
	table any_opioid; 
run; 

* probit modeling for 2011; 

data specified11 unspecified11; 
	set cleaned.poisoning11; 
	if only_unspecified = 0 then output specified11; 
	else if only_unspecified = 1 then output unspecified11; 
run; 

data unspecified11; 
	set unspecified11; 
	drop any_opioid;  
run; 

title "2011: trained model"; 
proc logistic data = specified11 plots = roc outmodel = probitModel_11; 
	class sex race hispanic mar_cat education day place age_cat; 
	model any_opioid (event = "1") = sex race age_cat sex*race hispanic mar_cat education day place 
									 poverty_rate percent_hs_drop percent_hs_grad percent_some_col
							         percent_col_grad percent_female_head income pop_density dens_sq phys / link = probit; 
	score out = scoreTrain11; 
run;

proc logistic inmodel = probitModel_11; 
	score data = unspecified11 out = scoreTest11; 
run; 

data scoreTest11;  
	set scoreTest11; 
	any_opioid = input(I_any_opioid, 8.); 
	keep any_opioid; 
run;

data specifiedCounts11; 
	set specified11; 
	keep any_opioid; 
run;  

data correctedCounts11; 
	set specifiedCounts11 scoreTest11; 
run; 

title "Estimated corrected opioid overdoses: 2011"; 
proc freq data = correctedCounts11; 
	table any_opioid; 
run; 

* probit modeling for 2012; 

data specified12 unspecified12; 
	set cleaned.poisoning12; 
	if only_unspecified = 0 then output specified12; 
	else if only_unspecified = 1 then output unspecified12; 
run; 

data unspecified12; 
	set unspecified12; 
	drop any_opioid;  
run; 

title "2012: trained model"; 
proc logistic data = specified12 plots = roc outmodel = probitModel_12; 
	class sex race hispanic mar_cat education day place age_cat; 
	model any_opioid (event = "1") = sex race age_cat sex*race hispanic mar_cat education day place 
									 poverty_rate percent_hs_drop percent_hs_grad percent_some_col
							         percent_col_grad percent_female_head income pop_density dens_sq phys / link = probit; 
	score out = scoreTrain12; 
run;

proc logistic inmodel = probitModel_12; 
	score data = unspecified12 out = scoreTest12; 
run; 

data scoreTest12;  
	set scoreTest12; 
	any_opioid = input(I_any_opioid, 8.); 
	keep any_opioid; 
run;

data specifiedCounts12; 
	set specified12; 
	keep any_opioid; 
run;  

data correctedCounts12; 
	set specifiedCounts12 scoreTest12; 
run; 

title "Estimated corrected opioid overdoses: 2012"; 
proc freq data = correctedCounts12; 
	table any_opioid; 
run; 

* probit modeling for 2013; 

data specified13 unspecified13; 
	set cleaned.poisoning13; 
	if only_unspecified = 0 then output specified13; 
	else if only_unspecified = 1 then output unspecified13; 
run; 

data unspecified13; 
	set unspecified13; 
	drop any_opioid;  
run; 

title "2013: trained model"; 
proc logistic data = specified13 plots = roc outmodel = probitModel_13; 
	class sex race hispanic mar_cat education day place age_cat; 
	model any_opioid (event = "1") = sex race age_cat sex*race hispanic mar_cat education day place 
									 poverty_rate percent_hs_drop percent_hs_grad percent_some_col
							         percent_col_grad percent_female_head income pop_density dens_sq phys / link = probit; 
	score out = scoreTrain13; 
run;

proc logistic inmodel = probitModel_13; 
	score data = unspecified13 out = scoreTest13; 
run; 

data scoreTest13;  
	set scoreTest13; 
	any_opioid = input(I_any_opioid, 8.); 
	keep any_opioid; 
run;

data specifiedCounts13; 
	set specified13; 
	keep any_opioid; 
run;  

data correctedCounts13; 
	set specifiedCounts13 scoreTest13; 
run; 

title "Estimated corrected opioid overdoses: 2013"; 
proc freq data = correctedCounts13; 
	table any_opioid; 
run; 

* probit modeling for 2014; 

data specified14 unspecified14; 
	set cleaned.poisoning14; 
	if only_unspecified = 0 then output specified14; 
	else if only_unspecified = 1 then output unspecified14; 
run; 

data unspecified14; 
	set unspecified14; 
	drop any_opioid;  
run; 

title "2014: trained model"; 
proc logistic data = specified14 plots = roc outmodel = probitModel_14; 
	class sex race hispanic mar_cat education day place age_cat; 
	model any_opioid (event = "1") = sex race age_cat sex*race hispanic mar_cat education day place 
									 poverty_rate percent_hs_drop percent_hs_grad percent_some_col
							         percent_col_grad percent_female_head income pop_density dens_sq phys / link = probit; 
	score out = scoreTrain14; 
run;

proc logistic inmodel = probitModel_14; 
	score data = unspecified14 out = scoreTest14; 
run; 

data scoreTest14;  
	set scoreTest14; 
	any_opioid = input(I_any_opioid, 8.); 
	keep any_opioid; 
run;

data specifiedCounts14; 
	set specified14; 
	keep any_opioid; 
run;  

data correctedCounts14; 
	set specifiedCounts14 scoreTest14; 
run; 

title "Estimated corrected opioid overdoses: 2014"; 
proc freq data = correctedCounts14; 
	table any_opioid; 
run; 

* probit modeling for 2015; 

data specified15 unspecified15; 
	set cleaned.poisoning15; 
	if only_unspecified = 0 then output specified15; 
	else if only_unspecified = 1 then output unspecified15; 
run; 

data unspecified15; 
	set unspecified15; 
	drop any_opioid;  
run; 

title "2015: trained model"; 
proc logistic data = specified15 plots = roc outmodel = probitModel_15; 
	class sex race hispanic mar_cat education day place age_cat; 
	model any_opioid (event = "1") = sex race age_cat sex*race hispanic mar_cat education day place 
									 poverty_rate percent_hs_drop percent_hs_grad percent_some_col
							         percent_col_grad percent_female_head income pop_density dens_sq phys / link = probit; 
	score out = scoreTrain15; 
run;

proc logistic inmodel = probitModel_15; 
	score data = unspecified15 out = scoreTest15; 
run; 

data scoreTest15;  
	set scoreTest15; 
	any_opioid = input(I_any_opioid, 8.); 
	keep any_opioid; 
run;

data specifiedCounts15; 
	set specified15; 
	keep any_opioid; 
run;  

data correctedCounts15; 
	set specifiedCounts15 scoreTest15; 
run; 

title "Estimated corrected opioid overdoses: 2015"; 
proc freq data = correctedCounts15; 
	table any_opioid; 
run; 

* probit modeling for 2016; 

data specified16 unspecified16; 
	set cleaned.poisoning16; 
	if only_unspecified = 0 then output specified16; 
	else if only_unspecified = 1 then output unspecified16; 
run; 

data unspecified16; 
	set unspecified16; 
	drop any_opioid;  
run; 

title "2016: trained model"; 
proc logistic data = specified16 plots = roc outmodel = probitModel_16; 
	class sex race hispanic mar_cat education day place age_cat; 
	model any_opioid (event = "1") = sex race age_cat sex*race hispanic mar_cat education day place 
									 poverty_rate percent_hs_drop percent_hs_grad percent_some_col
							         percent_col_grad percent_female_head income pop_density dens_sq phys / link = probit; 
	score out = scoreTrain16; 
run;

proc logistic inmodel = probitModel_16; 
	score data = unspecified16 out = scoreTest16; 
run; 

data scoreTest16;  
	set scoreTest16; 
	any_opioid = input(I_any_opioid, 8.); 
	keep any_opioid; 
run;

data specifiedCounts16; 
	set specified16; 
	keep any_opioid; 
run;  

data correctedCounts16; 
	set specifiedCounts16 scoreTest16; 
run; 

title "Estimated corrected opioid overdoses: 2016"; 
proc freq data = correctedCounts16; 
	table any_opioid; 
run; 
