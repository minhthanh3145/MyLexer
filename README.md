# What does this program do ? 
- It takes in a lexical description, which then is processed by JFLex to generate a Scanner class. This Scanner class is combined
with other classes to translate a text file into a stream of tokens. Warnings and erros are appropriately thrown.

# Prerequesties:
- Windows' **cmd**.
- **Javac + jdk** installed.
- JFLex and CUP ( **provided** in the repository ).

# How to compile:

## The fast way: 
- **Step 1**: Place the lexer_test in your default cd directory:
![alt text](https://github.com/minhthanh3145/MyLexer/blob/master/img/batch_placement.png)
- **Step 2**: Change the highlighted directory with the directory to your `..MyLexer/src/`:
![alt text](https://github.com/minhthanh3145/MyLexer/blob/master/img/batch_config.png)
- **Step 3**: Run the bat file with the command `call lexer_test.cmd fileName.extension`:
![alt text](https://github.com/minhthanh3145/MyLexer/blob/master/img/batch_run.png)

## What is really going on:
- **Step 1**: Clone or download this repository.
- **Step 2**: Open cmd, type in `cd repAddress` with repAddress being the absolute path of the cloned repository.
- **Step 3**: `cd src` to move to the src folder
- **Step 4**: `javac -cp com/java-cup-11b-runtime.jar com/java_cup/runtime/*.java com/Util/*.java com/mylexer/MyLexer.java` to compile everything all dependencies and all packages
- **Step 5**: `java -cp com/java-cup-11b-runtime.jar; com.mylexer.MyLexer com/test/test0.c` to run the test, replace `test0.c` with other filenames.

What does compiled result look like ? 
![alt text](https://github.com/minhthanh3145/MyLexer/blob/master/img/compiled.jpg)

# How to contribute:
- **Step 1**: Download JFlex: 
![alt text](https://github.com/minhthanh3145/MyLexer/blob/master/img/jflex_downlad.png)

- **Step 2**: Read user's manual to install JFlex at this link (http://jflex.de/manual.pdf) - beware that its installation guide is little bit off. 

   **Step 2 . 1** : Unzip the Jflex file you just downloaded, Config your `jflex-1.6.1\jflex-1.6.1\bin\jflex.bat` like this:
      ![alt text](https://github.com/minhthanh3145/MyLexer/blob/master/img/bin_flex_bat.png)
     JAVA_HOME is the directory to your jdk ( **NOT JRE** )
     The final line is the directory to your JFlex(...).jar

   **Step 2 . 2** : Configure the path on your computer, in Run, type `System` and click on `System - control panel`->`Advanced system       settings`->`Environment variables`. In System variable, find PATH and append the directory `yourDirectory\jflex-1.6.1\jflex-1.6.1\bin` to the end and click OK. 
![alt text](https://github.com/minhthanh3145/MyLexer/blob/master/img/path_config.png)

- **Step 3**: Verify if Jflex is sucessfully installed. 
Goto cmd, type `jflex`, if a windows form pops up then you're done: 
![alt text](https://github.com/minhthanh3145/MyLexer/blob/master/img/jflex_done.png)
