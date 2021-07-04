/* Lex Program that Checks a vaild arithmentc expression */
/* Definations */
%{
    /* standard io for io functions*/
    #include<stdio.h>
    int v = 0, op = 0, id = 0, flag = 0;
%}
/* Rules */
%%

[0-9 a-z A-z]+ {id++;printf("\n Identifier:\t");ECHO;}
[+ | - | / | = | *] {op++; printf("\n Operator:\t");ECHO;}
"(" {v++;}
")" {v--;}
";" {flag = 1;}
.|\n {;}
%%

int main()
{
    printf("Enter the expression \n");
    yylex();
    if((op+1) == id && v==0 && flag==0){
        printf("\nThe given Expression is valid\n");
        printf("\nThe bo. of Identifiers are %d\n",id);
        printf("\nThe no. of operators are %d\n",op);
    }
    else{
        printf("\nThe given Expresion is Invalid\n");
    }
    return 0;
}
int yywrap()
{
    return 1;
}