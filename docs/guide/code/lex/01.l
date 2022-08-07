/* Lex Program that copies a file, replacing each nonempty sequence of white space by a single blank */
/* Definations */
%{
	/* standard io for io functions, string.h for string functions and stdlib for exit()*/
	#include <stdio.h>  
	#include <string.h>
	#include <stdlib.h> 
	/* String variable to store string line by line*/
	char string[200];
%}

/* Rules */
/* Copy a line to the output file */
/* Replace sequence of white space by a single blank */
/* Copy everything else as it is to the line*/
/*Copy a line to the output file at the end*/
%%
[\n]		{fprintf(yyout, "%s\n", string); string[0] = '\0'; }
[ ]*		{fprintf(yyout, "%s", string); string[0] = '\0'; fprintf(yyout, "%s", " "); }
.			strcat(string, yytext);
<<EOF>>		{ fprintf(yyout, "%s", string); return 0; } 
%%

int main()
{
	extern FILE *yyin, *yyout;
	char filename[100]; 
	printf("This Program is going copy a file, replacing each nonempty sequence of white space by a single blank!\nEnter the name of the file to copy:\t");
	scanf("%s", filename);
	/* Opening file to read */
	yyin = fopen(filename, "r");
	if (yyin == NULL){
		printf("Cannot open file %s\n", filename);
	    exit(0);
	}
	printf("Enter the name of the file to open for writing:\t");
	scanf("%s", filename);
	/* Opening file to write */
	yyout = fopen(filename, "w");
	if (yyout == NULL){
		printf("Cannot open file %s\n", filename);
	    exit(1);
	}
	yylex();
}

int yywrap(void)
{
	return 1;
}