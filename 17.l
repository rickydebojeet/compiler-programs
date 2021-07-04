/* Lex program to count the number of palindromes present in a input text and write them to a separate text file */

%{
    #include<stdio.h> 
    #include <stdlib.h>
    int i, len, counter;
%}

/* Rule Section */
/* Count palindrome */
/* Ignore everything else */
%%
[a-zA-Z0-9]+ {
	len=strlen(yytext);
	for(i=0;i<len;i++)
	{
		if(yytext[i]!=yytext[len-1-i])
		  break;
	}
	if(i==len)
	  counter++;
};
. ;
\n ;
%%
  
int main()
{
	extern FILE *yyin, *yyout;
	char filename[100]; 
	printf("This Program program counts the number of palindromes from an input file and and  shows the output\nEnter the name of the file to read:\t");
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
	fprintf(yyout, "Palindromes: %d\n", counter);
	return 0;
}

int yywrap(void)
{
	return 1;
}