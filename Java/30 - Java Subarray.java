import java.io.*;
import java.util.*;

public class Solution
{
    public static void main(String[] args)
    {
        try (Scanner scanner = new Scanner(System.in);)
        {
            int n = scanner.nextInt();
            int[] a = new int[n];
            int numberOfNegativesSubarrays = 0;
			
            for (int i = 0; i < n; i++)
			{
				a[i] = scanner.nextInt();
			}
			
            for (int i = 0; i < n; i++)
            {
                int sum = 0;
				
                for (int j = i; j < n; j++)
                {
                    sum += a[j];
					
                    if (sum < 0) {numberOfNegativesSubarrays++;}
                }
            }
			
            System.out.println(numberOfNegativesSubarrays);
        }
    }
}