/* lex program for recognition of string */
%{
	#include "y.tab.h"
%}
%%
[ba]		{return yytext[0];}
[ \t\n]		    ;
.			    {ECHO; yyerror("Unexpected Character");}
%%
int yywrap() {
	return 1;
}