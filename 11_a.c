//C program to implement the transition diagram for unsigned numbers


#include <stdio.h>
#include <string.h>

int dfa = 0;
  
void start(char c)
{
    if (c == '0'|| c == '1' || c == '2' || c == '3' || c == '4'|| c == '5'|| c == '6' || c == '7' || c == '8' || c == '9') {
        dfa = 1;
    }
    // -1 is used to check for any invalid symbol
    else {
        dfa = -1;
    }
}
  
// This function is for the first state (Q1) of DFA
void state1(char c)
{
    if (c == '0'|| c == '1' || c == '2' || c == '3' || c == '4'|| c == '5'|| c == '6' || c == '7' || c == '8' || c == '9') {
        dfa = 1;
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
            return 1;
        }
        else {
            return 0;
        }

    }
}
  
// driver code
int main()
{
    char str[100];
    printf("Input:\t");
    scanf("%s", str);
    if (isAccepted(str))
        printf("Unsigned Number");
    else
        printf("Error");
    return 0;
}