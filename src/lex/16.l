/* Lex program to implement a simple calculator. */
/* Definition Section */
%{
    /* Standard io for io functions, string.h for string functions and stdlib for exit()*/
    #include <stdio.h>
    #include <string.h>
    #include <stdlib.h>
    /* String variable to store string line by line*/
    int op = 0, i;
    float a, b;
    void calculate();
%}
digits [0-9]+|([0-9]*)"."([0-9]+)
addition "+"
subtraction "-"
multiplication "*"
division "/"
power "^"
endofline \n

/* Rule Section */
%%
{digits} {calculate();} 
{addition} {op=1;}
{subtraction} {op=2;}
{multiplication} {op=3;}
{division} {op=4;}
{power} {op=5;}
{endofline} {printf("Answer :%f\n\n",a);}


%%
void calculate()
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

int main()
{
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}
