options nodate; 
ods noproctitle; 
 
libname opioid "C:\Users\niwi8\OneDrive\Documents\Practicum\opioid_prediction\data";
libname cleaned "C:\Users\niwi8\OneDrive\Documents\Practicum\opioid_prediction\data\cleaned";

data mortality_99_02; 
	set opioid.mortality99 opioid.mortality00 opioid.mortality01 opioid.mortality02; 

	if residence = 4 then delete; 
	drop residence; 

	if sex = 1 then sex_recode = "M"; 
		else if sex = 2 then sex_recode = "F"; 
		drop sex; 
		rename sex_recode = sex; 

	if marital = 1 then marital_status = "S"; 
		else if marital = 2 then marital_status = "M"; 
		else if marital = 3 then marital_status = "W"; 
		else if marital = 4 then marital_status = "D"; 
		else if marital = 8 then marital_status = "N"; 
		else if marital = 9 then marital_status = "U";
		drop marital;  

	rename icd9 = icd10; 

	if age_1 = 0 then age = age_2; 
		else if age_1 = 1 then age = age_2 + 100; 
		if 2 =< age_1 <= 6 then age = 0; 
		drop age_1 age_2; 

	if education <= 11 then educ = "hs_drop"; 
		else if education = 12 then educ = "hs_grad"; 
		else if 13 =< education <= 15 then educ = "some_college"; 
		else if education = 16 or education = 17 then educ = "college_grad"; 
		else educ = "unknown"; 
		drop education; 
		rename educ = education; 

	if race = 1 then race_code = "white"; 
		else if race = 2 then race_code = "other"; 
		else if race = 3 then race_code = "black"; 
		drop race; 
		rename race_code = race; 
run; 

data mortality_03_16; 
	set opioid.mortality04 opioid.mortality05 opioid.mortality06 opioid.mortality07 opioid.mortality08
		opioid.mortality09 opioid.mortality10 opioid.mortality11 opioid.mortality12 opioid.mortality13
		opioid.mortality14 opioid.mortality15 opioid.mortality16; 

	if residence = 4 then delete; 
	drop residence; 

	if age_1 = 1 then age = age_2; 
		else if 2 =< age_1 <= 6 then age = 0; 
		drop age_1 age_2; 

	if educ_flag = 0 and educ_1 <= 11 then education = "hs_drop"; 
		else if educ_flag = 0 and educ_1 = 12 then education = "hs_grad"; 
		else if educ_flag = 0 and 13 =< educ_1 <= 15 then education = "some_college"; 
		else if educ_flag = 0 and (educ_1 = 16 or educ_1 = 17) then education = "college_grad"; 
		else if educ_flag = 1 and educ_2 <= 2 then education = "hs_drop"; 
		else if educ_flag = 1 and educ_2 = 3 then education = "hs_grad"; 
		else if educ_flag = 1 and (educ_2 = 4 or educ_2 = 5) then education = "some_college"; 
		else if educ_flag = 1 and 6 =< educ_2 <= 8 then education = "college_grad"; 
		else education = "unknown"; 
		drop educ_1 educ_2 educ_flag;

	if race = 1 then race_code = "white"; 
		else if race = 2 then race_code = "other"; 
		else if race = 3 then race_code = "black"; 
		drop race; 
		rename race_code = race; 
run; 

* adding state code to years 03 to 06 and other cleaning; 

