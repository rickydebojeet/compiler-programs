/* yacc program for conversion of infix to postfix */
%{
   void yyerror(char *);
   #include <stdio.h>
   #include <stdlib.h>
%}

%union {int number;}
%start E
%token <number> num 
%type <number> F T E

%%
E:      E '+' T         {printf("+");}
    |   T               {;}
    ;
T:      T '*' F         {printf("*");}
    |   F               {;}
    ;
F:      num             {printf("%d", $1);}
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