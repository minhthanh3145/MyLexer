# What does this program do ? 
- It takes in a lexical description, which then is processed by JFLex to generate a Scanner class. This Scanner class is combined
with other classes to translate a text file into a stream of tokens. Warnings and erros are appropriately thrown.

# Prerequesties:
- Windows' cmd.
- Javac + jdk installed.
- JFLex and CUP ( provided in the repository ).


# How to compile:
- Step 1: Clone or download this repository.
- Step 2: Open cmd, type in `cd repAddress` with repAddress being the absolute path of the cloned repository.
- Step 3: `cd src` to move to the src folder
- Step 4: `javac -cp com/java-cup-11b-runtime.jar com/java_cup/runtime/*.java com/Util/*.java com/mylexer/MyLexer.java` to compile
- Step 5: 
