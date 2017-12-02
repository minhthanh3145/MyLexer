package com.mylexer;


import java.io.IOException;
import com.Util.Scanner;
import java_cup.runtime.Symbol;

public class MyLexer
{
  public MyLexer() {}
  
  public static void main(String[] args)
  {       
    // Variable to test until bug is found
    int varToSwitch = 1;
    try
    {
       switch (args.length){ // commented out because of the bug
        
            case 1:
                {   
                    // Absolute file_path - used to test until  bug is found
                    
                    
                    String path = args[0]; // commented out because of the bug\
                    
                  
                    System.out.println("Lexing [" + path + "]");
                    
                    Scanner scanner;
                    System.out.println("asfsaf]");
                    scanner = new Scanner(new java.io.FileReader(path));
                    Symbol s;
                    do {
                        s = scanner.debug_next_token();
                    } while (s.sym != 0);
                    System.out.println("No errors.");
                    break;
                }
            case 2:
                {
                    System.out.println("Lexing [" + args[0] + "]");
                    Scanner scanner;
                    scanner = new Scanner(new java.io.FileReader(args[0]));
                    java.io.BufferedWriter out = new java.io.BufferedWriter(new java.io.FileWriter(args[1]));
                    java_cup.runtime.Symbol s;
                    do
                    {
                        s = scanner.debug_next_token();
                        //scanner.log(out, s); // delayed until the final LexSpecification
                    } while (s.sym != 0);
                    out.flush();
                    out.close();
                    System.err.println("No errors.");
                    System.err.println("-- Written to " + args[1] + "--");
                    break;
                }
            default:
                System.err.println("Input error!");
                System.err.println("Usage: command <input> <output>");
                break;
        }
    }
    catch (IOException e) {
      e.printStackTrace(System.err);
      System.exit(1);
    }
  }
}
