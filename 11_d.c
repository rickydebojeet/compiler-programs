//C program to implement the transition diagram for identifier


#include <stdio.h>
#include <string.h>

int dfa = 0;
  
void start(char c)
{
    if (c == 'A' || c == 'B' || c == 'C' || c == 'D' || c == 'E' || c == 'F' || c == 'G' || c == 'H' || c == 'I' || c == 'J' || c == 'K' || c == 'L' || c == 'M' || c == 'N' || c == 'O' || c == 'P' || c == 'Q' || c == 'R' || c == 'S' || c == 'T' || c == 'U' || c == 'V' || c == 'W' || c == 'X' || c == 'Y' || c == 'Z' || c == 'a' || c == 'b' || c == 'c' || c == 'd' || c == 'e' || c == 'f' || c == 'g' || c == 'h' || c == 'i' || c == 'j' || c == 'k' || c == 'l' || c == 'm' || c == 'n' || c == 'o' || c == 'p' || c == 'q' || c == 'r' || c == 's' || c == 't' || c == 'u' || c == 'v' || c == 'w' || c == 'x' || c == 'y' || c == 'z') {
        dfa = 1;
    }
    // -1 is used to check for any invalid symbol
    else {
        dfa = -1;
    }
}

void state1(char c)
{
    if (c == 'A' || c == 'B' || c == 'C' || c == 'D' || c == 'E' || c == 'F' || c == 'G' || c == 'H' || c == 'I' || c == 'J' || c == 'K' || c == 'L' || c == 'M' || c == 'N' || c == 'O​' || c == 'P' || c == 'Q' || c == 'R' || c == 'S' || c == 'T' || c == 'U' || c == 'V' || c == 'W' || c == 'X' || c == 'Y' || c == 'Z' || c == 'a' || c == 'b' || c == 'c' || c == 'd' || c == 'e' || c == 'f' || c == 'g' || c == 'h' || c == 'i' || c == 'j' || c == 'k' || c == 'l' || c == 'm' || c == 'n' || c == 'o' || c == 'p' || c == 'q' || c == 'r' || c == 's' || c == 't' || c == 'u' || c == 'v' || c == 'w' || c == 'x' || c == 'y' || c == 'z' || c == '0'|| c == '1' || c == '2' || c == '3' || c == '4'|| c == '5'|| c == '6' || c == '7' || c == '8' || c == '9') {
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
        }
        else {
            return 0;
        }

    }
    if (dfa == 1)
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
        printf("Identifier\n");
    else
        printf("Error\n");
    return 0;
}