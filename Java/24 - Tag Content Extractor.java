import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution
{   
   public static void main(String[] args)
   {   
      try (Scanner scanner = new Scanner(System.in);)
      {
          Pattern pattern = Pattern.compile("<(([^>])+?)>((?>[^<]+)|<(?!([^>])+?>))+?<\\/\\1>");
		  
          for (int test = 0, limit = Integer.parseInt(scanner.nextLine()); test < limit; test++)
          {
              boolean matchFound = false;
              Matcher matcher = pattern.matcher(scanner.nextLine());
			  
              while(matcher.find())
              {
                  matchFound = true;
                  System.out.println(matcher.group(3));
              }
			  
              if (!matchFound) {System.out.println("None");}
          }
      }
   }
}