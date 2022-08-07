/* C program to implement the transition diagram for unsigned numbers */

#include <stdio.h>
#include <ctype.h>

/* Use a DFA approach.  state indicates the state of the DFA. */
enum Statetype {NORMAL, NUM, END};

enum Statetype start(int);
enum Statetype state1(int);


/*------------------------------------------------------------*/
/* main: Read text from stdin. Check for the unsigned numbers */     
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
            case NUM:
                state = state1(c);
                break;
            case END:
                printf("Unsigned number detected.\n");
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
    if(isdigit(c))
        state = NUM;
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
        state = NUM;
    else
        state = END;
    return state;
}