/* Lex program to count the number of vowels and consonants from an input file and write the results to a file. */
/* Definations */
consonant [b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z]
vowel [aeiouAEIOU]
%{
	/* standard io for io functions and stdlib for exit()*/
	#include <stdio.h>
	#include <stdlib.h> 
	/* Counter variables */
	int vcounter, ccounter;
%}

/* Rules */
/* Count vowels */
/* Count consonants */
/* Ignore everything else */
%%
{vowel}		vcounter++;
{consonant}	ccounter++;
.			;
\n 			;
%%

int main()
{
	extern FILE *yyin, *yyout;
	char filename[100]; 
	printf("This Program program counts the number of vowels and consonants from an input file and write the results to a file!\nEnter the name of the file to read:\t");
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
	fprintf(yyout, "Vowels: %d\nConsonants: %d", vcounter, ccounter);
	return 0;
}

int yywrap(void)
{
	return 1;
}