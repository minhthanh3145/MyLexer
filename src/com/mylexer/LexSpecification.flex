import java.io.*;
import java_cup.runtime.*;

%%

%public
%class Scanner
%implements sym

%line
%column

%cup
%cupdebug

%{
  StringBuffer strin g = new StringBuffer();
  
  private Symbol symbol(int type) {
    return new MySymbol(type, yyline+1, yycolumn+1);
  }

  private Symbol symbol(int type, Object value) {
    return new MySymbol(type, yyline+1, yycolumn+1, value);
  } 
%}

/* main character classes */

LineTerminator = \r|\n|\r\n
WhiteSpace = {LineTerminator} | [ \t\f]

IntegerLiteral = {Integer_Hex} |  {Integer_Oct} | {Integer_Dec}
 
Identifier = [_a-zA-Z][_a-zA-Z0-9]*

FloatLiteral =  [-+]?[0-9]*\.?[0-9]+

StringLiteral = \"([^\\\"]|\\.)*\" 

Integer_Hex = (0x|0X){Hex_Digit}{Integer_Suffix}
Letter = [a-zA-Z]
Hex_Digit = {Digit} | {Letter}
Digit = [0-9]
Integer_Suffix = ""|u|U|l|L

Integer_Dec = 0 | [1-9][0-9]*

Integer_Oct = 0[1-7]+[0-7]*

//Comment = \/\* ((\*(?!/))|[^*]) \*\/

%%

<YYINITIAL> {

  /* keywords */
  "int"                          { return symbol(INT); }
  "return"                       { return symbol(RETURN); }
  "void"                         { return symbol(VOID); }   
  "if"                           { return symbol(IF); }   
  "else"                         { return symbol(ELSE); }  
  
  "auto"                         { return symbol(AUTO); }   
  "double"                         { return symbol(DOUBLE); }   
  "struct"                         { return symbol(STRUCT); }   
  "const"                         { return symbol(CONST); }   
  "float"                         { return symbol(FLOAT); }   
  "short"                         { return symbol(SHORT); }   
  "unsigned"                         { return symbol(UNSIGNED); }   
  "break"                         { return symbol(BREAK); }   
  "long"                         { return symbol(LONG); }   
  "switch"                         { return symbol(SWITCH); }   
  "continue"                         { return symbol(CONTINUE); }   
  "for"                         { return symbol(FOR); }   
  "signed"                         { return symbol(SIGNED); }   
  "void"                         { return symbol(VOID); }   
  "case"                         { return symbol(CASE); }   
  "enum"                         { return symbol(ENUM); }   
  "register"                         { return symbol(REGISTER); }   
  "typedef"                         { return symbol(TYPEDEF); }   
  "default"                         { return symbol(DEFAULT); }   
  "goto"                         { return symbol(GOTO); }
"sizeof"                         { return symbol(SIZEOF); }   
"volatile"                         { return symbol(VOLATILE); }   
"char"                         { return symbol(CHAR); }   
"extern"                         { return symbol(EXTERN); }   
"union"                         { return symbol(UNION); }   
"do"                         { return symbol(DO); }     
"static"                         { return symbol(STATIC); }   
"while"                         { return symbol(WHILE); }   
  
  /* punctuators */
  "("                            { return symbol(LPAREN); }
  ")"                            { return symbol(RPAREN); }
  "{"                            { return symbol(LCURLY); }
  "}"                            { return symbol(RCURLY); }
  "["                            { return symbol(LSQBRACKET); }
  "]"                            { return symbol(RSQBRACKET); }
  ";"                            { return symbol(SEMICOLON); }
  ","                            { return symbol(COMMA); }
  
  "<"                            { return symbol(LESS); }
  ">"                            { return symbol(GREATER); }
  "+"                            { return symbol(PLUS); }
  "-"                            { return symbol(MINUS); }
  "/"                            { return symbol(DIVIDE); }
  "*"                            { return symbol(TIMES); }
  "="                            { return symbol(ASSIGN); }
  "=="                           { return symbol(EQUALS); }
  "&"				 			{ return symbol(AMBERAND); }
	

  
  
  {FloatLiteral}				 { return symbol(FLOATING_POINT_LITERAL, new Float(yytext())); }
  
  {StringLiteral}				 { return symbol(STRINGLITERAL, new String(yytext())); }
  
  {WhiteSpace}                   { /* ignore */ }
  

  {IntegerLiteral}               { return symbol(INTLITERAL, new String(yytext())); }
  
  //(Comment)						 { return symbol(COMMENT, new Float(yytext())); }

  /* identifiers */ 
  {Identifier}                   { return symbol(ID, yytext()); }  
}

.                              { Errors.fatal(yyline+1, yycolumn+1, "Illegal character \"" + yytext()+ "\""); 
       System.exit(-1); } 
<<EOF>>                          { return symbol(EOF); }
