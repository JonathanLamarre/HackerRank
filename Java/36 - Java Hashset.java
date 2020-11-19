HashSet<String> hashSet = new HashSet<>();

for (int i = 0; i < t; i++)
{
	hashSet.add(pair_left[i] + "+" + pair_right[i]);
	System.out.println(hashSet.size());
}