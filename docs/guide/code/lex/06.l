/* Lex program to count the number of lines in a given input source file. */
%{
	/* standard io for io functions and stdlib for exit()*/
	#include <stdio.h>
	#include <stdlib.h> 
	/* Counter variables */
	int count;
%}

/* Rules */
/* Ignore everything else */
/* Count lines */
%%
.			;
\n 			count++;
%%

int main()
{
	extern FILE *yyin;
	char filename[100]; 
	printf("This Program program counts the number of lines present in an input file!\nEnter the name of the file to read:\t");
	scanf("%s", filename);
	/* Opening file to read */
	yyin = fopen(filename, "r");
	if (yyin == NULL){
		printf("Cannot open file %s\n", filename);
	    exit(0);
	}
	yylex();
	printf("Number of Lines %d\n", count+1);
	return 0;
}

int yywrap(void)
{
	return 1;
}