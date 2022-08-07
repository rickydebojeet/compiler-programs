# compiler-programs

**This Repository contains C, LEX and YACC files made during our couse of Compiler Design (CS601).** 

## Pre-Requisites

Following package are needed for running the c, lex and yacc files. Please run the following commands:

Run the update command (just in case)
```sh
sudo apt-get update
```
then:
```sh
sudo apt-get install gcc 
sudo apt-get install lex
sudo apt-get install bison
```
or instead of lex you can install flex using
```sh
sudo apt-get install flex
```

## Usage
For compiling the C files:
```sh
gcc <filename.c>
./a.out
```
For compiling the lex files:
```sh
lex <lexfile.l> or flex <lexfile.l>
gcc lex.yy.c
./a.out
```
For compiling the yacc files (Along with the lex files):
```sh
yacc -d <yaccfile.y>
lex <lexfile.l>
gcc lex.yy.c y.tab.c
./a.out
```

## Contents

### 1. C Programs
A finite automata is implemented using C programming language which can detect:
- [Unsigned numbers](./src/c/11_a.c)
- [Integers](src/c/11_b.c)
- [Real numbers](src/c/11_c.c)
- [Identifiers](src/c/11_d.c)
- [Relational operators](src/c/11_e.c)

### 2. Lex Programs
- [Lex program that copies a file, replacing each nonempty sequence of white space by a single blank.](./src/lex/01.l)
- [Lex program that copies a C program, replacing each instance of the keyword float with double.](./src/lex/02.l)
- [Lex program which will modify the words in the following way:](./src/lex/03.l)
  - [If the first letter is a consonant, move it to the end of the word and then add ay.](./src/lex/03.l)
  - [If the first letter is a vowel, just add ay to the end of the word.](./src/lex/03.l)
- [Lex program to identify identifiers from a given input source file.](./src/lex/04.l)
- [Lex program to count the number of vowels and consonants from an input file and write the results to a file.](./src/lex/05.l)
- [Lex program to count the number of lines in a given input source file.](./src/lex/06.l)
- [Lex program to count the number of comment lines in a c program. Also eliminate that comment line. (input read from file).](./src/lex/07.l)
- [Lex program to identify correctly an inputted 8 bit binary number.](./src/lex/08.l)
- [Lex program to find out all the tokens from input C program.(input read from file)](./src/lex/09.l)
- [Lex program to count the number of tokens and find out all the tokens from  input C program. (input read from file)](./src/lex/10.l)
- [Lex program to identify all the numbers in an input text and then perform the sum of the numbers.](./src/lex/12.l)
- [Lex program to count the number of the word “the” in an input text.](./src/lex/13.l)
- [Lex program to count the number of stopwords and remove all of them.](./src/lex/14.l) 
- [Lex program to design a simple calculator.](./src/lex/16.l)
- [Lex program to count the number of palindromes present in a input text and write them to a separate text file.](./src/lex/17.l)
- [Lex program to check valid arithmetic expressions.](./src/lex/18.l)
- [Lex program to find the length of an input text.](./src/lex/19.l)
- [Lex program to reverse all the words in an input text.](./src/lex/20.l)
- [Lex program to find the smallest word in an input text.](./src/lex/21.l)
- [Lex program to convert lowercase characters to uppercase.](./src/lex/22.l)  
- [Lex program to sort all the words in an input text as per their length.](./src/lex/23.l )

### 3. Yacc Programs
- [YACC program to recognize strings of { anbb | n≥5 }.](./src/yacc/string)
- [YACC program for Binary to Decimal Conversion.](./src/yacc/binaryToDecimal)
- [YACC program to recognize string with grammar { bnan | n≥0 }.](./src/yacc/contextFreeGrammar)
- [Yacc Program to evaluate a given arithmetic expression.](./src/yacc/evaluation)
- [YACC program to check whether given string is Palindrome or not.](./src/yacc/palindrome)
- [YACC program for Conversion of Infix to Postfix expression.](./src/yacc/infixToPostfix)
- [YACC program for Conversion of Infix to Prefix expression.](./src/yacc/infixToPrefix)
- [YACC program which accept strings that starts with 0 and ends with 1.](./src/yacc/startAndEndString)
- [YACC program to implement a Calculator and recognize a valid Arithmetic expression.](./src/yacc/calculator)
- [YACC program to recognize a valid variable, which starts with a letter, followed by any number of letters or digits.](./src/yacc/variableDetector)

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## :+1: Credits

- [Debojeet Das](https://rickydebojeet.github.io)
- [Swaubhik Chakraborty](https://swaubhik.github.io/)


## License
[MIT](https://choosealicense.com/licenses/mit/)
