import java.io.*;
import java.util.*;

public class Solution
{
    public static void main(String[] args)
    {
        try (Scanner scanner = new Scanner(System.in))
        {
            for (int i = 0, numberOfTestCases = scanner.nextInt(); i < numberOfTestCases; i++)
            {
                int a = scanner.nextInt();
                int b = scanner.nextInt();
                int n = scanner.nextInt();
                String result = "";
				
                for (int j = 0; j < n; j++)
                {
                    result = result + (j == 0 ? "" : " ") + Integer.toString(a += (int)Math.pow(2, j) * b);
                }
                System.out.println(result);
            }
        }
    }
}