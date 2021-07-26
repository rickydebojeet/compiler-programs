%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "y.tab.h"
%}
INTEGER    [0-9]+
IDENTIFIER [_a-zA-Z][_a-zA-Z0-9]*
%%
exit.*          {return exit_command;}
quit.*          {return exit_command;}
{INTEGER}       {yylval.exp = strdup(yytext); return integer;}
{IDENTIFIER}    {yylval.exp = strdup(yytext); return identifier;}
[+-]            {yylval.exp = strdup(yytext); return opr1;}
[/*]            {yylval.exp = strdup(yytext); return opr2;}
[()]            {return yytext[0];}
\n              {return newline;}
.               {ECHO; yyerror("Unexpected Character");}
%%
int yywrap() {
	return 1;
}