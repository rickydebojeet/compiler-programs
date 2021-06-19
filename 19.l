/*lex program to find the length of a string*/
%{
  #include<stdio.h> 
  int  length;
%}
/* Rule Section */
/* Check the stopwords */
/* Ignore everything else */
%%
[a-z A-Z 0-9]+ {length=yyleng; }
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
