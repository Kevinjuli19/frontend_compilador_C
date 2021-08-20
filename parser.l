%{
int yylineno;
%}

alpha [A-Za-z]
digit [0-9]


%%
[ \t] ;
\n	{yylineno++;}
"{"	{scope_start(); return '{';}
"}"	{scope_end(); return '}';}
";"	     {   return(';'); }
","	     {   return(','); }
":"	     {   return(':'); }
"="	     {   return('='); }
"("	     {   return('('); }
")"	     {   return(')'); }
("[") 	     {   return('['); }
("]")        {   return(']'); }
"."	     {   return('.'); }
"&"	     {   return('&'); }
"!"	     {   return('!'); }
"~"	     {   return('~'); }
"-"	     {   return('-'); }
"+"	     {   return('+'); }
"*"	     {   return('*'); }
"/"	     {   return('/'); }
"%"	     {   return('%'); }
"<"	     {   return('<'); }
">"	     {   return('>'); }
"^"	     {   return('^'); }
"|"	     {   return('|'); }
"?"	     {   return('?'); }
entero	{yylval.ival = ENTERO; return ENTERO;}
flotante	{yylval.ival = FLOTANTE; return FLOTANTE;}
vacio	{yylval.ival = VACIO; return VACIO;}
sino	{return SINO;}
hacer	return HACER;
si	return SI;
estructura 	return ESTRUCTURA;
^"#incluir ".+	return PREPROC;
mientras	return MIENTRAS;
para	return PARA;
devolver 	return DEVOLVER;
imprimir	return IMPRIMIR;
{alpha}({alpha}|{digit})* {yylval.str=strdup(yytext); return ID;}
{digit}+	{yylval.str=strdup(yytext);return NUM;}
{digit}+\.{digit}+ 	{yylval.str=strdup(yytext); return REAL;}
"<="		return LE;
">="		return GE;
"=="		return EQ;
"!="		return NEQ;
"&&"		return AND;
"||"		return OR;
\/\/.* ;
\/\*(.*\n)*.*\*\/ ;

\".*\"	return STRING;
.	return yytext[0];
%%