data mortality_03_16; 
	retain state county_fips year age sex race hispanic education marital_status month day place; 
	set mortality_03_16; 

	if state_name = "AK" then state = 02; 
	if state_name = "AL" then state = 01; 
	if state_name = "AR" then state = 05; 
	if state_name = "AZ" then state = 04; 
	if state_name = "CA" then state = 06; 
	if state_name = "CO" then state = 08; 
	if state_name = "CT" then state = 09; 
	if state_name = "DC" then state = 11; 
	if state_name = "DE" then state = 10; 
	if state_name = "FL" then state = 12; 
	if state_name = "GA" then state = 13; 
	if state_name = "HI" then state = 15; 
	if state_name = "IA" then state = 19; 
	if state_name = "ID" then state = 16; 
	if state_name = "IL" then state = 17; 
	if state_name = "IN" then state = 18; 
	if state_name = "KS" then state = 20; 
	if state_name = "KY" then state = 21; 
	if state_name = "LA" then state = 22; 
	if state_name = "MA" then state = 25; 
	if state_name = "MD" then state = 24; 
	if state_name = "ME" then state = 23; 
	if state_name = "MI" then state = 26; 
	if state_name = "MN" then state = 27; 
	if state_name = "MO" then state = 29; 
	if state_name = "MS" then state = 28; 
	if state_name = "MT" then state = 30; 
	if state_name = "NC" then state = 37; 
	if state_name = "ND" then state = 38; 
	if state_name = "NE" then state = 31; 
	if state_name = "NH" then state = 33; 
	if state_name = "NJ" then state = 34; 
	if state_name = "NM" then state = 35; 
	if state_name = "NV" then state = 32; 
	if state_name = "NY" then state = 36; 
	if state_name = "OH" then state = 39; 
	if state_name = "OK" then state = 40; 
	if state_name = "OR" then state = 41; 
	if state_name = "PA" then state = 42; 
	if state_name = "RI" then state = 44; 
	if state_name = "SC" then state = 45; 
	if state_name = "SD" then state = 46; 
	if state_name = "TN" then state = 47; 
	if state_name = "TX" then state = 48; 
	if state_name = "UT" then state = 49; 
	if state_name = "VA" then state = 51; 
	if state_name = "VT" then state = 50; 
	if state_name = "WA" then state = 53; 
	if state_name = "WI" then state = 55; 
	if state_name = "WV" then state = 54; 
	if state_name = "WY" then state = 56; 

	drop state_name; 
	drop autopsy;
run; 

* rearranging 99 to 02; 

data mortality_99_02; 
	retain state county_fips year age sex race hispanic education marital_status month day place; 
	set mortality_99_02; 
run; 

* stacking 99 to 02 and 03 to 16 and removing non-relevant deaths / other cleaning; 

data all_poisoning; 
	set mortality_99_02 mortality_03_16; 

	if icd10 = "X40" or icd10 = "X41" or icd10 = "X42" or icd10 = "X43" 
	   or icd10 = "X44" or icd10 = "X60" or icd10 = "X61" or icd10 = "X62" 
	   or icd10 = "X63" or icd10 = "X64" or icd10 = "X85" or icd10 = "Y10" 
	   or icd10 = "Y11" or icd10 = "Y12" or icd10 = "Y13" or icd10 = "Y14"; 
	
	county = (state * 1000) + county_fips; 
	drop county_fips; 
run; 

data all_poisoning; 
	retain state county year;  
	set all_poisoning; 

	if 1 =< hispanic <= 5 then hispanic = 1; 
		else if 6 =< hispanic <= 9 then hispanic = 0; 

	if place = 1 then place_code = "hospital_inpatient"; 
		else if place = 2 then place_code = "hospital_outpatient"; 
		else if place = 3 then place_code = "hospital_DOA"; 
		else if (place = 4 and year >= 2003) or (place = 6 and year < 2003) then place_code = "home"; 
		else place_code = "other"; 
		drop place; 
		rename place_code = place;  
run;

data all_poisoning;
	retain state county year age sex race hispanic education marital_status month day place; 
	set all_poisoning; 
run; 

* creating specific drug related variables; 

