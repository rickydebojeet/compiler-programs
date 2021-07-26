/* yacc program for recognition of context free grammar */
%{
   void yyerror(char *);
   #include <stdio.h>
   #include <stdlib.h>
%}

/* yacc definations */
%start A
%token newline
%token exit_command

/* Grammar definations with actions */
%%
A:      
    |   A S newline     {printf("The String belongs to the CFG.\n>> ");}
    |   A exit_command  {exit(EXIT_SUCCESS);}
    ;
S:      'b' S 'a'       {;}
    |   'b' 'a'         {;}
    ;
%%

/* main function */
int main() {
    printf("Recognition of context free grammar built using YACC and LEX\n");
    printf("Reserved keywords: exit, quit\n");
    printf(">> ");
	return yyparse();
}

void yyerror(char *s) {
	fprintf(stderr, "%s\n", s);
}