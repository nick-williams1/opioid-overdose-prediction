ods noproctitle; 
options nodate; 

libname raw "C:\Users\niwi8\OneDrive\Documents\Practicum\opioid_prediction\data\raw";

* importing 1999 - 2002 data; 

data raw.mortality99; 
	infile "C:\Users\niwi8\OneDrive\Documents\Practicum\opioid_prediction\data\extracted\1999\Mort99p2";
	input @20 residence 1.
		  @52 education 2.
		  @55 month 2.
		  @59 sex 1.
		  @62 race 1.
		  @64 age_1 1.
		  @65 age_2 2.
		  @75 place 1.
		  @77 marital 1.
		  @82 hispanic 1.
		  @83 day 1.
		  @124 state 2.
		  @126 county_fips 3.
		  @142 icd9 $4.
		  @151 recode113 3.
		  @338 numcond 2.
		  @341 rec1 $5.
		  @346 rec2 $5.
		  @351 rec3 $5.
		  @356 rec4 $5.
		  @361 rec5 $5.
		  @366 rec6 $5.
		  @371 rec7 $5.
		  @376 rec8 $5.
		  @381 rec9 $5.
		  @386 rec10 $5.
		  @391 rec11 $5.
		  @396 rec12 $5.
		  @401 rec13 $5.
		  @406 rec14 $5.
		  @411 rec15 $5.
		  @416 rec16 $5.
		  @421 rec17 $5.
		  @426 rec18 $5.
		  @431 rec19 $5.
		  @436 rec20 $5.;
	year = 1999; 
run; 

data raw.mortality00; 
	infile "C:\Users\niwi8\OneDrive\Documents\Practicum\opioid_prediction\data\extracted\2000\MORT00US.PT2" truncover;
	input @20 residence 1.
		  @52 education 2.
		  @55 month 2.
		  @59 sex 1.
		  @62 race 1.
		  @64 age_1 1.
		  @65 age_2 2.
		  @75 place 1.
		  @77 marital 1.
		  @82 hispanic 1.
		  @83 day 1.
		  @124 state 2.
		  @126 county_fips 3.
		  @142 icd9 $4.
		  @151 recode113 3.
		  @338 numcond 2.
		  @341 rec1 $5.
		  @346 rec2 $5.
		  @351 rec3 $5.
		  @356 rec4 $5.
		  @361 rec5 $5.
		  @366 rec6 $5.
		  @371 rec7 $5.
		  @376 rec8 $5.
		  @381 rec9 $5.
		  @386 rec10 $5.
		  @391 rec11 $5.
		  @396 rec12 $5.
		  @401 rec13 $5.
		  @406 rec14 $5.
		  @411 rec15 $5.
		  @416 rec16 $5.
		  @421 rec17 $5.
		  @426 rec18 $5.
		  @431 rec19 $5.
		  @436 rec20 $5.;
	year = 2000; 
run; 

data raw.mortality01; 
	infile "C:\Users\niwi8\OneDrive\Documents\Practicum\opioid_prediction\data\extracted\2001\Mort01us.dat";
	input @20 residence 1.
		  @52 education 2.
		  @55 month 2.
		  @59 sex 1.
		  @62 race 1.
		  @64 age_1 1.
		  @65 age_2 2.
		  @75 place 1.
		  @77 marital 1.
		  @82 hispanic 1.
		  @83 day 1.
		  @124 state 2.
		  @126 county_fips 3.
		  @142 icd9 $4.
		  @151 recode113 3.
		  @338 numcond 2.
		  @341 rec1 $5.
		  @346 rec2 $5.
		  @351 rec3 $5.
		  @356 rec4 $5.
		  @361 rec5 $5.
		  @366 rec6 $5.
		  @371 rec7 $5.
		  @376 rec8 $5.
		  @381 rec9 $5.
		  @386 rec10 $5.
		  @391 rec11 $5.
		  @396 rec12 $5.
		  @401 rec13 $5.
		  @406 rec14 $5.
		  @411 rec15 $5.
		  @416 rec16 $5.
		  @421 rec17 $5.
		  @426 rec18 $5.
		  @431 rec19 $5.
		  @436 rec20 $5.;
	year = 2001; 
run; 

