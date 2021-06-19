//C program to implement the transition diagram for integer


#include <stdio.h>
#include <string.h>

int dfa = 0;
  
void start(char c)
{
    if (c == '+' || c == '-') {
        dfa = 1;
    }
    if (c == '0'|| c == '1' || c == '2' || c == '3' || c == '4'|| c == '5'|| c == '6' || c == '7' || c == '8' || c == '9') {
        dfa = 2;
    }
    // -1 is used to check for any invalid symbol
    else {
        dfa = -1;
    }
}
  
// This function is for the second state (Q2) of DFA
void state2(char c)
{
    if (c == '0'|| c == '1' || c == '2' || c == '3' || c == '4'|| c == '5'|| c == '6' || c == '7' || c == '8' || c == '9') {
        dfa = 2;
    }
    // -1 is used to check for any invalid symbol
    else {
        dfa = -1;
    }
}

void state1(char c)
{
    if (c == '0'|| c == '1' || c == '2' || c == '3' || c == '4'|| c == '5'|| c == '6' || c == '7' || c == '8' || c == '9') {
        dfa = 2;
    }
    // -1 is used to check for any invalid symbol
    else {
        dfa = -1;
    }
}
  
  
int isAccepted(char str[])
{
    // store length of string
    int i, len = strlen(str);
  
    for (i = 0; i < len; i++) {
        if (dfa == 0)
            start(str[i]);
        else if (dfa == 1) {
            state1(str[i]);
        }
        else if (dfa == 2) {
            state2(str[i]);
            return 1;
        }
        else {
            return 0;
        }

    }
    if (dfa == 2)
    {
        return 1;
    }
    else
        return 0;
    
}
  
// driver code
int main()
{
    char str[100];
    printf("Input:\t");
    scanf("%s", str);
    if (isAccepted(str))
        printf("Integer\n");
    else
        printf("Error\n");
    return 0;
}