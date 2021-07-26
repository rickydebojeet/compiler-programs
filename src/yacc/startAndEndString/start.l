/* lex program for recognition of string */
%{
	#include "y.tab.h"
%}
%%
[01]                {return yytext[0];}
[a-zA-Z2-9]+	    {return str;}
[ \t\n]		        ;
.			        {ECHO; yyerror("Unexpected Character");}
%%
int yywrap() {
	return 1;
}