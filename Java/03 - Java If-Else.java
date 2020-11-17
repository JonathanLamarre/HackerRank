import java.util.Scanner;

public class Solution
{
    public static void main(String[] args)
    {
        try (Scanner scanner = new Scanner(System.in);)
        {
            int scannedInt = scanner.nextInt();
            String result = scannedInt % 2 == 1 || scannedInt >= 6 && scannedInt <= 20 ? "Weird" : "Not Weird";
            System.out.println(result);
        }
    }
}