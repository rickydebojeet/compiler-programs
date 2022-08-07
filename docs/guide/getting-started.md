# Getting Started

This section will help you get started with Compiler Design.

::: warning
This Repository contains C, LEX and YACC files made during our couse of Compiler Design (CS601).
:::

## 🚩 Pre Requisites

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

## 💻 Usage
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