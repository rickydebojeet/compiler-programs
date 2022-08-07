/* yacc program for recognition of string */
%{
   void yyerror(char *);
   #include <stdio.h>
   #include <stdlib.h>
%}

/* yacc definations */
%start lines
%token newline
%token exit_command

/* Grammar Rules with Actions */
%%
lines:
    |   lines S newline         {;}
    |   lines exit_command      {exit(EXIT_SUCCESS);}
    ;
S:      A B                     {printf("The string is detected\n>> ");}
    ;
A:      A 'a'                   {;}
    |   'a' 'a' 'a' 'a' 'a'     {;}
    ;
B:      'b' 'b'                 {;}
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