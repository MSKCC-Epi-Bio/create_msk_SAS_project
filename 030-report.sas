
*****************************************************************************************************************
                                                                                                     
DESCRIPTION: Generate report

TOC (Use Ctr+F "X)" to navigate through code):
1) Create macro vars to use in text of report
2) Report

---------------------------------------------------------------------------------------------------------------
                                      
LANGUAGE: SAS, VERSION 9.4                                  
                                                               
NAME:                               
DATE: MM/DD/YYYY: Created                                                                                         
                                                                   
****************************************************************************************************************;

* Today's date;
%let today_yymmdd = %sysfunc(today(), yymmdd7.);
%let today = %sysfunc(today(), worddate.);

* Create program name numeric prefix as a source program identifier at the beginning of the file name 
  for any output created in this program (e.g. "&pre._results_&today_yymmdd..rtf");
%Let pre = 030;

libname _all_ clear;

* H Drive project path (data is saved within this folder);
%Let h = ;

* Local GitHub repository path (programs/output saved in this folder);
%Let repos = ;

* Data library;
%Let date = YYYY-MM-DD;
libname data "&h.\secure_data\&date";

* Escape character;
ods escapechar = "^";

ods noproctitle;
title;


/**************************************************************************************************************
	1) Create macro vars to use in text of report
**************************************************************************************************************/


/**************************************************************************************************************
	2) Report
**************************************************************************************************************/

***** Begin rtf file;
%Let style16 = fontsize = 16pt fontweight = bold fontfamily = Arial;
%Let style14 = fontsize = 14pt fontweight = bold fontfamily = Arial;
%Let style12 = fontsize = 12pt fontweight = bold fontfamily = Arial;
%Let style11 = fontsize = 11pt fontfamily = Arial;

ods rtf file = "&repos.\&pre._[insert file description]_&today_yymmdd..rtf"
	style = styles.msk 
	bodytitle 
	startpage = no
    wordstyle = 
"\s1 Heading 1
 \s2 Heading 2
 \s3 Heading 3";


proc odstext;
	p "{Title}" 
    / style = [&style16];
	p "{}" / style = [fontsize = 11pt];

	p "{Name, Degree \par &&today.}" 
    / style = [&style11 fontstyle = italic];
	p "{}" / style = [fontsize = 11pt];

	p "{Output generated using the following dataset received &date.:}" 
    / style = [&style11 fontstyle = italic];
	p "{}" / style = [fontsize = 11pt];

	p "{Please note that some contents of this report are intended for internal use only and do
 not need to be included in the abstract/manuscript (i.e. some descriptions/tables/figures are included to aid
 interpretation or as quality assurance checks for the project team).}" 
    / style = [&style11 fontstyle = italic];
	p "{}" / style = [fontsize = 11pt];
run;

*** Overview;
proc odstext;
	p "{\pard\s1\b\ul Overview \par}" / style = {&style16};
	p "{1.0  Study description}" 
    / style = [&style11];
	p "{2.0  Methods}" 
    / style = [&style11];
	p "{3.0  Results}" 
    / style = [&style11];
		p "{3.1  Heading2 A}" 
	    / style = [&style11 leftmargin = 0.35in];
			p "{3.1.1  Heading3 A}" 
		    / style = [&style11 leftmargin = 0.7in];
			p "{3.1.2  Heading3 B}" 
		    / style = [&style11 leftmargin = 0.7in];
		p "{3.2  Heading2 B}" 
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

	p "{The analysis objectives included: (1) , (2) , and (3).}" 
	/ style = [&style11];	
	p "{}" / style = [fontsize = 11pt];
run;

*** Methods;
proc odstext;
	p "{\pard\s1\b\ul 2.0 Methods \par}" / style = {&style16};

	p "{Analysis objective (1)}" 
	/ style = [&style11 fontweight = bold];
	p "{}" / style = [fontsize = 11pt];

	p "{METHODS FOR ANALYSIS OBJECTIVE 1.}" 
	/ style = [&style11 leftmargin = 0.35in];	
	p "{}" / style = [fontsize = 11pt];

	p "{Analysis objective (2)}" 
	/ style = [&style11 fontweight = bold];
	p "{}" / style = [fontsize = 11pt];

	p "{METHODS FOR ANALYSIS OBJECTIVE 2.}" 
	/ style = [&style11 leftmargin = 0.35in];	
	p "{}" / style = [fontsize = 11pt];

	p "{Analysis objective (3)}" 
	/ style = [&style11 fontweight = bold];
	p "{}" / style = [fontsize = 11pt];

	p "{METHODS FOR ANALYSIS OBJECTIVE 3.}" 
	/ style = [&style11 leftmargin = 0.35in];	
	p "{}" / style = [fontsize = 11pt];
	
	p "{All statistical computations were performed, and all output was generated using SAS Software Version 9.4
 (The SAS Institute, Cary, NC).}"
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

* Example header 2;
proc odstext;
	p "{\pard\s2\b\ul 3.1 Heading2 A \par}" / style = {&style14};
run;

* Example header 3;
proc odstext;
	p "{\pard\s3\b\ul 3.1.1 Heading3 A \par}" / style = {&style12};
run;

ods rtf close;
*****;
