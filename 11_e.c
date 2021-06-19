//C program to implement the transition diagram for relational operators

#include <stdio.h>
#include <string.h>

int dfa = 0;
  
void start(char c)
{
    if (c == '<') {
        dfa = 1;
    }
    else if (c == '=') {
        dfa = 5;
    }
    else if (c == '>') {
        dfa = 6;
    }
    // -1 is used to check for any invalid symbol
    else {
        dfa = -1;
    }
}
  
// This function is for the first state (Q1) of DFA
void state1(char c)
{
    if (c == '=') {
        dfa = 2;
    }
    else if (c == '>') {
        dfa = 3;
    }
    else {
        dfa = 4;
    }
}
  
// This function is for the second state (Q2) of DFA
void state6(char c)
{
    if (c == '=') {
        dfa = 7;
    }
    else {
        dfa = 8;
    }
}
  
  
int isAccepted(char str[])
{
    // store length of string
    int i, len = strlen(str);
  
    for (i = 0; i <= len; i++) {
        if (dfa == 0)
            start(str[i]);
        else if (dfa == 1)
            state1(str[i]);
  
        else if (dfa == 2){
            printf("RELOP, LE");
            return 2;
        }
            
  
        else if (dfa == 3) {
            printf("RELOP, NE");
            return 3;
        }
            
  
        else if (dfa == 4) {
            printf("RELOP, LT");
            return 4;
        }

        else if (dfa == 5) {
            printf("RELOP, EQ");
            return 5;
        }

        else if (dfa == 6) {
            state6(str[i]);
            return 6;
        }

        else if (dfa == 7) {
            printf("RELOP, GE");
            return 7;
        }
        
            
        else if (dfa == 8) {
            printf("RELOP, GT");
            return 8;
        }

        else {
            printf("ERROR");
            return -1;
        }

    }
}
  
// driver code
int main()
{
    char str[100];
    printf("Input:\t");
    scanf("%s", str);
    isAccepted(str);
    return 0;
}