/* C program to implement the transition diagram for real number */

#include <stdio.h>
#include <ctype.h>

/* Use a DFA approach.  state indicates the state of the DFA. */
enum Statetype {NORMAL, FSIGN, INT, DOT, REAL, SCI, SSIGN, SNOT, FINT, FREAL, FSCI};

enum Statetype start(int);
enum Statetype state1(int);
enum Statetype state2(int);
enum Statetype state3(int);
enum Statetype state4(int);
enum Statetype state5(int);
enum Statetype state6(int);
enum Statetype state7(int);


/*------------------------------------------------------------*/
/* main: Read text from stdin. Check for the floating point   */     
/* number and return the result to stdout. Return 0           */
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
            case DOT:
                state = state3(c);
                break;
            case REAL:
                state = state4(c);
                break;
            case SCI:
                state = state5(c);
                break;
            case SSIGN:
                state = state6(c);
                break;
            case SNOT:
                state = state7(c);
                break;
            case FINT:
                printf("Integer detected.\n");
                return 0;
            case FREAL:
                printf("Real number detected.\n");
                return 0;
            case FSCI:
                printf("Scientific Notation detected.\n");
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
    else if (c == '.')
        state = DOT;
    else if (c == 'e' || c == 'E')
        state = SCI;
    else
        state = FINT;
    return state;
}

/*------------------------------------------------------------*/
/* state3: Implement the state 3 of the DFA. c is the current */
/* DFA character.  Return the next state.                     */
/*------------------------------------------------------------*/
enum Statetype state3(int c)
{
    enum Statetype state;
    if (isdigit(c))
        state = REAL;
    return state;
}

/*------------------------------------------------------------*/
/* state4: Implement the state 4 of the DFA. c is the current */
/* DFA character.  Return the next state.                     */
/*------------------------------------------------------------*/
enum Statetype state4(int c)
{
    enum Statetype state;
    if (isdigit(c))
        state = REAL;
    else if (c == 'e' || c == 'E')
        state = SCI;
    else
        state = FREAL;
    return state;
}

/*------------------------------------------------------------*/
/* state5: Implement the state 5 of the DFA. c is the current */
/* DFA character.  Return the next state.                     */
/*------------------------------------------------------------*/
enum Statetype state5(int c)
{
    enum Statetype state;
    if (isdigit(c))
        state = SNOT;
    else if (c == '+' || c == '-')
        state = SSIGN;
    return state;
}

/*------------------------------------------------------------*/
/* state6: Implement the state 6 of the DFA. c is the current */
/* DFA character.  Return the next state.                     */
/*------------------------------------------------------------*/
enum Statetype state6(int c)
{
    enum Statetype state;
    if (isdigit(c))
        state = SNOT;
    return state;
}

/*------------------------------------------------------------*/
/* state7: Implement the state 7 of the DFA. c is the current */
/* DFA character.  Return the next state.                     */
/*------------------------------------------------------------*/
enum Statetype state7(int c)
{
    enum Statetype state;
    if (isdigit(c))
        state = SNOT;
    else
        state = FSCI;
    return state;
}