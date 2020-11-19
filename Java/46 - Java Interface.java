class MyCalculator implements AdvancedArithmetic
{
    public int divisor_sum(int n)
    {
        int result = 0;
        int limit = (int)(Math.sqrt(n));
		
        for (int i = 1; i <= limit; i++)
        {
            if (n % i == 0)
            {
                result += i;
                result += n / i;
            }
        }
		
        if (limit * limit == n) { result -= limit; }
		
        return result;
    }
}