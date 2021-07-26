/* yacc program for binary to decimal conversion */
%{
   void yyerror(char *);
   #include <stdio.h>
   #include <stdlib.h>
%}

/* yacc declaration */
%union {int val;}
%start lines
%token <val> binary
%token newline
%token exit_command
%type <val> left lines

/* Grammar rules with actions */
%%
lines:     
	|	lines left newline	{$$ = $2; printf("The Decimal Value is %d.\n>> ", $$);}
	|	lines exit_command	{exit(EXIT_SUCCESS);}
    ;
left: 	left binary     	{$$ = $1 * 2 + $2;}
    |   binary          	{$$ = $1;}
;
%%
/* main function */
int main() {
	printf("Conversion of binary to decimal built using YACC and LEX\n");
    printf("Reserved keywords: exit, quit\n");
    printf(">> ");
	return yyparse();
}

void yyerror(char *s) {
	fprintf(stderr, "%s\n", s);
}