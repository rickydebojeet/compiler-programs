/* Lex program which will identify 8-bit binary input file */
/* Definition Section */
bit [0-1]
%{
	#include <stdio.h>
	#include <stdlib.h>
%}


/* Rule Section */
/* Check the input */
/* Ignore everything else */
%%
{bit}{bit}{bit}{bit}{bit}{bit}{bit}{bit}		printf("%s is a 8-bit Binary number\n", yytext);
{bit}+ 											printf("%s is not a 8-bit Binary number\n", yytext);
.|\n  											;  	
%%
int main()
{
    char input[100];
	printf("This Program  checks input is 8-bit binary number!\nEnter the binary number\t");
	/*call the yylex function.*/
	yylex();						
	return 0;
}

/*call the yywrap function*/
int yywrap()					
{
	return 1;
}
