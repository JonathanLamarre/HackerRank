import java.io.*;
import java.util.*;

public class Solution
{
    public static void main(String[] args)
    {
        try (Scanner scanner = new Scanner(System.in);)
        {
            String A = scanner.next();
            String result = A.equals(new StringBuilder(A).reverse().toString()) ? "Yes" : "No";
            System.out.println(result);
        }
    }
}