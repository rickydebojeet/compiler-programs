/* yacc program for simple calculator */
%{
   void yyerror(char *);
   #include <stdio.h>
   #include <stdlib.h>
   int symbols[52];
   int symbolVal(char);
   void updateSymbolVal(char, int);
%}

/* yacc definations */
%union {int num; char id;}
%start line
%token print
%token exit_command
%token <num> number
%token <id> identifier
%type <num> line expe expt expf
%type <id> assignment

/* Grammar definations with actions */
%%
line:       assignment ';'    {;}
         |  exit_command ';'  {exit(EXIT_SUCCESS);}
         |  print expe ';'     {printf("Printing %d\n", $2);}
         |  line assignment ';'  {;}
         |  line print expe ';'   {printf("Printing %d\n", $3);}
         |  line exit_command ';'   {exit(EXIT_SUCCESS);}
         ;
assignment: identifier '=' expe   {updateSymbolVal($1, $3);}
         ;
expe:       expe '+' expt     {$$ = $1 + $3;}
         |  expe '-' expt     {$$ = $1 - $3;}
         |  expt              {$$ = $1;}
         ;
expt:       expt '*' expf     {$$ = $1 * $3;}
         |  expt '/' expf     {$$ = $1 / $3;}
         |  expf              {$$ = $1;}
         ;
expf:       '(' expe ')'      {$$ = $2;}
         |  number            {$$ = $1;}
         |  identifier        {$$ = symbolVal($1);}
         ;
%%

/* This function computes the index value for a given character */
int computeSymbolIndex(char token) {
   int idx = -1;
   if(islower(token)) {
      idx = token - 'a' + 26;
   }
   else if(isupper(token)) {
      idx = token -'A';
   }
   return idx;
}

/* This function looks up the value of an identifier */
int symbolVal(char symbol) {
   int bucket = computeSymbolIndex(symbol);
   return symbols[bucket];
}

/* This function updates the value of an identifier */
void updateSymbolVal(char symbol, int val) {
   int bucket = computeSymbolIndex(symbol);
   symbols[bucket] = val;
}

/* main function */
int main() {
   /* Initialising all values of identifier as 0 */
	int i;
	for(i = 0; i < 52; i++) {
		symbols[i] = 0;
	}
   printf("Calculator built using YACC and LEX\n");
   printf("Reserved keywords: exit, print\n");
	return yyparse();
}

void yyerror(char *s) {
	fprintf(stderr, "%s\n", s);
}