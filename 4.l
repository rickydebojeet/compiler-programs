/*Definition Section*/
%{
#include<stdio.h>
%}


/*Rule Section*/
%%
/*Check the token, if token is match with 
pattern then it will print identifier.*/
([a-zA-Z][0-9])+|[a-zA-Z]* {printf("Identifier\n");}   

^[0-9]+ {printf("Not a Identifier\n");}

.|\n; 
%%

/*call the yywrap function*/
int yywrap()					
{
return 1;
}

/*Auxiliary function*/
/*Driver function*/
int main(void)
{
/*call the yylex function.*/
yylex();						
return 0;
}