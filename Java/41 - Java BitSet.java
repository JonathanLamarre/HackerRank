import java.util.*;

public class Solution
{
    public static void main(String[] args)
    {
        try (Scanner scanner = new Scanner(System.in);)
        {
            int n = scanner.nextInt();
            int m = scanner.nextInt();
            scanner.nextLine();
            BitSet[] bitSet = {new BitSet(n), new BitSet(n)};
			
            for (int i = 0; i < m; i++)
            {
                switch (scanner.next())
                {
                    case "AND"  : bitSet[scanner.nextInt() - 1].and(bitSet[scanner.nextInt() - 1]); break;
                    case "OR"   : bitSet[scanner.nextInt() - 1].or(bitSet[scanner.nextInt() -1]); break;
                    case "XOR"  : bitSet[scanner.nextInt() - 1].xor(bitSet[scanner.nextInt() - 1]); break;
                    case "FLIP" : bitSet[scanner.nextInt() - 1].flip(scanner.nextInt()); break;
                    case "SET"  : bitSet[scanner.nextInt() - 1].set(scanner.nextInt()); break;
                }
				
                System.out.println(bitSet[0].cardinality() + " " + bitSet[1].cardinality());
            }
        }
    }
}