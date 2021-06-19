/* lex program to find out all the tokens input C program. */
/* Definition Section */
digit [0-9]
letter [a-zA-Z]
%{
	#include <stdio.h>
	#include <stdlib.h>
%}


/* Rule Section */
/* Token specification */
%%
"int"	printf("Token: INT\n");
"("		printf("Token: (\n");
")"		printf("Token: )\n");
"{"		printf("Token: {\n");
"}"		printf("Token: }\n");
";"		printf("Token: End of Statement\n");
"//".* 	;
"return" printf("Token: RETURN\n");
","		printf("Token: , operator\n");
"="		printf("Token: assignment operator\n");
{letter}({letter}|{digit})*	printf("Token: identifier\n");
{digit}+ printf("Token: Integer value\n");
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
	return 0;
}

/*call the yywrap function*/
int yywrap()					
{
	return 1;
}