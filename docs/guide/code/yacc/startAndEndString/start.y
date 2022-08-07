/* yacc program for recognition of string */
%{
   void yyerror(char *);
   #include <stdio.h>
   #include <stdlib.h>
%}

/* yacc definations */
%start lines
%token str
%token newline
%token exit_command

/* Grammar Rules with actions */
%%
lines:  
    |   lines S newline             {;}
    |   lines exit_command          {exit(EXIT_SUCCESS);}
    ;
S:      '0' A '1'                   {printf("The string is detected\n>> ");}
    ;
A:      str                         {;}
    ;
%%

/* main function */
int main() {
    printf("String Chechker built using YACC and LEX\n");
    printf("Reserved keywords: exit, quit\n");
    printf(">> ");
	return yyparse();
}

void yyerror(char *s) {
	fprintf(stderr, "%s\n", s);
    exit(1);
}