/* yacc program for recognition of string */
%{
   void yyerror(char *);
   #include <stdio.h>
   #include <stdlib.h>
%}

%start S
%token str

%%
S:      '0' A '1'                   {printf("The string is detected\n");}
    ;
A:      str                         {;}
    ;
%%

int main() {
	return yyparse();
    return 0;
}

void yyerror(char *s) {
	fprintf(stderr, "%s\n", s);
    exit(1);
}