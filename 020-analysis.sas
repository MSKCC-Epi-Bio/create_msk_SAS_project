
*****************************************************************************************************************
                                                                                                     
DESCRIPTION: Analysis

TOC (Use Ctr+F "X)" to navigate through code):
1) 
2) 

---------------------------------------------------------------------------------------------------------------
                                      
LANGUAGE: SAS, VERSION 9.4                                  
                                                               
NAME:                               
DATE: MM/DD/YYYY: Created                                                                                         
                                                                   
****************************************************************************************************************;

* Today's date;
%let today_yymmdd = %sysfunc(today(), yymmdd7.);
%let today = %sysfunc(today(), worddate.);

* Use program name numeric prefix as a source program identifier at the beginning of the file name 
  for any output created in this program (e.g. "&pre._regression_&today_yymmdd..rtf");
%Let pre = 020;

libname _all_ clear;

* H Drive project path (data is saved within this folder);
%Let h = ;

* Local GitHub repository path (programs/output saved in this folder);
%Let repos = ;

* Data library;
%Let date = YYYY-MM-DD;
libname data "&h.\secure_data\&date";



/**************************************************************************************************************
	1) 
**************************************************************************************************************/


/**************************************************************************************************************
	2) 
**************************************************************************************************************/




