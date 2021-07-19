/* Lex program to count the number "The" in a input text */
/* Definations */
the ("the"|"The"|"THE")
%{
	/* standard io for io functions and stdlib for exit()*/
	#include <stdio.h>
	#include <stdlib.h> 
	/* Counter variables */
	int count;
%}

/* Rules */
/* Count "the" */
/* Ignore everything else */
%%
{the}		count++;
.|\n 	;

%%

int main()
{
    char input[500];
	printf("This Program  counts the number of \"the\" present in the input text\nEnter the text\t");
	/*call the yylex function.*/
	yylex();
    printf("\nNumber of the: %d\n", count);					
	return 0;
}

/*call the yywrap function*/
int yywrap()					
{
	return 1;
}