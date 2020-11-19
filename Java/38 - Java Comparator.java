class Checker implements Comparator<Player>
{
    @Override
    public int compare(Player p1, Player p2)
    {
        return p1.score < p2.score ? 1 : (p1.score > p2.score ? -1 : p1.name.compareToIgnoreCase(p2.name));
    }
}