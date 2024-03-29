/* lex program for conversion of binary to decimal */
%{
	/* generated by the yacc program */
	#include <stdio.h>
	#include <stdlib.h>
	#include "y.tab.h"
%}

/* Rules for syntax analyser */
%%
exit.*          {return exit_command;}
quit.*          {return exit_command;}
[01]			{yylval.val = atoi(yytext); return binary;}
\n              {return newline;}
[ \t]			;
.				{ECHO; yyerror("Unexpected Character");}
%%
int yywrap() {
	return 1;
}