/* C program to implement the transition diagram for relational operators */

#include <stdio.h>

/* Use a DFA approach.  state indicates the state of the DFA. */
int state = 0;

int start(int);
int state1(int);
int state6(int);


/*------------------------------------------------------------*/
/* main: Read text from stdin. Check for the relop and return */  
/* the result to stdout. Return 0                             */
/*------------------------------------------------------------*/ 
int main()
{
    int c;
    for( ; ; ) {
        c = getchar();
        if (c == EOF) 
            break;
        switch (state)
        {
            case 0:
                state = start(c);
                break;
            case 1:
                state = state1(c);
                break;
            case 2:
                printf("RELOP, LE\n");
                return 0;
            case 3:
                printf("RELOP, NE\n");
                return 0;
            case 4:
                printf("RELOP, LT\n");
                return 0;
            case 5:
                printf("RELOP, EQ\n");
                return 0;
            case 6:
                state = state6(c);
                break;
            case 7:
                printf("RELOP, GE\n");
                return 0;
            case 8:
                printf("RELOP, GT\n");
                return 0;
        } 
    }
    return 0;
}

/*------------------------------------------------------------*/
/* start: Implement the state 0 of the DFA. c is the current  */
/* DFA character.  Return the next state.                     */
/*------------------------------------------------------------*/ 
int start(int c)
{
    if (c == '<')
        state = 1;
    else if (c == '=')
        state = 5;
    else if (c == '>')
        state = 6;
    return state;
}

/*------------------------------------------------------------*/
/* state1: Implement the state 1 of the DFA. c is the current */
/* DFA character.  Return the next state.                     */
/*------------------------------------------------------------*/
int state1(int c)
{
    if (c == '=')
        state = 2;
    else if (c == '>')
        state = 3;
    else
        state = 4;
    return state;
}

/*------------------------------------------------------------*/
/* state6: Implement the state 6 of the DFA. c is the current */
/* DFA character.  Return the next state.                     */
/*------------------------------------------------------------*/
int state6(int c)
{
    if (c == '=')
        state = 7;
    else
        state = 8;
    return state;
}