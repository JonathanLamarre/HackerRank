import java.io.*;
import java.util.*;

public class Solution
{
    public static void main(String[] args)
    {
		try (Scanner scanner = new Scanner(System.in);)
        {
            for (int i = 0, limit = scanner.nextInt(); i < limit; i++)
            {
                boolean result = false;
                int n = scanner.nextInt();
                int m = scanner.nextInt();
                int a[] = new int[n];
                boolean visited[] = new boolean[n];
				
                for(int j = 0; j < n; j++)
				{
					a[j] = scanner.nextInt(); visited[j] = false;
				}
				
                visited[0] = true;
                Queue<Integer> queue = new LinkedList<>();
                queue.add(0);
				
                while(!queue.isEmpty())
                {
                    int v = queue.poll();
                    if (v+1 >= n || v+m >= n) {result = true; break;}
                    if (v-1 >= 0 && !visited[v-1] && a[v-1] == 0) {visited[v-1] = true; queue.add(v-1);}
                    if (!visited[v+1] && a[v+1] == 0) {visited[v+1] = true; queue.add(v+1);}
                    if (!visited[v+m] && a[v+m] == 0) {visited[v+m] = true; queue.add(v+m);}
                }
				
                System.out.println(result ? "YES" : "NO");
            }
        }
	}
}