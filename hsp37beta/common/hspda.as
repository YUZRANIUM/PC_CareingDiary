
;	hspda.dll header
;

#ifndef __HSPDA__
	#define global __HSPDA__

#cmpopt varname 1

#uselib "hspda.dll"

#func global csvstr csvstr $202
#func global csvnote csvnote $87

#func global xnotesel xnotesel $202
#func global xnoteadd xnoteadd $202

#func global rndf_ini rndf_ini $202
#func global rndf_get rndf_get $202
#func global rndf_geti rndf_geti $202

#func global csvsel csvsel 1
#func global csvres csvres $83
#func global csvflag csvflag 0
#func global csvopt csvopt 0
#func global csvfind csvfind 6

#define CCSV_OPT_NOCASE 1
#define CCSV_OPT_ANDMATCH 2
#define CCSV_OPT_ZENKAKU 4
#define CCSV_OPT_ADDLINE 8
#define CCSV_OPT_EXPRESSION 128

#func global getvarid getvarid $202
#func global getvarname getvarname $202
#func global getmaxvar getmaxvar $202
#func global vsave vsave $202
#func global vload vload $202
#func global vsave_start vsave_start $202
#func global vsave_put vsave_put $202
#func global vsave_end vsave_end $202
#func global vload_start vload_start $202
#func global vload_get vload_get $202
#func global vload_end vload_end $202

#func global binmatch binmatch $202

#endif // __HSPDA__
