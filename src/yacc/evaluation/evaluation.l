%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "y.tab.h"
%}
INTEGER    [0-9]+
%%
exit.*          {return exit_command;}
quit.*          {return exit_command;}
{INTEGER}       {yylval.val = atoi(yytext); return number;}
[+-/*()]        {return yytext[0];}
\n              {return newline;}
[ \t\n]		    ;
.               {ECHO; yyerror("Unexpected Character");}
%%
int yywrap() {
	return 1;
}