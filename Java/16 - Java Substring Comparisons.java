import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

//Génère une erreur si n > s.length()
public class Solution
{
    public static void main(String[] args)
    {
        try (Scanner scanner = new Scanner(System.in))
        {
            String s = scanner.nextLine();
            int n = scanner.nextInt();
            String subString = s.substring(0, n);
            String minSubString = subString;
            String maxSubString = subString;
			
            for (int i = 1, lastIndex = s.length() - n + 1; i < lastIndex; i++)
            {
                subString = s.substring(i, i + n);
                if (subString.compareTo(minSubString) < 0 ) {minSubString = subString;}
                if (subString.compareTo(maxSubString) > 0 ) {maxSubString = subString;}
            }
			
            System.out.println(minSubString);
            System.out.println(maxSubString);
        }
    }
}