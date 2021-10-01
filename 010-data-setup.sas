
*****************************************************************************************************************
                                                                                                     
   DESCRIPTION: Import incoming dataset(s) and create analysis dataset(s)

				TOC (Use Ctr+F "X)" to navigate through code):
 				1) Import
				2) Initial checks
				3) Create clean/derived analysis dataset
				4) Clean/derived analysis dataset checks 
				5) Save a permanent version
				6) Export data for use in R

---------------------------------------------------------------------------------------------------------------
                                      
   LANGUAGE:    SAS, VERSION 9.4                                  
                                                                   
   NAME:        Stephanie Lobaugh                               
   DATE:        2/24/2020: Created                                                                                         
                                                                   
****************************************************************************************************************;

* Program name;
%Let pgm = 010-data-setup;
%Let pre = %substr(&pgm, 1, %index(&pgm, -)-1);

* H Drive project path;
%Let h = H:\Biostatistics\Lobaugh\2021\[H-drive folder name];

* GitHub repository path;
%Let repos = C:\Users\lobaughs\GitHub\[C-drive folder name];

* Set pathway for output;
%Let path = &repos.\programs;

* Data libraries;
libname _all_ clear;
%Let date_old = 2021-01-07;
libname old "&h.\secure_data\&date_old";
%Let date = 2020-02-26;
libname data "&h.\secure_data\&date";

* Formats library;
options nofmterr;
libname fmt "&h.\secure_data";
OPTIONS FMTSEARCH = (fmt.formats);

* Macro library;
libname gitmacs "C:\Users\lobaughs\GitHub\macros";
options mstored sasmstore = gitmacs;

* Escape character;
ods escapechar = "^";

* Today's date;
%let today_yymmdd = %sysfunc(today(), yymmdd7.);
%let today = %sysfunc(today(), worddate.);

ods noproctitle;
title;



/**************************************************************************************************************
	1) Import
**************************************************************************************************************/

proc import datafile = "&h.\secure_data\&date.\Durva Lung Database_Elderly and frail.xlsx"
	dbms = xlsx
	out = data.raw
	replace;
	getnames = yes;
/*	sheet = "";*/
run;

***** Import data dictionary to apply labels and formats later;
proc import 
	datafile = "&h.\secure_data\_data-dictionary.xlsx"
	dbms = xlsx
	out = data.dictionary
	replace;
	getnames = yes;
run;

* Run attribute macro to create global macro variable "&attrib" that can be used in the attrib statement
  in a data step to apply labels/formats;
%attribute(dictionary_ds = data.dictionary)

%let in = data.raw;


/**************************************************************************************************************
	2) Initial checks
**************************************************************************************************************/

* Compare to older version;
%compare_olderversion(old_ds = old.raw, new_ds = &in, sortby = MRN)

ods output position = contents;
proc contents data = &in varnum; run;


***** Check for duplicates;
%dups(ds = &in, id = MRN)


***** Date checks;
proc sql;
	* Create a list of all date variables;
	select variable
	into :datevars separated by " "
	from contents where lowcase(format) in("mmddyy10.","date7.","date9.","date.","datetime.","yymmdd10.");

	* Create a list of date variables that do not have date formats;
	select variable
	into :datefmtissue separated by " "
	from contents where (find(lowcase(variable),"date") ne 0 or
                         find(lowcase(variable),"dte") ne 0 or
                         find(lowcase(variable),"dt") ne 0 or
                         find(lowcase(variable),"dob") ne 0) and
	                    lowcase(format) not in("mmddyy10.","date7.","date9.","date.","datetime.","yymmdd10.");
quit;

* Macro to loop over the date_minmax macro. Returns min and max date for each date variable in 'my_varlist';
%date_minmax_loop(my_ds = &in, my_varlist = &datevars)




/**************************************************************************************************************
	3) Create a clean/derived analysis dataset
**************************************************************************************************************/






/**************************************************************************************************************
	4) Clean/derived analysis dataset checks
**************************************************************************************************************/

%let new = derived;


***** Check for duplicates;
%dups(ds = &new, id = MRN)

***** Compare to older version;
data derived_attrib; set derived; attrib &attrib; run;
%compare_olderversion(old_ds = old.drvd, new_ds = derived_attrib, sortby = MRN)



/**************************************************************************************************************
	5) Save a permanent version
**************************************************************************************************************/

* Create list of variable names in derived dataset;
proc sql;
	create table vars_derived as
	select name
	from dictionary.columns where libname = "WORK" and memname = "DERIVED";
quit;

* Create dataset with variable names in both the derived and data dictionary datasets;
proc sql;
	create table vars_both as
	select A.variable, B.name
	from data.dictionary A
			inner join
		 vars_derived B on lowcase(A.variable) = lowcase(B.name);
quit;

proc sql;
	select variable
	into :keep_vars separated by ' '
	from vars_both;
quit;

* Save to a permanent location. Only keep project variables;
data data.drvd; set derived; attrib &attrib; keep mrn &keep_vars; run;



/**************************************************************************************************************
	6) Export data for use in R
**************************************************************************************************************/

proc sql;
	select variable || "=" || strip(variable) || "_old"
	into :rename_old separated by " "
	from data.dictionary where type_1cont_2cat = 2 and not missing(fmt) and fmt ne "$missing." and
		 find(lowcase(variable),"delta") = 0;
 
	select strip(variable) || "=put(" || strip(variable) || "_old," || strip(fmt) || ")" || %str(";")
	into :label_values separated by " "
	from data.dictionary where type_1cont_2cat = 2 and not missing(fmt) and fmt ne "$missing." and
		 find(lowcase(variable),"delta") = 0;;
quit;

data data.drvd_forR;
	set data.drvd(rename = (&rename_old));
	&label_values;
run;

proc export
	data = data.drvd_forR
	outfile = "&h./secure_data/&date./drvd_val_labels.xlsx"
	dbms = xlsx
	replace;
run;
