import java.io.*;
import java.util.*;
import java.util.regex.*;

public class Solution
{
    public static void main(String[] args)
    {
        String s = "";
		
        try (Scanner scanner = new Scanner(System.in);)
        {
            s = scanner.nextLine();
        }
		
        Pattern pattern = Pattern.compile("[A-Za-z]+");
        Matcher matcher = pattern.matcher(s);
        int numberOfTokens = 0;
        ArrayList<String> arrayList = new ArrayList<>();
		
        while(matcher.find())
        {
            numberOfTokens++;
            arrayList.add(matcher.group());
        }
		
        System.out.println(numberOfTokens);
		
        for (String token : arrayList)
		{
			System.out.println(token);
		}
    }
}