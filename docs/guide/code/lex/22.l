/* Lex Program to Convert Lowercase Characters to Uppercase. */
/* Definations */
lower [a-z]
%{
    /* standard io for io functions */
    #include <stdio.h>
%}

/* Rules */
/* Convert Lowercase to uppercase */
/* Ignore everything else */
%%
{lower} {printf("%c",yytext[0]-32);}
\n      ECHO;
.       ECHO;
%%
  
int main()
{
    printf("This Program convert Lowercase Characters to Uppercase\nEnter the input text\t");
    yylex();
    return 0;
}

/*call the yywrap function*/
int yywrap()					
{
	return 1;
}