data raw.mortality02; 
	infile "C:\Users\niwi8\OneDrive\Documents\Practicum\opioid_prediction\data\extracted\2002\Mort02us.dat";
	input @20 residence 1.
		  @52 education 2.
		  @55 month 2.
		  @59 sex 1.
		  @62 race 1.
		  @64 age_1 1.
		  @65 age_2 2.
		  @75 place 1.
		  @77 marital 1.
		  @82 hispanic 1.
		  @83 day 1.
		  @124 state 2.
		  @126 county_fips 3.
		  @142 icd9 $4.
		  @151 recode113 3.
		  @338 numcond 2.
		  @341 rec1 $5.
		  @346 rec2 $5.
		  @351 rec3 $5.
		  @356 rec4 $5.
		  @361 rec5 $5.
		  @366 rec6 $5.
		  @371 rec7 $5.
		  @376 rec8 $5.
		  @381 rec9 $5.
		  @386 rec10 $5.
		  @391 rec11 $5.
		  @396 rec12 $5.
		  @401 rec13 $5. 
		  @406 rec14 $5.
		  @411 rec15 $5.
		  @416 rec16 $5.
		  @421 rec17 $5.
		  @426 rec18 $5.
		  @431 rec19 $5.
		  @436 rec20 $5.;
	year = 2002; 
run; 


* importing 2003 - 2016 data; 

data raw.mortality03; 
	infile "C:\Users\niwi8\OneDrive\Documents\Practicum\opioid_prediction\data\extracted\2003\Mult03us.dat"; 
	input @20 residence 1.
		  @29 state_name $2.
		  @35 county_fips 3.
		  @61 educ_1 2.
		  @63 educ_2 1.
		  @64 educ_flag 1.
		  @65 month 2.
		  @69 sex $1.
		  @70 age_1 1.
		  @71 age_2 3. 
		  @83 place 1.
		  @84 marital_status $1.
		  @85 day 1.
		  @109 autopsy $1.
		  @146 icd10 $4.
		  @154 recode113 3.
		  @341 numcond 2.
		  @449 race 1.
		  @488 hispanic 1.
		  @344 rec1 $5.
		  @349 rec2 $5.
		  @354 rec3 $5.
		  @359 rec4 $5.
		  @364 rec5 $5.
		  @369 rec6 $5.
		  @374 rec7 $5.
		  @379 rec8 $5.
		  @384 rec9 $5.
		  @389 rec10 $5.
		  @394 rec11 $5.
		  @399 rec12 $5.
		  @404 rec13 $5. 
		  @409 rec14 $5.
		  @414 rec15 $5.
		  @419 rec16 $5.
		  @424 rec17 $5.
		  @429 rec18 $5.
		  @434 rec19 $5.
		  @439 rec20 $5.;
	year = 2003; 
run; 

data raw.mortality04; 
	infile "C:\Users\niwi8\OneDrive\Documents\Practicum\opioid_prediction\data\extracted\2004\Mort04us.dat"; 
	input @20 residence 1.
		  @29 state_name $2.
		  @35 county_fips 3.
		  @61 educ_1 2.
		  @63 educ_2 1.
		  @64 educ_flag 1.
		  @65 month 2.
		  @69 sex $1.
		  @70 age_1 1.
		  @71 age_2 3. 
		  @83 place 1.
		  @84 marital_status $1.
		  @85 day 1.
		  @109 autopsy $1.
		  @146 icd10 $4.
		  @154 recode113 3.
		  @341 numcond 2.
		  @449 race 1.
		  @488 hispanic 1.
		  @344 rec1 $5.
		  @349 rec2 $5.
		  @354 rec3 $5.
		  @359 rec4 $5.
		  @364 rec5 $5.
		  @369 rec6 $5.
		  @374 rec7 $5.
		  @379 rec8 $5.
		  @384 rec9 $5.
		  @389 rec10 $5.
		  @394 rec11 $5.
		  @399 rec12 $5.
		  @404 rec13 $5. 
		  @409 rec14 $5.
		  @414 rec15 $5.
		  @419 rec16 $5.
		  @424 rec17 $5.
		  @429 rec18 $5.
		  @434 rec19 $5.
		  @439 rec20 $5.;
	year = 2004; 
run;

