import java.io.*;
import java.util.*;
import java.security.*;
import java.nio.charset.*;

public class Solution
{
    public static void main(String[] args)
    {
        try (Scanner scanner = new Scanner(System.in))
        {
            String s = scanner.nextLine();
            byte[] bytesOfInput = s.getBytes("UTF-8");
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            byte[] digest = messageDigest.digest(bytesOfInput);
            StringBuffer sb = new StringBuffer();
			
            for (int i = 0; i < digest.length; i++)
            {
                sb.append(Integer.toString((digest[i] & 0xff) + 0x100, 16).substring(1));
            }
			
            System.out.println(sb.toString());
        }
        catch(Exception e)
        {
            System.out.println("Erreur");
        }
    }
}