/* Write a Lex program to count the number of comment lines in a c program. Also eliminate that comment line (Input read from file). */
/* Definition Section */
%{
	#include <stdio.h>
	#include <stdlib.h>
	int counter;
%}


/* Rule Section */
/* Check the identifier */
/* Ignore everything else */
%%
[/][*][^*]*[*]+([^*/][^*]*[*]+)*[/]		counter ++;
.|\n 									ECHO;
%%


int main()
{
	extern FILE *yyin;
	char filename[100]; 
	printf("This Program program counts the number of comment!!\nEnter the name of the file to read:\t");
	scanf("%s", filename);
	/* Opening file to read */
	yyin = fopen(filename, "r");
	if (yyin == NULL){
		printf("Cannot open file %s\n", filename);
	    exit(0);
	}
	/*call the yylex function.*/
	yylex();
	printf("\nNumber of comments: %d\n", counter);						
	return 0;
}

/*call the yywrap function*/
int yywrap()					
{
	return 1;
}