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

/*Call in MSK template*/
*go to sas program and view raw code to obtain URL;
FILENAME msktemp URL "https://raw.githubusercontent.com/slobaugh/create_msk_SAS_project/main/Templates.sas";
%INCLUDE msktemp;


/*Call in MSK SAS macros*/
*call in macro (tag) version for all;
FILENAME version URL "https://raw.githubusercontent.com/slobaugh/msk_SAS_macros/main/version.sas";
%INCLUDE version;
%put &version;

FILENAME table1 URL "https://raw.githubusercontent.com/slobaugh/msk_SAS_macros/&table1v/table1.sas";
%INCLUDE table1 ;
%put Using Table 1 SAS Macro Version: &table1v;

FILENAME table1loop URL "https://raw.githubusercontent.com/slobaugh/msk_SAS_macros/&table1loopv/table1loop.sas";
%INCLUDE table1loop ;
%put Using Table 1 Loop SAS Macro Version: &table1loopv;

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
