import static java.lang.System.in;

class Prime
{
    public void checkPrime(Integer... a)
    {
        for (int i = 0; i < a.length; i++)
        {
            Boolean isPrime = (a[i] == 2 || a[i] % 2 != 0) && (a[i] != 1);
            
			for (int j = 3, limit = (int)(Math.ceil(Math.sqrt(a[i]))); j <= limit && isPrime; j += 2)
            {
                if (a[i] % j == 0)
				{
					isPrime = false;
				}
            }
			
            if (isPrime) {System.out.print(a[i] + " ");}
        }
        System.out.print("\n");
    }
}