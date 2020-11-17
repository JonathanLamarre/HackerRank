import java.io.*;
import java.util.*;

public class Solution
{
    public static void main(String[] args)
    {
        try (Scanner scanner = new Scanner(System.in))
        {
            for (int i = 1; scanner.hasNext(); i++)
            {
                System.out.println(Integer.toString(i) + " " + scanner.nextLine());   
            }
        }
    }
}