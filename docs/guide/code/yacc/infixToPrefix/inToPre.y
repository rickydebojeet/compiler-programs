/* yacc program for conversion of infix to prefix */
%{
   void yyerror(char *);
   #include <stdio.h>
   #include <stdlib.h>
   #include <string.h>
   char* concat( const char*, const char*, const char*);
%}

/* yacc definitions */
%union {char* exp;}
%start lines
%token <exp> integer 
%token <exp> identifier
%token <exp> opr1 
%token <exp> opr2 
%token newline
%token exit_command
%left opr1
%left opr2
%type <exp> expe expt expf lines

/* Grammar Definitions with actions */
%%
lines:  
    |   lines expe newline      {printf("%s\n>> ", $2);}
    ;
expe:   expe opr1 expt          {$$ = concat($2, $1, $3);}
    |   expt                    {$$ = $1;}
    ;
expt:   expt opr2 expf          {$$ = concat($2, $1, $3);}
    |   expf                    {$$ = $1;}
    ;
expf:   '(' expe ')'            {$$ = $2;}
    |   integer                 {$$ = concat(" ", $1, " ");}
    |   identifier              {$$ = concat(" ", $1, " ");}
    |   exit_command                    {exit(EXIT_SUCCESS);}
    ;
%%

/* main function */
int main() {
    printf("Infix to Prefix Converter built using YACC and LEX\n");
    printf("Reserved keywords: exit, quit\n");
    printf(">> ");
	return yyparse();
}

void yyerror(char *s) {
	fprintf(stderr, "%s\n", s);
    exit(1);
}

/* This function concatanates three string and returns it */
char* concat( const char* s1, const char* s2, const char* s3)
{
    int len = strlen(s1) + strlen(s2) + strlen(s3) + 1;
    char *s = malloc(sizeof(char)*len);

    int i=0;
    for(int j=0; s1[j]!='\0'; j++)
        s[i++] = s1[j];
    for(int j=0; s2[j]!='\0'; j++)
        s[i++] = s2[j];
    for(int j=0; s3[j]!='\0'; j++)
        s[i++] = s3[j];

    s[i] = '\0';

    return s;
}