
*****************************************************************************************************************
                                                                                                     
DESCRIPTION: Import incoming dataset and create analysis dataset

TOC (Use Ctr+F "X)" to navigate through code):
1) Import
2) Initial checks
3) Create clean/derived analysis dataset
4) Clean/derived analysis dataset checks 
5) Save a permanent version

---------------------------------------------------------------------------------------------------------------
                                      
LANGUAGE: SAS, VERSION 9.4                                  
                                                               
NAME:                               
DATE: MM/DD/YYYY: Created                                                                                         
                                                                   
****************************************************************************************************************;

*include utility for MSK template and macros;
FILENAME utility URL "https://raw.githubusercontent.com/slobaugh/create_msk_SAS_project/main/utility.sas";
%INCLUDE utility;

* Today's date;
%let today_yymmdd = %sysfunc(today(), yymmdd7.);
%let today = %sysfunc(today(), worddate.);

* Use program name numeric prefix as a source program identifier at the beginning of the file name 
  for any output created in this program (e.g. "&pre._initial-data-checks_&today_yymmdd..rtf");
%Let pre = 010;

libname _all_ clear;

* H Drive project path (data is saved within this folder);
%Let h = ;

* Local GitHub repository path (programs/output saved in this folder);
%Let repos = ;

* Data library;
%Let date = YYYY-MM-DD;
libname data "&h.\secure_data\&date";



/**************************************************************************************************************
	1) Import
**************************************************************************************************************/


/**************************************************************************************************************
	2) Initial checks
**************************************************************************************************************/


/**************************************************************************************************************
	3) Create a clean/derived analysis dataset
**************************************************************************************************************/


/**************************************************************************************************************
	4) Clean/derived analysis dataset checks
**************************************************************************************************************/


/**************************************************************************************************************
	5) Save a permanent version
**************************************************************************************************************/

