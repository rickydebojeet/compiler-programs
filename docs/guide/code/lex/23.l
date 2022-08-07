/*  Lex program to sort all the words in an input text as per their length. */
/* Definations */
%{
	/* standard io for io functions and strigs.h for strings*/
	#include <stdio.h>
	#include <string.h>
    #include <stdlib.h>

    int compare(const void *,  const void *); 
    char str[20][40];
    int i = 0, n;
%}

/* Rules */

%%
[a-zA-Z0-9]* {
    strcpy(str[i], yytext);
    i++;
}
.|\n    ;

%%

int main()
{
	printf("This Program sorts all the words in an input text as per their length.\n");
    printf("\nPlease enter number of words :\t");
    scanf("%d", &n);
	/*call the yylex function.*/
	yylex();
    qsort(str, (n - 1), 40, compare);
    for(int i = 0; i < n; i++) {
        printf("%s ", str[i]);
    }					
	return 0;
}


int compare (const void * a, const void * b) {
    size_t fa = strlen((const char *)a);
    size_t fb = strlen((const char *)b);
    return (fa > fb) - (fa < fb);
}

/*call the yywrap function*/
int yywrap()					
{
	return 1;
}