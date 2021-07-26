/* yacc program for evaluation of expression */
%{
   void yyerror(char *);
   #include <stdio.h>
   #include <stdlib.h>
   #include <string.h>
%}
/* yacc definations */
%union {int val;}
%start lines
%token <val> number  
%token newline
%token exit_command
%type <val> expe expt expf lines

/* Grammar Definations with actions */
%%
lines:  
    |   lines expe newline      {printf("%d\n>> ", $2);}
    ;
expe:   expe '+' expt           {$$ = $1 + $3;}
    |   expe '-' expt           {$$ = $1 - $3;}
    |   expt                    {$$ = $1;}
    ;
expt:   expt '*' expf           {$$ = $1 * $3;}
    |   expt '/' expf           {$$ = $1 / $3;}
    |   expf                    {$$ = $1;}
    ;
expf:   '(' expe ')'            {$$ = $2;}
    |   number                  {$$ = $1;}
    |   exit_command            {exit(EXIT_SUCCESS);}
    ;
%%

/* main function */
int main() {
    printf("Evaluation of arithmetic expression built using YACC and LEX\n");
    printf("Reserved keywords: exit, quit\n");
    printf(">> ");
	return yyparse();
}

void yyerror(char *s) {
	fprintf(stderr, "%s\n", s);
    exit(1);
}