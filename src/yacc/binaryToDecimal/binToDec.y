/* yacc program for binary to decimal conversion */
%{
   void yyerror(char *);
   #include <stdio.h>
   #include <stdlib.h>
%}
%union {int val;}
%start number
%token <val> binary
%type <val> left number

%%
number:     left    {$$ = $1; printf("The Decimal Value is %d.\n", $$);}
        ;
left:       left binary     {$$ = $1 * 2 + $2;}
        |   binary          {$$ = $1;}
;
%%

int main() {
	return yyparse();
}

void yyerror(char *s) {
	fprintf(stderr, "%s\n", s);
}