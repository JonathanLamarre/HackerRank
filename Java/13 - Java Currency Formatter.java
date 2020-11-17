import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;

public class Solution
{    
    public static void main(String[] args)
    {
        try (Scanner scanner = new Scanner(System.in))
        {
            double payment = scanner.nextDouble();
            Locale INDIA = new Locale.Builder().setLanguage("en").setRegion("IN").build();
            System.out.println("US: " + NumberFormat.getCurrencyInstance(Locale.US).format(payment));
            System.out.println("India: " + NumberFormat.getCurrencyInstance(INDIA).format(payment));
            System.out.println("China: " + NumberFormat.getCurrencyInstance(Locale.CHINA).format(payment));
            System.out.println("France: " + NumberFormat.getCurrencyInstance(Locale.FRANCE).format(payment));
        }
    }
}