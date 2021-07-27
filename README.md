# compiler-programs

**This Repository contains C, LEX and YACC files made during our couse of Compiler Design (CS601).** 

## Pre-Requisites

Following package are needed for running the c, lex and yacc files. Please run the following commands:

Run the update command (just in case)
```bash
sudo apt-get update
```
then:
```bash
sudo apt-get install gcc 
sudo apt-get install lex
sudo apt-get install bison
```
or instead of lex you can install flex using
```bash
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
- Unsigned numbers
- Integers
- Real numbers
- Identifiers
- Relational operators




### 2. Lex Programs

### 3. Yacc Programs

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## :+1: Credits

- [Debojeet Das](https://www.debojeet.works)
- [Swaubhik Chakraborty](https://www.swaubhik.engineer/)


## License
[MIT](https://choosealicense.com/licenses/mit/)
