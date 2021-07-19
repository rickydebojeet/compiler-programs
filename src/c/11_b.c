/* C program to implement the transition diagram for integer */

#include <stdio.h>
#include <ctype.h>

/* Use a DFA approach.  state indicates the state of the DFA. */
enum Statetype {NORMAL, FSIGN, INT, FINT};

enum Statetype start(int);
enum Statetype state1(int);
enum Statetype state2(int);


/*------------------------------------------------------------*/
/* main: Read text from stdin. Check for the integer and      */     
/* and return the result to stdout. Return 0                  */
/*------------------------------------------------------------*/ 
int main()
{
    int c;
    enum Statetype state = NORMAL;
    for( ; ; ) {
        c = getchar();
        if (c == EOF) 
            break;
        switch (state)
        {
            case NORMAL:
                state = start(c);
                break;
            case FSIGN:
                state = state1(c);
                break;
            case INT:
                state = state2(c);
                break;
            case FINT:
                printf("Integer detected.\n");
                return 0;
        } 
    }
    return 0;
}

/*------------------------------------------------------------*/
/* start: Implement the state 0 of the DFA. c is the current  */
/* DFA character.  Return the next state.                     */
/*------------------------------------------------------------*/ 
enum Statetype start(int c)
{
    enum Statetype state;
    if (c == '+' || c == '-')
        state = FSIGN;
    else if(isdigit(c))
        state = INT;
    return state;
}

/*------------------------------------------------------------*/
/* state1: Implement the state 1 of the DFA. c is the current */
/* DFA character.  Return the next state.                     */
/*------------------------------------------------------------*/
enum Statetype state1(int c)
{
    enum Statetype state;
    if (isdigit(c))
        state = INT;
    return state;
}

/*------------------------------------------------------------*/
/* state2: Implement the state 2 of the DFA. c is the current */
/* DFA character.  Return the next state.                     */
/*------------------------------------------------------------*/
enum Statetype state2(int c)
{
    enum Statetype state;
    if (isdigit(c))
        state = INT;
    else
        state = FINT;
    return state;
}