import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution
{
    public static void main(String[] args)
    {
        ArrayList<Integer> arrayList = new ArrayList<>();
		
        try (Scanner scanner = new Scanner(System.in);)
        {
            for (int i = 0, limit = scanner.nextInt(); i < limit;i++)
			{
				arrayList.add(scanner.nextInt());
			}
			
            for (int i = 0, limit = scanner.nextInt(); i < limit; i++)
            {
                if (scanner.next().equals("Insert"))
                {
                    arrayList.add(scanner.nextInt(), scanner.nextInt());
                }
                else
                {
                    arrayList.remove(scanner.nextInt());
                }
            }
        }
		
        for (Integer element : arrayList)
		{
			System.out.print(element + " ");
		}
    }
}