data raw.mortality05; 
	infile "C:\Users\niwi8\OneDrive\Documents\Practicum\opioid_prediction\data\extracted\2005\Mort05usp2.dat"; 
	input @20 residence 1.
		  @29 state_name $2.
		  @35 county_fips 3.
		  @61 educ_1 2.
		  @63 educ_2 1.
		  @64 educ_flag 1.
		  @65 month 2.
		  @69 sex $1.
		  @70 age_1 1.
		  @71 age_2 3. 
		  @83 place 1.
		  @84 marital_status $1.
		  @85 day 1.
		  @109 autopsy $1.
		  @146 icd10 $4.
		  @154 recode113 3.
		  @341 numcond 2.
		  @449 race 1.
		  @488 hispanic 1.
		  @344 rec1 $5.
		  @349 rec2 $5.
		  @354 rec3 $5.
		  @359 rec4 $5.
		  @364 rec5 $5.
		  @369 rec6 $5.
		  @374 rec7 $5.
		  @379 rec8 $5.
		  @384 rec9 $5.
		  @389 rec10 $5.
		  @394 rec11 $5.
		  @399 rec12 $5.
		  @404 rec13 $5. 
		  @409 rec14 $5.
		  @414 rec15 $5.
		  @419 rec16 $5.
		  @424 rec17 $5.
		  @429 rec18 $5.
		  @434 rec19 $5.
		  @439 rec20 $5.;
	year = 2005; 
run;

data raw.mortality06; 
	infile "C:\Users\niwi8\OneDrive\Documents\Practicum\opioid_prediction\data\extracted\2006\MULT2006.uspart2"; 
	input @20 residence 1.
		  @29 state_name $2.
		  @35 county_fips 3.
		  @61 educ_1 2.
		  @63 educ_2 1.
		  @64 educ_flag 1.
		  @65 month 2.
		  @69 sex $1.
		  @70 age_1 1.
		  @71 age_2 3. 
		  @83 place 1.
		  @84 marital_status $1.
		  @85 day 1.
		  @109 autopsy $1.
		  @146 icd10 $4.
		  @154 recode113 3.
		  @341 numcond 2.
		  @449 race 1.
		  @488 hispanic 1.
		  @344 rec1 $5.
		  @349 rec2 $5.
		  @354 rec3 $5.
		  @359 rec4 $5.
		  @364 rec5 $5.
		  @369 rec6 $5.
		  @374 rec7 $5.
		  @379 rec8 $5.
		  @384 rec9 $5.
		  @389 rec10 $5.
		  @394 rec11 $5.
		  @399 rec12 $5.
		  @404 rec13 $5. 
		  @409 rec14 $5.
		  @414 rec15 $5.
		  @419 rec16 $5.
		  @424 rec17 $5.
		  @429 rec18 $5.
		  @434 rec19 $5.
		  @439 rec20 $5.;
	year = 2006; 
run;

data raw.mortality07; 
	infile "C:\Users\niwi8\OneDrive\Documents\Practicum\opioid_prediction\data\extracted\2007\MULT2007.uspart2"; 
	input @20 residence 1.
		  @29 state_name $2.
		  @35 county_fips 3.
		  @61 educ_1 2.
		  @63 educ_2 1.
		  @64 educ_flag 1.
		  @65 month 2.
		  @69 sex $1.
		  @70 age_1 1.
		  @71 age_2 3. 
		  @83 place 1.
		  @84 marital_status $1.
		  @85 day 1.
		  @109 autopsy $1.
		  @146 icd10 $4.
		  @154 recode113 3.
		  @341 numcond 2.
		  @449 race 1.
		  @488 hispanic 1.
		  @344 rec1 $5.
		  @349 rec2 $5.
		  @354 rec3 $5.
		  @359 rec4 $5.
		  @364 rec5 $5.
		  @369 rec6 $5.
		  @374 rec7 $5.
		  @379 rec8 $5.
		  @384 rec9 $5.
		  @389 rec10 $5.
		  @394 rec11 $5.
		  @399 rec12 $5.
		  @404 rec13 $5. 
		  @409 rec14 $5.
		  @414 rec15 $5.
		  @419 rec16 $5.
		  @424 rec17 $5.
		  @429 rec18 $5.
		  @434 rec19 $5.
		  @439 rec20 $5.;
	year = 2007; 
run;

