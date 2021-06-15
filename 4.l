/* Definition Section */
digit [0-9]
letter [A-Za-z]
%{
	#include <stdio.h>
	#include <stdlib.h>
%}


/* Rule Section */
/* Check the token, if token is match with pattern then it will print identifier. */
%%

{letter}({letter}|{digit}|_)*		printf("Identifier is %s\n", yytext);
.|\n 								;
%%

/*call the yywrap function*/
int yywrap()					
{
	return 1;
}

/*Auxiliary function*/
/*Driver function*/
int main()
{
	extern FILE *yyin;
	char filename[100]; 
	printf("This Program program checks if it is identifier or not!\nEnter the name of the file to read:\t");
	scanf("%s", filename);
	/* Opening file to read */
	yyin = fopen(filename, "r");
	if (yyin == NULL){
		printf("Cannot open file %s\n", filename);
	    exit(0);
	}
	/*call the yylex function.*/
	yylex();						
	return 0;
}