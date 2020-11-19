import java.io.*;
import java.util.*;

public class Solution
{
    public static void main(String[] args)
    {
        try (Scanner scanner = new Scanner(System.in);)
        {
            ArrayList<ArrayList<Integer>> arrayList = new ArrayList<>();
            
			for (int i = 0, n = scanner.nextInt(); i < n; i++)
            {
                arrayList.add(new ArrayList<Integer>());
				
                for (int j = 0, m = scanner.nextInt(); j < m; j++)
				{
					arrayList.get(i).add(scanner.nextInt());
				}
            }
            for (int i = 0, q = scanner.nextInt(); i < q; i++)
            {
                try
                {
                    int line = scanner.nextInt() - 1;
                    int position = scanner.nextInt() - 1;
                    System.out.println(arrayList.get(line).get(position));
                }
                catch (IndexOutOfBoundsException e)
                {
                    System.out.println("ERROR!");
                }
            }
        }
    }
}