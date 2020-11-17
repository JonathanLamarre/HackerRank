import java.util.Scanner;

public class Solution
{
    public static void main(String[] args)
    {
        try (Scanner scanner = new Scanner(System.in);)
        {
            int scannedInt = scanner.nextInt();
            scanner.nextLine();
            double scannedDouble = scanner.nextDouble();
            scanner.nextLine();
            String scannedString = scanner.nextLine();
            System.out.println("String: " + scannedString);
            System.out.println("Double: " + scannedDouble);
            System.out.println("Int: " + scannedInt);
        } 
    }
}