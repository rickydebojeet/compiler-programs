/* lex program for conversion of binary to decimal */
%{
	#include "y.tab.h"
%}
%%
[01]		{yylval.val = atoi(yytext); return binary;}
[ \t\n]		;
.			{ECHO; yyerror("Unexpected Character");}
%%
int yywrap() {
	return 1;
}