/* yacc program for recognition of palindrome */
%{
   void yyerror(char *);
   #include <stdio.h>
   #include <stdlib.h>
   #include <string.h>
   int flag, k, i;
%}

%union {char *string;}
%start S
%token <string> STR 
%type <string> E S

%%
S:      E           {
                        flag = 0;
                        k = strlen($1) - 1;
                        if(k%2==0){   
                            for (i = 0; i <= k/2; i++) {
                                if ($1[i] == $1[k-i]) {} 
                                else {
                                    flag = 1;
                                }
                            }
                            if (flag == 1) printf("Not palindrome\n");
                            else printf("palindrome\n");
                            printf("%s\n", $1);
                        } else {
                            for (i = 0; i < k/2; i++) {
                                if ($1[i] == $1[k-i]) {} 
                                else {
                                    flag = 1;
                                }
                            }
                            if (flag == 1) printf("Not palindrome\n");
                            else printf("palindrome\n");
                            printf("%s\n", $1);
                        }
                    }
    ;
E:      STR         {$$ = $1;}
    ;
%%

int main() {
	return yyparse();
    return 0;
}

void yyerror(char *s) {
	fprintf(stderr, "%s\n", s);
    exit(1);
}