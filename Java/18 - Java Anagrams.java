static boolean isAnagram(String a, String b)
{
	String[] stringArrayA = a.toLowerCase().split("");
	String[] stringArrayB = b.toLowerCase().split("");
	Arrays.sort(stringArrayA);
	Arrays.sort(stringArrayB);
	
	return (Arrays.toString(stringArrayA)).equals(Arrays.toString(stringArrayB));
}