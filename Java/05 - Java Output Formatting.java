import java.util.Scanner;

public class Solution
{
    public static void main(String[] args)
    {
		System.out.println("================================");
		
		try (Scanner scanner = new Scanner(System.in);)
		{
			for (int i = 0; i < 3; i++)
			{
				String scannedString = scanner.next();
				int scannedInt = scanner.nextInt();
				System.out.printf("%-15s%03d\n", scannedString, scannedInt);
			}
		}
		
		System.out.println("================================");
    }
}