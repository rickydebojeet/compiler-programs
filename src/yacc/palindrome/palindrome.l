/* lex program for recognition of palindrome */
%{
	#include "y.tab.h"
%}
%%
[a-zA-Z]+		{yylval.string = yytext; return STR;}
[ \t\n]		    ;
.			    {ECHO; yyerror("Unexpected Character");}
%%
int yywrap() {
	return 1;
}