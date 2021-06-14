/* Lex Program that copies a file, replacing each nonempty sequence of white space by a single blank */
%%
[ ]*	printf(" "); /* Replace sequence of white space by a single blank */	
.	ECHO; /* Copy everything else as it is */
\n 	ECHO;
%%

int main()
{
	yylex();
	return 0;
}
