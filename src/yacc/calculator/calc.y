/* yacc program for simple calculator */
%{
   void yyerror(char *);
   #include <stdio.h>
   #include <stdlib.h>
   int symbols[52];
   int symbolVal(char);
   void updateSymbolVal(char, int);
%}

%union {int num; char id;}
%start line
%token print
%token exit_command
%token <num> number
%token <id> identifier
%type <num> line exp term
%type <id> assignment

%%
line:       assignment ';'    {;}
         |  exit_command ';'  {exit(EXIT_SUCCESS);}
         |  print exp ';'     {printf("Printing %d\n", $2);}
         |  line assignment ';'  {;}
         |  line print exp ';'   {printf("Printing %d\n", $3);}
         |  line exit_command ';'   {exit(EXIT_SUCCESS);}
         ;
assignment: identifier '=' exp   {updateSymbolVal($1, $3);}
         ;
exp:        term  {$$ = $1;}
         |  exp '+' term   {$$ = $1 + $3;}
         |  exp '-' term   {$$ = $1 - $3;}
         ;
term:       number   {$$ = $1;}
         |  identifier  {$$ = symbolVal($1);}
         ;
%%

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

int symbolVal(char symbol) {
   int bucket = computeSymbolIndex(symbol);
   return symbols[bucket];
}

void updateSymbolVal(char symbol, int val) {
   int bucket = computeSymbolIndex(symbol);
   symbols[bucket] = val;
}

int main() {
	int i;
	for(i = 0; i < 52; i++) {
		symbols[i] = 0;
	}
	return yyparse();
}

void yyerror(char *s) {
	fprintf(stderr, "%s\n", s);
}