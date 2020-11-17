import java.util.*;

public class Solution
{
    public static void main(String[] args)
    {
        try (Scanner scanner = new Scanner(System.in))
        {
            String s = scanner.nextLine();
            int start = scanner.nextInt();
            int end = scanner.nextInt();
            System.out.println(s.substring(start, end));
        }
    }
}