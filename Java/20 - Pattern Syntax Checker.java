import java.util.Scanner;
import java.util.regex.*;

public class Solution
{
   public static void main(String[] args)
   {
      try (Scanner scanner = new Scanner(System.in);)
      {
          for (int i = 0, limit = Integer.parseInt(scanner.nextLine()); i < limit; i++)
          {
              try
              {
                  Pattern pattern = Pattern.compile(scanner.nextLine());
                  System.out.println("Valid");
              }
              catch (PatternSyntaxException e)
              {
                  System.out.println("Invalid");
              }
          }
      }
   }
}