data raw.mortality08; 
	infile "C:\Users\niwi8\OneDrive\Documents\Practicum\opioid_prediction\data\extracted\2008\MULT2008.uspart2"; 
	input @20 residence 1.
		  @29 state_name $2.
		  @35 county_fips 3.
		  @61 educ_1 2.
		  @63 educ_2 1.
		  @64 educ_flag 1.
		  @65 month 2.
		  @69 sex $1.
		  @70 age_1 1.
		  @71 age_2 3. 
		  @83 place 1.
		  @84 marital_status $1.
		  @85 day 1.
		  @109 autopsy $1.
		  @146 icd10 $4.
		  @154 recode113 3.
		  @341 numcond 2.
		  @449 race 1.
		  @488 hispanic 1.
		  @344 rec1 $5.
		  @349 rec2 $5.
		  @354 rec3 $5.
		  @359 rec4 $5.
		  @364 rec5 $5.
		  @369 rec6 $5.
		  @374 rec7 $5.
		  @379 rec8 $5.
		  @384 rec9 $5.
		  @389 rec10 $5.
		  @394 rec11 $5.
		  @399 rec12 $5.
		  @404 rec13 $5. 
		  @409 rec14 $5.
		  @414 rec15 $5.
		  @419 rec16 $5.
		  @424 rec17 $5.
		  @429 rec18 $5.
		  @434 rec19 $5.
		  @439 rec20 $5.;
	year = 2008; 
run;

data raw.mortality09; 
	infile "C:\Users\niwi8\OneDrive\Documents\Practicum\opioid_prediction\data\extracted\2009\MULT2009.uspart2"; 
	input @20 residence 1.
		  @29 state_name $2.
		  @35 county_fips 3.
		  @61 educ_1 2.
		  @63 educ_2 1.
		  @64 educ_flag 1.
		  @65 month 2.
		  @69 sex $1.
		  @70 age_1 1.
		  @71 age_2 3. 
		  @83 place 1.
		  @84 marital_status $1.
		  @85 day 1.
		  @109 autopsy $1.
		  @146 icd10 $4.
		  @154 recode113 3.
		  @341 numcond 2.
		  @449 race 1.
		  @488 hispanic 1.
		  @344 rec1 $5.
		  @349 rec2 $5.
		  @354 rec3 $5.
		  @359 rec4 $5.
		  @364 rec5 $5.
		  @369 rec6 $5.
		  @374 rec7 $5.
		  @379 rec8 $5.
		  @384 rec9 $5.
		  @389 rec10 $5.
		  @394 rec11 $5.
		  @399 rec12 $5.
		  @404 rec13 $5. 
		  @409 rec14 $5.
		  @414 rec15 $5.
		  @419 rec16 $5.
		  @424 rec17 $5.
		  @429 rec18 $5.
		  @434 rec19 $5.
		  @439 rec20 $5.;
	year = 2009; 
run;

data raw.mortality10; 
	infile "C:\Users\niwi8\OneDrive\Documents\Practicum\opioid_prediction\data\extracted\2010\MULT2010.uspart2"; 
	input @20 residence 1.
		  @29 state_name $2.
		  @35 county_fips 3.
		  @61 educ_1 2.
		  @63 educ_2 1.
		  @64 educ_flag 1.
		  @65 month 2.
		  @69 sex $1.
		  @70 age_1 1.
		  @71 age_2 3. 
		  @83 place 1.
		  @84 marital_status $1.
		  @85 day 1.
		  @109 autopsy $1.
		  @146 icd10 $4.
		  @154 recode113 3.
		  @341 numcond 2.
		  @449 race 1.
		  @488 hispanic 1.
		  @344 rec1 $5.
		  @349 rec2 $5.
		  @354 rec3 $5.
		  @359 rec4 $5.
		  @364 rec5 $5.
		  @369 rec6 $5.
		  @374 rec7 $5.
		  @379 rec8 $5.
		  @384 rec9 $5.
		  @389 rec10 $5.
		  @394 rec11 $5.
		  @399 rec12 $5.
		  @404 rec13 $5. 
		  @409 rec14 $5.
		  @414 rec15 $5.
		  @419 rec16 $5.
		  @424 rec17 $5.
		  @429 rec18 $5.
		  @434 rec19 $5.
		  @439 rec20 $5.;
	year = 2010; 
run;

