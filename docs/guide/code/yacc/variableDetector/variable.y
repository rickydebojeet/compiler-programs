/* yacc program for recognition of valid variable */
%{
   void yyerror(char *);
   #include <stdio.h>
   #include <stdlib.h>
%}

/* yacc defitions */
%union {char* exp;}
%start lines
%token <exp> identifier 
%token newline
%token exit_command
%type <exp> lines

/* Grammar Rules with Actions */
%%
lines:  
    |   lines identifier newline            {printf("Valid Expression %s\n>> ", $2);}
    |   lines exit_command                  {exit(EXIT_SUCCESS);}
    ;
%%

/* main function */
int main() {
    printf("Checks a valid variable\n");
    printf("Reserved keywords: exit, quit\n");
    printf(">> ");
	return yyparse();
}

void yyerror(char *s) {
	fprintf(stderr, "%s\n", s);
    exit(1);
}