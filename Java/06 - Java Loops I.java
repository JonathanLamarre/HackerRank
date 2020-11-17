import java.io.*;
import java.util.*;

public class Solution
{
    public static void main(String[] args)
    {
        try (Scanner scanner = new Scanner(System.in);)
        {
            int n = scanner.nextInt();
			
            for (int i = 1; i <= 10; i++)
            {
                System.out.println(n + " x " + i + " = " + n*i);
            }
        }
    }
}