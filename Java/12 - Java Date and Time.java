import java.util.*;

public class Solution
{
    public static void main(String[] args)
    {
        try (Scanner scanner = new Scanner(System.in);)
        {
            int month = scanner.nextInt() - 1;
            int day = scanner.nextInt();
            int year = scanner.nextInt();
            Calendar calendar = Calendar.getInstance();
            calendar.set(year, month, day);
            String result = "";
			
            switch (calendar.get(calendar.DAY_OF_WEEK))
            {
                case Calendar.SUNDAY : result = "SUNDAY"; break;
                case Calendar.MONDAY : result = "MONDAY"; break;
                case Calendar.TUESDAY : result = "TUESDAY"; break;
                case Calendar.WEDNESDAY : result = "WEDNESDAY"; break;
                case Calendar.THURSDAY : result = "THURSDAY"; break;
                case Calendar.FRIDAY : result = "FRIDAY"; break;
                case Calendar.SATURDAY : result = "SATURDAY"; break;
            }
			
            System.out.println(result);
        }
    }
}