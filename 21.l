/*  Lex program to find the smallest word in an input text */
/* Definations */
%{
	/* standard io for io functions and stdlib for exit()*/
	#include <stdio.h> 
	/* Counter variables */
	int small=1;
%}

/* Rules */
/* Count small */
/* Ignore everything else */
%%
[a-z A-Z]+{
    if(small >yylen){
        small = yylen;
    }
};
.|\n 	;

%%

int main()
{
    char input[500];
	printf("This Program  finds the smallest word in the input text\nEnter the text\t");
	/*call the yylex function.*/
	yylex();
    printf("\n The smallest word is of %d\n", small);					
	return 0;
}

/*call the yywrap function*/
int yywrap()					
{
	return 1;
}