data raw.mortality11; 
	infile "C:\Users\niwi8\OneDrive\Documents\Practicum\opioid_prediction\data\extracted\2011\MULT2011.uspart2"; 
	input @20 residence 1.
		  @29 state_name $2.
		  @35 county_fips 3.
		  @61 educ_1 2.
		  @63 educ_2 1.
		  @64 educ_flag 1.
		  @65 month 2.
		  @69 sex $1.
		  @70 age_1 1.
		  @71 age_2 3. 
		  @83 place 1.
		  @84 marital_status $1.
		  @85 day 1.
		  @109 autopsy $1.
		  @146 icd10 $4.
		  @154 recode113 3.
		  @341 numcond 2.
		  @449 race 1.
		  @488 hispanic 1.
		  @344 rec1 $5.
		  @349 rec2 $5.
		  @354 rec3 $5.
		  @359 rec4 $5.
		  @364 rec5 $5.
		  @369 rec6 $5.
		  @374 rec7 $5.
		  @379 rec8 $5.
		  @384 rec9 $5.
		  @389 rec10 $5.
		  @394 rec11 $5.
		  @399 rec12 $5.
		  @404 rec13 $5. 
		  @409 rec14 $5.
		  @414 rec15 $5.
		  @419 rec16 $5.
		  @424 rec17 $5.
		  @429 rec18 $5.
		  @434 rec19 $5.
		  @439 rec20 $5.;
	year = 2011; 
run;

data raw.mortality12; 
	infile "C:\Users\niwi8\OneDrive\Documents\Practicum\opioid_prediction\data\extracted\2012\MULT2012.uspart2"; 
	input @20 residence 1.
		  @29 state_name $2.
		  @35 county_fips 3.
		  @61 educ_1 2.
		  @63 educ_2 1.
		  @64 educ_flag 1.
		  @65 month 2.
		  @69 sex $1.
		  @70 age_1 1.
		  @71 age_2 3. 
		  @83 place 1.
		  @84 marital_status $1.
		  @85 day 1.
		  @109 autopsy $1.
		  @146 icd10 $4.
		  @154 recode113 3.
		  @341 numcond 2.
		  @449 race 1.
		  @488 hispanic 1.
		  @344 rec1 $5.
		  @349 rec2 $5.
		  @354 rec3 $5.
		  @359 rec4 $5.
		  @364 rec5 $5.
		  @369 rec6 $5.
		  @374 rec7 $5.
		  @379 rec8 $5.
		  @384 rec9 $5.
		  @389 rec10 $5.
		  @394 rec11 $5.
		  @399 rec12 $5.
		  @404 rec13 $5. 
		  @409 rec14 $5.
		  @414 rec15 $5.
		  @419 rec16 $5.
		  @424 rec17 $5.
		  @429 rec18 $5.
		  @434 rec19 $5.
		  @439 rec20 $5.;
	year = 2012; 
run;

data raw.mortality13; 
	infile "C:\Users\niwi8\OneDrive\Documents\Practicum\opioid_prediction\data\extracted\2013\MULT2013.uspart2"; 
	input @20 residence 1.
		  @29 state_name $2.
		  @35 county_fips 3.
		  @61 educ_1 2.
		  @63 educ_2 1.
		  @64 educ_flag 1.
		  @65 month 2.
		  @69 sex $1.
		  @70 age_1 1.
		  @71 age_2 3. 
		  @83 place 1.
		  @84 marital_status $1.
		  @85 day 1.
		  @109 autopsy $1.
		  @146 icd10 $4.
		  @154 recode113 3.
		  @341 numcond 2.
		  @449 race 1.
		  @488 hispanic 1.
		  @344 rec1 $5.
		  @349 rec2 $5.
		  @354 rec3 $5.
		  @359 rec4 $5.
		  @364 rec5 $5.
		  @369 rec6 $5.
		  @374 rec7 $5.
		  @379 rec8 $5.
		  @384 rec9 $5.
		  @389 rec10 $5.
		  @394 rec11 $5.
		  @399 rec12 $5.
		  @404 rec13 $5. 
		  @409 rec14 $5.
		  @414 rec15 $5.
		  @419 rec16 $5.
		  @424 rec17 $5.
		  @429 rec18 $5.
		  @434 rec19 $5.
		  @439 rec20 $5.;
	year = 2013; 
run;

