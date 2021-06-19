/*lex program to implement
		- a simple calculator.*/

%{
/* standard io for io functions, string.h for string functions and stdlib for exit()*/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
    /* String variable to store string line by line*/
    int op = 0, i;
    float a, b;
%}
dig [0-9]+|([0-9]*)"."([0-9]+)
add "+"
sub "-"
mul "*"
div "/"
pow "^"
ln \n



/* digi() is a user defined function */
%%
  

{dig} {digi();} 
{add} {op=1;}
{sub} {op=2;}
{mul} {op=3;}
{div} {op=4;}
{pow} {op=5;}
{ln} {printf("\n The Answer :%f\n\n",a);}
  
%%
    digi()
{
    if (op == 0)

        /* atof() is used to convert - the ASCII input to float */
        a = atof(yytext);

    else
    {
        b = atof(yytext);

        switch (op)
        {
        case 1:
            a = a + b;
            break;

        case 2:
            a = a - b;
            break;

        case 3:
            a = a * b;
            break;

        case 4:
            a = a / b;
            break;

        case 5:
            for (i = a; b > 1; b--)
                a = a * i;
            break;
        }
        op = 0;
    }
}

main(int argv, char *argc[])
{
    yylex();
}

yywrap()
{
    return 1;
}
