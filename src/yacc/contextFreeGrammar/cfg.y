/* yacc program for recognition of context free grammar */
%{
   void yyerror(char *);
   #include <stdio.h>
   #include <stdlib.h>
%}

%start A

%%
A:      S           {printf("The String belongs to the CFG.\n");}
    ;
S:      'b' S 'a'   {;}
    |   'b' 'a'     {;}
    ;
%%

int main() {
	return yyparse();
}

void yyerror(char *s) {
	fprintf(stderr, "%s\n", s);
}