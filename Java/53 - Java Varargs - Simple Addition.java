class Add
{
	public void add(Integer... a)
	{
		int result = 0;
		String printedResult = "";
		
		for (int i = 0; i < a.length; i++)
		{
			printedResult = printedResult + (i == 0 ? "" : "+") + a[i];
			result += a[i];
		}
		
		System.out.println((a.length > 0 ? printedResult + "=" : "") + result);
	}
}