data all_poisoning; 
	set all_poisoning; 

	narcotic = 0; 
	any_opioid = 0; 
	opioid_anal = 0; 
	heroin = 0; 
	natural_opioid = 0; 
	meth = 0; 
	synthetic_opioid = 0; 
	opioid_anal_nonMethodone = 0; 
	cocaine = 0; 
	other_narcotic = 0; 
	non_opioid_analgesic = 0; 
	sedative = 0; 
	benzo = 0; 
	other_sed = 0; 
	psy_tropic = 0; 
	anti_depress = 0; 
	anti_psych = 0; 
	psych_stim = 0; 
	unspecified = 0; 
	other_drug = 0; 
	alcohol = 0; 
	ethanol = 0; 

	array rec_array {*} $ rec1 - rec20; 
	do i = 1 to dim(rec_array); 
		if rec_array{i} in ("T400", "T401", "T402", "T403", "T404", "T405", "T406", "T407", "T408", "T409")
			then narcotic = 1; 

		if rec_array{i} in ("T400", "T401", "T402", "T403", "T404", "T406")
			then any_opioid = 1; 

		if rec_array{i} in ("T402", "T403", "T404")
			then opioid_anal = 1; 

		if rec_array{i} = "T401"
			then heroin = 1; 

		if rec_array{i} = "T402" 
			then natural_opioid = 1; 

		if rec_array{i} = "T403" 
			then meth = 1; 

		if rec_array{i} = "T404"
			then synthetic_opioid = 1; 

		if rec_array{i} in ("T402", "T404") 
			then opioid_anal_nonMethodone = 1; 

		if rec_array{i} = "T405" 
			then cocaine = 1; 

		if rec_array{i} in ("T406", "T407", "T408", "T409", "T400")
			then other_narcotic = 1; 

		if rec_array{i} in ("T400", "T401", "T405", "T406", "T407", "T408", "T409")
			then non_opioid_analgesic = 1; 

		if rec_array{i} in ("T420", "T421", "T422", "T423", "T424", "T425", "T426", "T427", "T428")
			then sedative = 1; 

		if rec_array{i} = "T424"
			then benzo = 1; 

		if rec_array{i} in ("T420", "T421", "T422", "T423", "T425", "T426", "T427", "T428")
			then other_sed = 1;

		if rec_array{i} in ("T430", "T431", "T432", "T433", "T434", "T435", "T436", "T437", "T438", "T439")
			then psy_tropic = 1; 

		if rec_array{i} in ("T430", "T431", "T432")
			then anti_depress = 1;

		if rec_array{i} in ("T433", "T434", "T435")
			then anti_psych = 1; 

		if rec_array{i} = "T436"
			then psych_stim = 1; 

		if rec_array{i} = "T509" 
			then unspecified = 1; 

		if rec_array{i} in ("T510", "T511", "T512", "T513", "T514")
			then alcohol = 1; 

		if rec_array{i} = "T510"
			then ethanol = 1;

		if rec_array{i} in ("T360", "T361", "T362", "T363", "T364", "T365", "T366", "T367", "T368", "T369", 
							"T370", "T371", "T372", "T373", "T374", "T375", "T376", "T377", "T378", "T379", 
							"T380", "T381", "T382", "T383", "T384", "T385", "T386", "T387", "T388", "T389", 
							"T410", "T411", "T412", "T413", "T414", "T415", "T416", "T417", "T418", "T419", 
							"T440", "T441", "T442", "T443", "T444", "T445", "T446", "T447", "T448", "T449", 
							"T450", "T451", "T452", "T453", "T454", "T455", "T456", "T457", "T458", "T459", 
							"T460", "T461", "T462", "T463", "T464", "T465", "T466", "T467", "T468", "T469", 
							"T470", "T471", "T472", "T473", "T474", "T475", "T476", "T477", "T478", "T479", 
							"T480", "T481", "T482", "T482", "T484", "T485", "T486", "T487", "T490", "T491", 
							"T492", "T493", "T494", "T495", "T496", "T497", "T498", "T499", "T500", "T501", 
							"T502", "T503", "T504", "T505", "T506", "T507", "T508")
			then other_drug = 1; 
	end;
	drop i;  
run; 

* creating variable that identifies deaths where no drug has been specified in poisoning; 

data cleaned.all_poisoning; 
	set all_poisoning; 
	if (any_opioid = 0 and non_opioid_analgesic = 0 and sedative = 0 
		and psy_tropic = 0 and other_drug = 0 and unspecified = 1) 
		then only_unspecified = 1; 
		else only_unspecified = 0; 
run; 
 
