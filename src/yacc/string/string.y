/* yacc program for recognition of string */
%{
   void yyerror(char *);
   #include <stdio.h>
   #include <stdlib.h>
%}

%start S

%%
S:      A B                     {printf("The string is detected\n");}
    ;
A:      A 'a'                   {;}
    |   'a' 'a' 'a' 'a' 'a'     {;}
    ;
B:      'b' 'b'                 {;}
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