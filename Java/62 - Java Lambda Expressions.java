	PerformOperation is_odd()
	{
		return (x -> x % 2 == 1 ? true : false);
	}

	PerformOperation is_prime()
	{
		return
		(
			x ->
			{
				boolean isPrime = (x == 2 || x % 2 != 0) && (x != 1);
				
				for (int j = 3, limit = (int)(Math.ceil(Math.sqrt(x))); j <= limit && isPrime; j += 2)
				{
					if (x % j == 0)
					{
						isPrime = false;
					}
				}
				
				return isPrime;
			}
		);
	}

    PerformOperation is_palindrome()
    {
        return
        (
            x ->
            {
                String y = String.valueOf(x);
                boolean result = true;
				
                for (int i = 0, j = y.length() - 1; i < j && result; i++, j--)
                {
                    if (y.charAt(i) != y.charAt(j))
					{
						result = false;
					}
                }
				
                return result;
            }
        );
    }
}