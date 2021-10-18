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
FILENAME msktemp URL "https://raw.githubusercontent.com/MSKCC-Epi-Bio/create_msk_SAS_project/main/Templates.sas";
%INCLUDE msktemp;


/*Call in MSK SAS macros*/
*call in macro (tag) version for all;
FILENAME version URL "https://raw.githubusercontent.com/MSKCC-Epi-Bio/create_msk_SAS_project/main/version.sas";
%INCLUDE version;
%put &=version;

FILENAME table1 URL "https://raw.githubusercontent.com/MSKCC-Epi-Bio/msk_SAS_macros/&version/Table1/table1.sas";
%INCLUDE table1 ;
%put Using Table 1 SAS Macro ('%table1') Version: &version;

FILENAME t1l URL "https://raw.githubusercontent.com/MSKCC-Epi-Bio/msk_SAS_macros/&version/Table1loop/table1loop.sas";
%INCLUDE t1l ;
%put Using Table 1 Loop SAS Macro ('%table1loop') Version: &version;

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
