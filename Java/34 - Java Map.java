import java.util.*;
import java.io.*;

public class Solution
{
   public static void main(String []argh)
   {
      try (Scanner scanner = new Scanner(System.in);)
      {
          HashMap<String, Integer> hashMap = new HashMap<>();
          int n = scanner.nextInt();
          scanner.nextLine();
		  
          for(int i = 0; i < n; i++)
          {
              hashMap.put(scanner.nextLine(), scanner.nextInt());
              scanner.nextLine();
          }
		  
          while(scanner.hasNext())
          {
              String query = scanner.nextLine();
              Integer result = hashMap.get(query);
			  
              if (result == null)
              {
                  System.out.println("Not found");
              }
              else
              {
                  System.out.println(query + "=" + result);
              }    
          }
      }
   }
}