data raw.mortality14; 
	infile "C:\Users\niwi8\OneDrive\Documents\Practicum\opioid_prediction\data\extracted\2014\MULT2014.uspart2" truncover; 
	input @20 residence 1.
		  @29 state_name $2.
		  @35 county_fips 3.
		  @61 educ_1 2.
		  @63 educ_2 1.
		  @64 educ_flag 1.
		  @65 month 2.
		  @69 sex $1.
		  @70 age_1 1.
		  @71 age_2 3. 
		  @83 place 1.
		  @84 marital_status $1.
		  @85 day 1.
		  @109 autopsy $1.
		  @146 icd10 $4.
		  @154 recode113 3.
		  @341 numcond 2.
		  @449 race 1.
		  @488 hispanic 1.
		  @344 rec1 $5.
		  @349 rec2 $5.
		  @354 rec3 $5.
		  @359 rec4 $5.
		  @364 rec5 $5.
		  @369 rec6 $5.
		  @374 rec7 $5.
		  @379 rec8 $5.
		  @384 rec9 $5.
		  @389 rec10 $5.
		  @394 rec11 $5.
		  @399 rec12 $5.
		  @404 rec13 $5. 
		  @409 rec14 $5.
		  @414 rec15 $5.
		  @419 rec16 $5.
		  @424 rec17 $5.
		  @429 rec18 $5.
		  @434 rec19 $5.
		  @439 rec20 $5.;
	year = 2014; 
run;

data raw.mortality15; 
	infile "C:\Users\niwi8\OneDrive\Documents\Practicum\opioid_prediction\data\extracted\2015\MULT2015.uspart2" truncover; 
	input @20 residence 1.
		  @29 state_name $2.
		  @35 county_fips 3.
		  @61 educ_1 2.
		  @63 educ_2 1.
		  @64 educ_flag 1.
		  @65 month 2.
		  @69 sex $1.
		  @70 age_1 1.
		  @71 age_2 3. 
		  @83 place 1.
		  @84 marital_status $1.
		  @85 day 1.
		  @109 autopsy $1.
		  @146 icd10 $4.
		  @154 recode113 3.
		  @341 numcond 2.
		  @449 race 1.
		  @488 hispanic 1.
		  @344 rec1 $5.
		  @349 rec2 $5.
		  @354 rec3 $5.
		  @359 rec4 $5.
		  @364 rec5 $5.
		  @369 rec6 $5.
		  @374 rec7 $5.
		  @379 rec8 $5.
		  @384 rec9 $5.
		  @389 rec10 $5.
		  @394 rec11 $5.
		  @399 rec12 $5.
		  @404 rec13 $5. 
		  @409 rec14 $5.
		  @414 rec15 $5.
		  @419 rec16 $5.
		  @424 rec17 $5.
		  @429 rec18 $5.
		  @434 rec19 $5.
		  @439 rec20 $5.;
	year = 2015; 
run;

data raw.mortality16; 
	infile "C:\Users\niwi8\OneDrive\Documents\Practicum\opioid_prediction\data\extracted\2016\MULT2016.USAllCnty.txt"; 
	input @20 residence 1.
		  @29 state_name $2.
		  @35 county_fips 3.
		  @61 educ_1 2.
		  @63 educ_2 1.
		  @64 educ_flag 1.
		  @65 month 2.
		  @69 sex $1.
		  @70 age_1 1.
		  @71 age_2 3. 
		  @83 place 1.
		  @84 marital_status $1.
		  @85 day 1.
		  @109 autopsy $1.
		  @146 icd10 $4.
		  @154 recode113 3.
		  @341 numcond 2.
		  @449 race 1.
		  @488 hispanic 1.
		  @344 rec1 $5.
		  @349 rec2 $5.
		  @354 rec3 $5.
		  @359 rec4 $5.
		  @364 rec5 $5.
		  @369 rec6 $5.
		  @374 rec7 $5.
		  @379 rec8 $5.
		  @384 rec9 $5.
		  @389 rec10 $5.
		  @394 rec11 $5.
		  @399 rec12 $5.
		  @404 rec13 $5. 
		  @409 rec14 $5.
		  @414 rec15 $5.
		  @419 rec16 $5.
		  @424 rec17 $5.
		  @429 rec18 $5.
		  @434 rec19 $5.
		  @439 rec20 $5.;
	year = 2016; 
run;
