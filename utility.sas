/*******************************************************************************
Program name: 	utility.sas
Programmer: 	Hannah Kalvin & Stephanie Lobaugh
Purpose: 		Read in all MSKCC templates and SAS macros necessary for a new project
Date: 
				2021-09-30: CREATED
Language: 		SAS, VERSION 9.4
Notes:
This program includes all MSKCC templates and SAS macros available. If you 
would like to read in a SAS macro by itself, please load the macro-specific
utility program.

*******************************************************************************/

/*
to add utility to your program use the following code:
FILENAME utility URL ;
%INCLUDE ;

/*Call in MSK template*/
*go to sas program and view raw code to obtain URL;
FILENAME msktemplate URL "https://github.mskcc.org/kalvinh/table1.git ";

%INCLUDE msktemplate;
/*Call in MSK SAS macros*/

FILENAME URL ;
FILENAME URL ;
FILENAME URL ;
FILENAME URL ;
FILENAME URL ;
FILENAME URL ;
FILENAME URL ;
FILENAME URL ;
FILENAME URL ;
FILENAME URL ;


%INCLUDE ;
%INCLUDE ;
%INCLUDE ;
%INCLUDE ;
%INCLUDE ;
%INCLUDE ;
%INCLUDE ;
%INCLUDE ;



/*End of program*/
