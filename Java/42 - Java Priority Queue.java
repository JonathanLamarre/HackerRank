import java.util.*;

class Student
{
    private String firstName;
    private double cgpa;
    private int token;
    
	public String getFirstName() { return firstName; }

    public double getCgpa() { return cgpa; }
    
    public int getToken() { return token; }
	
    public Student(String firstName, double cgpa, int id)
    {
        super();
        this.token = id;
        this.firstName = firstName;
        this.cgpa = cgpa;
    }    
}

public class Solution
{
    public static void main(String[] args)
    {
        PriorityQueue<Student> priorityQueue = new PriorityQueue<>
        (
            (s1, s2) ->
            {
                if (s1.getCgpa() < s2.getCgpa()) { return 1; }
                else if (s1.getCgpa() > s2.getCgpa()) { return -1; }
                else { return s1.getFirstName().compareTo(s2.getFirstName()); }
            }
        );
		
        try (Scanner scanner = new Scanner(System.in);)
        {
            for (int i = 0, limit = Integer.parseInt(scanner.nextLine()); i < limit; i++)
            {
                if ("ENTER".equals(scanner.next()))
                {
                    priorityQueue.add(new Student(scanner.next(), scanner.nextDouble(), scanner.nextInt()));
                }
                else
                {
                    priorityQueue.poll();
                }
            }
        }
		
        if (priorityQueue.isEmpty())
        {
            System.out.println("EMPTY");
        }
        else
        {
            while (!priorityQueue.isEmpty())
            {
                System.out.println(priorityQueue.poll().getFirstName());
            }
        }
    }
}