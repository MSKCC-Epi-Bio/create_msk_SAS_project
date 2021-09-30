proc template;
define style styles.msk;
parent=styles.sasdocprinter;
class GraphDataDefault /
         endcolor = GraphColors("gdata2")
         neutralcolor = GraphColors("gdata11")
         startcolor = GraphColors("gdata1")
         markersize = 6pt
         markersymbol = "circlefilled"
         linethickness = 2px
         linestyle = 1
         contrastcolor = GraphColors("gcdata1")
         color = GraphColors("gdata1");
class GraphColors/
'gdatadefault'=cx007CBA 'gcdatadefault'=cx007CBA /*MSK Blue*/
'gfit'=cx007CBA 		'gcfit'=cx007CBA 		/*MSK Blue*/
'gdata'=cx007CBA 		'gdata'=cx007CBA 		/*MSK Blue*/
'gdata1'=cx007CBA	'gcdata1'=cx007CBA	'gndata1'=cx007CBA	'gncdata1'=cx007CBA /*MSK Blue*/
'gdata2'=cxDF4602	'gcdata2'=cxDF4602	'gndata2'=cxDF4602	'gncdata2'=cxDF4602 /*MSK Orange*/
'gdata3'=cx40B4E5	'gcdata3'=cx40B4E5	'gndata3'=cx40B4E5	'gncdata3'=cx40B4E5 /*Medium Blue*/
'gdata4'=cxF29934	'gcdata4'=cxF29934	'gndata4'=cxF29934	'gncdata4'=cxF29934 /*Medium Orange*/
'gdata5'=cx8FC7EB	'gcdata5'=cx8FC7EB	'gndata5'=cx8FC7EB	'gncdata5'=cx8FC7EB /*Light Blue*/
'gdata6'=cxF6C658	'gcdata6'=cxF6C658	'gndata6'=cxF6C658	'gncdata6'=cxF6C658 /*Light Orange*/
'gdata7'=cx006098	'gcdata7'=cx006098	'gndata7'=cx006098	'gncdata7'=cx006098 /*Dark Blue*/
'gdata8'=cxC24DO0	'gcdata8'=cxC24D00	'gndata8'=cxC24DO0	'gncdata8'=cxC24D00 /*Dark Orange*/

'gdata9'=cx83276B	'gcdata9'=cx83276B	'gndata9'=cx83276B	'gncdata9'=cx83276B /*Dark Violet*/
'gdata10'=cxB687B8 	'gcdata10'=cxB687B8	'gndata10'=cxB687B8	'gncdata10'=cxB687B8/*Light Violet*/
'gdata11'=cxE92076  'gcdata11'=cxE92076	'gndata11'=cxE92076	'gncdata11'=cxE92076/*Dark Magenta*/
'gdata12'=cxEF83CB	'gcdata12'=cxEF83CB	'gndata12'=cxEF83CB	'gncdata12'=cxEF83CB /*Light Magenta*/
'gdata13'=cxB1132D	'gcdata13'=cxB1132D	'gndata13'=cxB1132D	'gncdata13'=cxB1132D /*Red*/
'gdata14'=cx4C8B2B	'gcdata14'=cx4C8B2B	'gndata14'=cx4C8B2B	'gncdata14'=cx4C8B2B /*Dark Green*/
'gdata15'=cxA6CE39	'gcdata15'=cxA6CE39	'gndata15'=cxA6CE39	'gncdata15'=cxA6CE39 /*Light Green*/
'gdata16'=cx006C68 	'gcdata16'=cx006C68	'gndata16'=cx006C68	'gncdata16'=cx006C68/*Dark Turquoise*/
'gdata17'=cx00949O 	'gcdata17'=cx00949O	'gndata17'=cx00949O	'gncdata17'=cx00949O/*Light Turquoise*/
'gdata18'=cxFFC20E	'gcdata18'=cxFFC20E	'gndata18'=cxFFC20E	'gncdata18'=cxFFC20E /*Dark Yellow*/
'gdata19'=cxFFE100 	'gcdata19'=cxFFE100	'gndata19'=cxFFE100	'gncdata19'=cxFFE100/*Light Yellow*/
'gdata20'=cxE92076	'gcdata20'=cxE92076	'gndata20'=cxE92076	'gncdata20'=cxE92076 /*Dark Grey*/
'gdata21'=cx9E9E98	'gcdata21'=cx9E9E98	'gndata21'=cx9E9E98	'gncdata21'=cx9E9E98 /*Light Grey*/;
class GraphFit /
contrastcolor = GraphColors('gcfit')
color = GraphColors('gfit');
class GraphData1 / linestyle=1 markersymbol="circlefilled";
class GraphData2 / linestyle=1 markersymbol="circlefilled";
class GraphData3 / linestyle=1 markersymbol="circlefilled";
class GraphData4 / linestyle=1 markersymbol="circlefilled";
class GraphData5 / linestyle=1 markersymbol="circlefilled";
class GraphData6 / linestyle=1 markersymbol="circlefilled";
class GraphData7 / linestyle=1 markersymbol="circlefilled";
class GraphData8 / linestyle=1 markersymbol="circlefilled";
class GraphData9 / linestyle=1 markersymbol="circlefilled";
class GraphData10 / linestyle=1 markersymbol="circlefilled";
class GraphData11 / linestyle=1 markersymbol="circlefilled";
class GraphData12 / linestyle=1 markersymbol="circlefilled";
class usertext from systemtitle / font=("Arial",11pt);
style paragraph from usertext;
class table / bordercolor=black borderwidth=2pt borderleftwidth=1pt borderrightwidth=1pt rules=groups;
class celldata /
         fontfamily="Arial"
		 fontsize= 10pt;
		style data / font_face = "Arial" font_size =10pt;
		style header/font_face="Arial" font_size = 10pt font_weight=bold;
