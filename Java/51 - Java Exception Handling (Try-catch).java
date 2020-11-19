import java.io.*;
import java.util.*;

public class Solution
{
    public static void main(String[] args)
    {
        try (Scanner scanner = new Scanner(System.in);)
        {
            System.out.println(scanner.nextInt() / scanner.nextInt());
        }
        catch (InputMismatchException e)
        {
            System.out.println("java.util.InputMismatchException");
        }
        catch (ArithmeticException e)
        {
            System.out.println("java.lang.ArithmeticException: / by zero");
        }
    }
}