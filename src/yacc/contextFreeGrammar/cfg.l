/* lex program for recognition of contxt free grammar */
%{
	#include "y.tab.h"
%}
%%
[ba]		{return yytext[0];}
[ \t\n]		;
.			{ECHO; yyerror("Unexpected Character");}
%%
int yywrap() {
	return 1;
}