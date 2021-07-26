/* lex program for conversion of infix to postfix */
%{
	#include "y.tab.h"
%}
%%
[0-9]+		{yylval.number = atoi(yytext); return num;}
[+*]        {return yytext[0];}
[ \t\n]		    ;
.			    {ECHO; yyerror("Unexpected Character");}
%%
int yywrap() {
	return 1;
}