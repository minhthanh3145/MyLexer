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
  StringBuffer string = new StringBuffer();
  
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

Identifier = [_a-zA-Z][_a-zA-Z0-9]*

IntegerLiteral = 0 | [1-9][0-9]*

FloatLiteral =  [-+]?[0-9]*\.?[0-9]+

StringLiteral = \"([^\\\"]|\\.)*\" 

Comment = /\/\*.*\*\//

%%

<YYINITIAL> {

  /* keywords */
  "int"                          { return symbol(INT); }
  "return"                       { return symbol(RETURN); }
  "void"                         { return symbol(VOID); }   
  "if"                           { return symbol(IF); }   
  "else"                         { return symbol(ELSE); }   
  
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
  "&"				 { return symbol(AMBERAND); }
  
  {IntegerLiteral}               { return symbol(INTLITERAL, new Integer(yytext())); }
  
  {FloatLiteral}				 { return symbol(FLOATING_POINT_LITERAL, new Float(yytext())); }
  
  {StringLiteral}				 { return symbol(STRINGLITERAL, new String(yytext())); }
  
  {Comment}						 { return symbol(COMMENT, new String(yytext())); }
  
  {WhiteSpace}                   { /* ignore */ }

  /* identifiers */ 
  {Identifier}                   { return symbol(ID, yytext()); }  
}

.                              { Errors.fatal(yyline+1, yycolumn+1, "Illegal character \"" + yytext()+ "\""); 
       System.exit(-1); } 
<<EOF>>                          { return symbol(EOF); }
