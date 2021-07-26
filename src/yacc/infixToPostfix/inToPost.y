/* yacc program for conversion of infix to postfix */
%{
   void yyerror(char *);
   #include <stdio.h>
   #include <stdlib.h>
%}

/* yacc definations */
%union {int number;}
%start lines
%token <number> num
%token newline
%token exit_command

/* Grammar definations with actions */
%%
lines:  
    |   lines E newline     {;}
    |   lines exit_command  {exit(EXIT_SUCCESS);}
    ;
E:      E '+' T             {printf("+");}
    |   E '-' T             {printf("-");}
    |   T                   {;}
    ;
T:      T '*' F             {printf("*");}
    |   T '/' F             {printf("/");}
    |   F                   {;}
    ;
F:      num                 {printf("%d", $1);}
    ;
%%

/* main function */
int main() {
	return yyparse();
    return 0;
}

void yyerror(char *s) {
	fprintf(stderr, "%s\n", s);
    exit(1);
}