style GraphFonts /    
 'GraphDataFont'=("Arial",9pt)
 'GraphUnicodeFont'=("Arial",9pt)
 'GraphValueFont'=("Arial",9pt)
 'GraphLabelFont'=("Arial",10pt)
 'GraphFootnoteFont'=("Arial",10pt,italic)
 'GraphTitleFont'=("Arial",11pt,bold)
 'GraphAnnoFont'=("Arial",10pt);

end;
run;
quit;

proc template;
define style styles.mskcontrast;
parent=styles.sasdocprinter;
class GraphDataDefault /
         endcolor = GraphColors("gdata2")
         neutralcolor = GraphColors("gdata11")
         startcolor = GraphColors("gdata1")
         markersize = 6pt
         markersymbol = "circlefilled"
         linethickness = 2px
         linestyle = 1
         contrastcolor = GraphColors("gcdata1")
         color = GraphColors("gdata1");
class GraphColors/
'gdatadefault'=cx007CBA 'gcdatadefault'=cx007CBA /*MSK Blue*/
'gfit'=cx007CBA 		'gcfit'=cx007CBA 		/*MSK Blue*/
'gdata'=cx007CBA 		'gdata'=cx007CBA 		/*MSK Blue*/
'gdata1'=cx007CBA	'gcdata1'=cx007CBA	'gndata1'=cx007CBA	'gncdata1'=cx007CBA /*MSK Blue*/
'gdata2'=cxDF4602	'gcdata2'=cxDF4602	'gndata2'=cxDF4602	'gncdata2'=cxDF4602 /*MSK Orange*/
'gdata3'=cx83276B	'gcdata3'=cx83276B	'gndata3'=cx83276B	'gncdata3'=cx83276B /*Dark Violet*/
'gdata4'=cx4C8B2B	'gcdata4'=cx4C8B2B	'gndata4'=cx4C8B2B	'gncdata4'=cx4C8B2B /*Dark Green*/
'gdata5'=cxE92076  'gcdata5'=cxE92076	'gndata5'=cxE92076	'gncdata5'=cxE92076/*Dark Magenta*/
'gdata6'=cx006C68 	'gcdata6'=cx006C68	'gndata6'=cx006C68	'gncdata6'=cx006C68/*Dark Turquoise*/
'gdata7'=cx9E9E98	'gcdata7'=cx9E9E98	'gndata7'=cx9E9E98	'gncdata7'=cx9E9E98 /*Dark Grey*/
'gdata8'=cxFFC20E	'gcdata8'=cxFFC20E	'gndata8'=cxFFC20E	'gncdata8'=cxFFC20E /*Dark Yellow*/
'gdata9'=cx40B4E5	'gcdata9'=cx40B4E5	'gndata9'=cx40B4E5	'gncdata9'=cx40B4E5 /*Medium Blue*/
'gdata10'=cxF29934	'gcdata10'=cxF29934	'gndata10'=cxF29934	'gncdata10'=cxF29934 /*Medium Orange*/
'gdata11'=cxB687B8 	'gcdata11'=cxB687B8	'gndata11'=cxB687B8	'gncdata11'=cxB687B8/*Light Violet*/
'gdata12'=cxA6CE39	'gcdata12'=cxA6CE39	'gndata12'=cxA6CE39	'gncdata12'=cxA6CE39 /*Light Green*/
'gdata13'=cxEF83CB	'gcdata13'=cxEF83CB	'gndata13'=cxEF83CB	'gncdata13'=cxEF83CB /*Light Magenta*/
'gdata14'=cx00949O 	'gcdata14'=cx00949O	'gndata14'=cx00949O	'gncdata14'=cx00949O/*Light Turquoise*/
'gdata15'=cx9E9E98	'gcdata15'=cx9E9E98	'gndata15'=cx9E9E98	'gncdata15'=cx9E9E98 /*Light Grey*/
'gdata16'=cxFFE100 	'gcdata16'=cxFFE100	'gndata16'=cxFFE100	'gncdata16'=cxFFE100/*Light Yellow*/
'gdata17'=cx8FC7EB	'gcdata17'=cx8FC7EB	'gndata17'=cx8FC7EB	'gncdata17'=cx8FC7EB /*Light Blue*/
'gdata18'=cxF6C65B 	'gcdata18'=cxF6C65B	'gndata18'=cxF6C65B	'gncdata18'=cxF6C65B /*Light Orange*/
'gdata19'=cx006098	'gcdata19'=cx006098	'gndata19'=cx006098	'gncdata19'=cx006098 /*Dark Blue*/
'gdata20'=cxC24DO0	'gcdata20'=cxC24DO0	'gndata20'=cxC24DO0	'gncdata20'=cxC24DO0 /*Dark Orange*/
'gdata21'=cxB1212D	'gcdata21'=cxB1212D	'gndata21'=cxB1212D	'gncdata21'=cxB1212D /*Red*/
;
class GraphFit /
contrastcolor = GraphColors('gcfit')
color = GraphColors('gfit');
class GraphData1 / linestyle=1 markersymbol="circlefilled";
class GraphData2 / linestyle=1 markersymbol="circlefilled";
class GraphData3 / linestyle=1 markersymbol="circlefilled";
class GraphData4 / linestyle=1 markersymbol="circlefilled";
class GraphData5 / linestyle=1 markersymbol="circlefilled";
class GraphData6 / linestyle=1 markersymbol="circlefilled";
class GraphData7 / linestyle=1 markersymbol="circlefilled";
class GraphData8 / linestyle=1 markersymbol="circlefilled";
class GraphData9 / linestyle=1 markersymbol="circlefilled";
class GraphData10 / linestyle=1 markersymbol="circlefilled";
class GraphData11 / linestyle=1 markersymbol="circlefilled";
class GraphData12 / linestyle=1 markersymbol="circlefilled";
class usertext from systemtitle / font=("Arial",11pt);
style paragraph from usertext;
class table / bordercolor=black borderwidth=2pt borderleftwidth=1pt borderrightwidth=1pt rules=groups;
class celldata /
         fontfamily="Arial"
		 fontsize= 10pt;
		style data / font_face = "Arial" font_size =10pt;
		style header/font_face="Arial" font_size = 10pt font_weight=bold;
style GraphFonts /    
 'GraphDataFont'=("Arial",9pt)
 'GraphUnicodeFont'=("Arial",9pt)
 'GraphValueFont'=("Arial",9pt)
 'GraphLabelFont'=("Arial",10pt)
 'GraphFootnoteFont'=("Arial",10pt,italic)
 'GraphTitleFont'=("Arial",11pt,bold)
 'GraphAnnoFont'=("Arial",10pt);

end;
run;
quit;
