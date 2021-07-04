/* Lex program which will modify the words in the following way: */
/* If the first letter is a consonant, move it to the end of the word and then add ay. */
/* If the first letter is a vowel, just add ay to the end of the word. */
/* Definations */
consonant [b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z]
vowel [aeiouAEIOU]
letter [a-zA-Z]
%{
	/* Standard io for io functions */
	#include <stdio.h> 
%}

/* Rules */
/* If the first letter is a vowel, just add ay to the end of the word. */
/* If the first letter is a consonant, move it to the end of the word and then add ay. */
/* Leave everything as it is */
%%
{vowel}({letter})*		{printf("%say", yytext);}
{consonant}({letter})*	{printf("%s%cay", yytext+1, yytext[0]);}
.						ECHO;
\n 						ECHO;
%%

int main()
{
	yylex();
	return 0;
}

int yywrap(void)
{
	return 1;
}
