
*****************************************************************************************************************
                                                                                                     
   DESCRIPTION: Report 1
---------------------------------------------------------------------------------------------------------------
                                      
   LANGUAGE:    SAS, VERSION 9.4                                  
                                                                   
   NAME:        Stephanie Lobaugh                               
   DATE:        4/28/2020: Created                                                                                         
                                                                   
****************************************************************************************************************;

* Program name;
%Let pgm = 0x-report1;
%Let pre = %substr(&pgm, 1, %index(&pgm, -)-1);

* H Drive project path;
%Let h = ;

* GitHub repository path;
%Let repos = ;

* Set pathway for output;
%Let path = &repos.\programs_and_output;

* Data libraries;
libname _all_ clear;
%Let date = 2020-04-08;
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

* Select dataset to use throughout;
%let mydata = data.drvd;


/**************************************************************************************************************
	Create macro vars to use in text of report
**************************************************************************************************************/

proc sql;
	select count(distinct MRN)
	into :numpatients trimmed
	from &mydata;
quit;


/**************************************************************************************************************
	Begin report
**************************************************************************************************************/

***** Begin rtf file;
%Let style16 = fontsize = 16pt fontweight = bold fontfamily = Arial;
%Let style14 = fontsize = 14pt fontweight = bold fontfamily = Arial;
%Let style12 = fontsize = 12pt fontweight = bold fontfamily = Arial;
%Let style11 = fontsize = 11pt fontfamily = Arial;

ods rtf file = "&repos.\programs_and_output\&pre._[insert file description]_&today_yymmdd..rtf"
	style = basicreport_arial bodytitle startpage = no
    wordstyle = 
"\s1 Heading 1
 \s2 Heading 2
 \s3 Heading 3";


proc odstext;
	p "{Title}" 
    / style = [&style16];
	p "{}" / style = [fontsize = 11pt];

	p "{Stephanie Lobaugh, MS \par &&today.}" 
    / style = [&style11 fontstyle = italic];
	p "{}" / style = [fontsize = 11pt];

	p "{Output generated using the following dataset received from ___ on &date.:}" 
    / style = [&style11 fontstyle = italic];
	p "{}" / style = [fontsize = 11pt];

	p "{Please note that some contents of this report are intended for internal use only and do
 not need to be included in the abstract/manuscript (i.e. some descriptions/tables/figures are included to aid
 interpretation or as quality assurance checks for the project team).}" 
    / style = [&style11 fontstyle = italic];
	p "{}" / style = [fontsize = 11pt];
run;

proc odstext;
	***** Overview;
	p "{\pard\s1\b\ul Overview \par}" / style = {&style16};
	p "{1.0  Study description}" 
    / style = [&style11];
	p "{2.0  Methods}" 
    / style = [&style11];
	p "{3.0  Results}" 
    / style = [&style11];
		p "{3.1  Descriptive tables}" 
	    / style = [&style11 leftmargin = 0.35in];
			p "{3.1.1  Among all patients}" 
		    / style = [&style11 leftmargin = 0.7in];
			p "{3.1.2  Among AML patients}" 
		    / style = [&style11 leftmargin = 0.7in];
			p "{3.1.3  Among MDS patients}" 
		    / style = [&style11 leftmargin = 0.7in];
			p "{3.1.4  Among patients who got sCT}" 
		    / style = [&style11 leftmargin = 0.7in];
		p "{3.2  UVA Cox proportional hazards regression}" 
	    / style = [&style11 leftmargin = 0.35in];
	p "{}" / style = [fontsize = 11pt];

	p "{To view the navigation pane for this document, please do the following in Word: Under the 'View' tab, check
 the 'Navigation Pane' box in the 'Show' section.}" 
	/ style = [fontsize = 11pt fontweight = bold];	
	p "{}" / style = [fontsize = 11pt];
run;

*** Study description;
proc odstext;
	p "{\pard\s1\b\ul 1.0 Study description \par}" / style = {&style16};

	p "{In this report, we analyzed &&numpatients. unresectable patients with HCC, 1 or 2 malignant lesions, LI-RADS 4 or
 above who received embolization (1 or more sessions) between Dec 1 2003 and Dec 31 2017 at MSKCC. Baseline CT occurred
 within 2 months of first embolization and the follow-up CT was within 2 months post embolization. Tables 1a and 
 1b provide a summary of demographic and clinical characteristics of the sample.}" 
	/ style = [&style11];	
	p "{}" / style = [fontsize = 11pt];

	p "{The analysis objectives included: (1) To evaluate associations between survival endpoints and 
 baseline variables, post-treatment measures, and new response criteria combining LI-RADS 
 and treatment responses (LR-TR), (2) To examine measures of association between LR-TR categories and mRECIST
 categories, and (3) To examine interrater agreement.}" 
	/ style = [&style11];	
	p "{}" / style = [fontsize = 11pt];
run;

*** Methods;
proc odstext;
	p "{\pard\s1\b\ul 2.0 Methods \par}" / style = {&style16};

	p "{Analysis objective (1)}" 
	/ style = [&style11 fontweight = bold];
	p "{}" / style = [fontsize = 11pt];

	p "{Kaplan-Meier survival curves and cumulative incidence functions (CIF) were generated to
 examine the survival and incidence experiences of the sample level with respect to overall survival (OS) and time to
 progression (TTP). Death was a competing risk for the TTP outcome. Univariable Cox proportional hazards 
 regression was used to analyze OS, and Fine-Gray competing risks regression was used to analyze TTP. 
 Baseline time for analyses involving baseline variables was defined as date of first embolization.
 Baseline time for analyses involving post-treatment measurements was defined as end of treatment data.
 A significance level of 0.05 was used throughout.}" 
	/ style = [&style11 leftmargin = 0.35in];	
	p "{}" / style = [fontsize = 11pt];

	p "{Analysis objective (2)}" 
	/ style = [&style11 fontweight = bold];
	p "{}" / style = [fontsize = 11pt];
	p "{We used Kendall's Tau and Spearman rank correlation coefficients to examine the relationships 
 between summary LR-TR categories and mRECIST categories for each expert reader.}" 
	/ style = [&style11 leftmargin = 0.35in];	
	p "{}" / style = [fontsize = 11pt];

	p "{Analysis objective (3)}" 
	/ style = [&style11 fontweight = bold];
	p "{}" / style = [fontsize = 11pt];
	p "{We calculated kappas and interclass correlations to assess interrater agreement.}" 
	/ style = [&style11 leftmargin = 0.35in];	
	p "{}" / style = [fontsize = 11pt];
	
	p "{All statistical computations were performed, and all output was generated using SAS Software Version 9.4
 (The SAS Institute, Cary, NC) and R version 3.5.3.}"
    / style = [&style11];
	p "{}" / style = [fontsize = 11pt];
run;

*** Results;
proc odstext;
	p "{\pard\s1\b\ul 3.0 Results \par}" / style = {&style16};

	p "{.}"
    / style = [fontsize = 11pt fontfamily = Arial];
	p "{}" / style = [fontsize = 11pt];
run;

proc odstext;
	p "{\pard\s2\b\ul 3.1 Descriptive tables \par}" / style = {&style14};
run;

proc odstext;
	p "{\pard\s3\b\ul 3.1.1 Among all patients \par}" / style = {&style12};
run;

ods rtf close;
*****;
