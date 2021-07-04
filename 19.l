/*lex program to find the length of a string*/
%{
  #include <stdio.h> 
  int  length;
%}
/* Rule Section */
/* Find length of a string */
/* Ignore everything else */
%%
.+ {length=yyleng; }
\n  ;
%%
  
int main()
 {
    printf("This Program  checks the length in an input text!\nEnter the input text\t");
    /*call the yylex function.*/
    yylex();
    printf("length of input text is : %d\n", length);
    return 0;
 }

/*call the yywrap function*/
int yywrap()					
{
	return 1;
}
