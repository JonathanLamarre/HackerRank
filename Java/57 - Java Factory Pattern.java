Food result = null;

if ("pizza".equals(order))
{
	result = new Pizza();
}

if ("cake".equals(order))
{
	result = new Cake();
}

return result;