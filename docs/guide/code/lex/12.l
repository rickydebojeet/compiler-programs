/* Lex program to identify all the numbers in an input text and then perform the sum of the numbers. */
/* Definition Section */
digits [0-9]+|([0-9]*)"."([0-9]+)
%{
	#include <stdio.h>
	#include <stdlib.h>
    float sum = 0, a;
%}


/* Rule Section */
%%
{digits} {printf("Number: %s\n", yytext); sum += atof(yytext);} 
.   ;
\n 	{printf("Sum : %f\n", sum); sum = 0;}
%%

int main()
{
    yylex();					
	return 0;
}

/*call the yywrap function*/
int yywrap()					
{
	return 1;
}