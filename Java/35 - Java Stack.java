import java.util.*;

class Solution
{   
   public static void main(String []argh)
   {
      try (Scanner scanner = new Scanner(System.in);)
      {
          while (scanner.hasNext())
          {
              boolean result = true;
              ArrayDeque<Character> stack = new ArrayDeque<>();
              String input = scanner.next();
			  
              for (int i = 0; i < input.length() && result; i++)
              {
                  Character c = input.charAt(i);
				  
                  if (c == '(' || c == '{' || c == '[')
                  {
                      stack.push(c);
                  }
                  else if
                  (
                      (c == ')' && (stack.isEmpty() || stack.peek() != '('))
                      || (c == '}' && (stack.isEmpty() || stack.peek() != '{'))
                      || (c == ']' && (stack.isEmpty() || stack.peek() != '['))
                  )
                  {
                      result = false;
                  }
                  else
                  {
                      stack.pop();
                  }
              }
			  
              System.out.println(result && stack.isEmpty());
          }
      }      
   }
}