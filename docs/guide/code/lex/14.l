/* lex program to count the number of stopwords and remove all of them. */
/* Definition Section */
stopwords (" ourselves "|" hers  "|" between "|" yourself "|" but "|" again "|" there "|" about "|" once "|" during "|" out "|" very "|" having "|" with "|" they "|" own "|" an "|" be "|" some "|" for "|" do "|" its "|" yours "|" such "|" into "|" of "|" most "|" itself "|" other "|" off "|" is "|" s "|" am "|" or "|" who "|" as "|" from "|" him "|" each "|" the "|" themselves "|" until "|" below "|" are "|" we "|" these "|" your "|" his "|" through "|" don "|" nor "|" me "|" were "|" her "|" more "|" himself "|" this "|" down "|" should "|" our "|" their "|" while "|" above "|" both "|" up "|" to "|" ours "|" had "|" she "|" all "|" no "|" when "|" at "|" any "|" before "|" them "|" same "|" and "|" been "|" have "|" in "|" will "|" on "|" does "|" yourselves "|" then "|" that "|" because "|" what "|" over "|" why "|" so "|" can "|" did "|" not "|" now "|" under "|" he "|" you "|" herself "|" has "|" just "|" where "|" too "|" only "|" myself "|" which "|" those "|" i "|" after "|" few "|" whom "|" t "|" being "|" if "|" theirs "|" my "|" against "|" a "|" by "|" doing "|" it "|" how "|" further "|" was "|" here "|" than ")
%{
	#include <stdio.h>
	#include <stdlib.h>
	int counter;
%}

/* Rule Section */
/* Check the stopwords */
/* Ignore everything else */

%%
{stopwords}		{counter++;}
.|\n 		ECHO;
%%

int main()
{
	extern FILE *yyin;
	char filename[100]; 
	printf("This Program program counts the number of stopwords!!\nEnter the name of the file to read:\t");
	scanf("%s", filename);
	/* Opening file to read */
	yyin = fopen(filename, "r");
	if (yyin == NULL){
		printf("Cannot open file %s\n", filename);
	    exit(0);
	}
	/*call the yylex function.*/
	yylex();
	printf("\nNumber of stopwords: %d\n", counter);						
	return 0;
}

/*call the yywrap function*/
int yywrap()					
{
	return 1;
}
