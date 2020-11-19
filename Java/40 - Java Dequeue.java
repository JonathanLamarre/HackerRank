import java.util.*;

public class test
{
    public static void main(String[] args)
    {
        int result = 0;
		
        try (Scanner scanner = new Scanner(System.in);)
        {
            HashMap<Integer, Integer> hashMap = new HashMap<>();
            Queue<Integer> queue = new ArrayDeque<>();
			
            for (int i = 0, n = scanner.nextInt(), m = scanner.nextInt() ; i < n; i++)
            {
                int scannedNumber = scanner.nextInt();
                queue.add(scannedNumber);
                Integer occurences = hashMap.get(scannedNumber);
				
                if (occurences == null)
                {
                    hashMap.put(scannedNumber, 1);
                }
                else
                {
                    hashMap.put(scannedNumber, occurences + 1);
                }
				
                if (queue.size() >= m)
                {
                    if (queue.size() > m)
                    {
                        int removedInt = queue.remove();
                        occurences = hashMap.get(removedInt) - 1;
						
                        if (occurences == 0)
                        {
                            hashMap.remove(removedInt);
                        }
                        else
                        {
                            hashMap.put(removedInt, occurences);
                        }
                    }
					
                    if (hashMap.size() > result) {result = hashMap.size();}
                    if (result == m) {break;}
                }
            }
        }
		
        System.out.println(result);
    }
}