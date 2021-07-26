%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "y.tab.h"
%}
IDENTIFIER [_a-zA-Z][_a-zA-Z0-9]*
%%
exit.*          {return exit_command;}
quit.*          {return exit_command;}
{IDENTIFIER}    {yylval.exp = strdup(yytext); return identifier;}
\n              {return newline;}
.               {ECHO; yyerror("Unexpected Character");}
%%
int yywrap() {
	return 1;
}