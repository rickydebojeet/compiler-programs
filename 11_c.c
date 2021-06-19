//C program to implement the transition diagram for real number


#include <stdio.h>
#include <string.h>

int dfa = 0;
  
void start(char c)
{
    if (c == '+' || c == '-') {
        dfa = 1;
    }
    else if (c == '0'|| c == '1' || c == '2' || c == '3' || c == '4'|| c == '5'|| c == '6' || c == '7' || c == '8' || c == '9') {
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


// This function is for the second state (Q2) of DFA
void state2(char c)
{
    if (c == '0'|| c == '1' || c == '2' || c == '3' || c == '4'|| c == '5'|| c == '6' || c == '7' || c == '8' || c == '9') {
        dfa = 2;
    }
    else if (c == '.') {
        dfa = 3;
    }
    // -1 is used to check for any invalid symbol
    else {
        dfa = -1;
    }
}


void state3(char c)
{
    if (c == '0'|| c == '1' || c == '2' || c == '3' || c == '4'|| c == '5'|| c == '6' || c == '7' || c == '8' || c == '9') {
        dfa = 4;
    }
    // -1 is used to check for any invalid symbol
    else {
        dfa = -1;
    }
}

void state4(char c)
{
    if (c == '0'|| c == '1' || c == '2' || c == '3' || c == '4'|| c == '5'|| c == '6' || c == '7' || c == '8' || c == '9') {
        dfa = 4;
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
        }
        else if (dfa == 3) {
            state3(str[i]);
        }
        else if (dfa == 4) {
            state4(str[i]);
        }
        else {
            return 0;
        }

    }
    
    if (dfa == 4)
        return 1;
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
        printf("Real number\n");
    else
        printf("Error\n");
    return 0;
}