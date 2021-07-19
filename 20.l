/*  Lex program to reverse all the words in an input text. */
/* Definations */
%{
	/* standard io for io functions and strigs.h for strings*/
	#include <stdio.h>
	#include <string.h> 
	/* Counter variables */
	int small=9999, len;
	char string[200], word[200];
%}

/* Rules */

%%
[a-zA-Z0-9]+    {
    for(int i = yyleng - 1; i >= 0; i--) {
        printf("%c", yytext[i]);
    }
}
.|\n    ECHO;

%%

int main()
{
	printf("This Program reverses all the words in an input text.\n");
	/*call the yylex function.*/
	yylex();					
	return 0;
}

/*call the yywrap function*/
int yywrap()					
{
	return 1;
}