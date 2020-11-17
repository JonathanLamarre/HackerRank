import java.io.*;
import java.util.*;
import java.math.*;

public class Solution
{
    public static void main(String[] args)
    {
        try (Scanner scanner = new Scanner(System.in);)
        {
            BigInteger bigInteger1 = new BigInteger(scanner.next());
            BigInteger bigInteger2 = new BigInteger(scanner.next());
            System.out.println(bigInteger1.add(bigInteger2).toString());
            System.out.println(bigInteger1.multiply(bigInteger2).toString());
        }
    }
}