/* Lex program to count the number of tokens and find out all the tokens from input C program. */
/* Definition Section */
digit [0-9]
letter [a-zA-Z]
%{
	#include <stdio.h>
	#include <stdlib.h>
    int counter = 0;
%}


/* Rule Section */
/* Token specification */
%%
\"(\\.|[^"\\])*\"   {printf("Token: string\n"); counter++;}
"int"	{printf("Token: INT\n"); counter++;}
"("		{printf("Token: (\n"); counter++;}
")"		{printf("Token: )\n"); counter++;}
"{"		{printf("Token: {\n"); counter++;}
"}"		{printf("Token: }\n"); counter++;}
";"		{printf("Token: End of Statement\n"); counter++;}
"//".* 	;
"return" {printf("Token: RETURN\n"); counter++;}
","		{printf("Token: , operator\n"); counter++;}
"="		{printf("Token: assignment operator\n"); counter++;}
"+"     {printf("Token: addition operator\n"); counter++;}
{letter}({letter}|{digit})*	{printf("Token: identifier\n"); counter++;}
{digit}+ {printf("Token: Integer value\n"); counter++;}
.|\n 	;
%%
int main()
{
    extern FILE *yyin;
	char filename[100]; 
	printf("This Program program finds all tokens!!\nEnter the name of the file to read:\t");
	scanf("%s", filename);
	/* Opening file to read */
	yyin = fopen(filename, "r");
	if (yyin == NULL){
		printf("Cannot open file %s\n", filename);
	    exit(0);
	}
	/*call the yylex function.*/
	yylex();
    printf("Token count: %d\n", counter);					
	return 0;
}

/*call the yywrap function*/
int yywrap()					
{
	return 1;
}