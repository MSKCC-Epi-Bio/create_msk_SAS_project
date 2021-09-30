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
FILENAME msktemp URL "https://raw.githubusercontent.com/slobaugh/create_msk_SAS_project/main/Templates.sas";


%INCLUDE msktemp;
/*Call in MSK SAS macros*/

FILENAME table1 URL "https://raw.githubusercontent.com/slobaugh/msk_SAS_macros/main/table1.sas" ;

FILENAME version URL "https://raw.githubusercontent.com/slobaugh/msk_SAS_macros/main/version.sas";
%INCLUDE version;
%put &version;
FILENAME table1 URL "https://raw.githubusercontent.com/slobaugh/msk_SAS_macros/&version/table1.sas";
%INCLUDE table1 ;

/*FILENAME URL ;*/
/*FILENAME URL ;*/
/*FILENAME URL ;*/
/*FILENAME URL ;*/
/*FILENAME URL ;*/
/*FILENAME URL ;*/
/*FILENAME URL ;*/
/*FILENAME URL ;*/
/*FILENAME URL ;*/



/*%INCLUDE ;*/
/*%INCLUDE ;*/
/*%INCLUDE ;*/
/*%INCLUDE ;*/
/*%INCLUDE ;*/
/*%INCLUDE ;*/
/*%INCLUDE ;*/



/*End of program*/
