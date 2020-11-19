import java.util.*;

class Student
{
    private int id;
    private String firstName;
    private double cgpa;

    public Student(int id, String firstName, double cgpa)
    {
        super();
        this.id = id;
        this.firstName = firstName;
        this.cgpa = cgpa;
    }
    
    public int getId()
    {
        return this.id;
    }
    
    public String getFirstName()
    {
        return this.firstName;
    }
    
    public double getCgpa()
    {
        return this.cgpa;
    }
}

public class Solution
{
    public static void main(String[] args)
    {
        ArrayList<Student> arrayListStudent = new ArrayList<Student>();
		
        try (Scanner scanner = new Scanner(System.in);)
        {
            for (int i = 0, limit = Integer.parseInt(scanner.nextLine()); i < limit; i++)
            {
                arrayListStudent.add(new Student(scanner.nextInt(), scanner.next(), scanner.nextDouble()));
            }
        }
		
        Collections.sort
        (
            arrayListStudent,
            (s1, s2) ->
            {
                if (s1.getCgpa() < s2.getCgpa())
				{
					return 1;
				}
                else if (s1.getCgpa() > s2.getCgpa())
				{
					return -1;
				}
                else
                {
                    int nameCompare = s1.getFirstName().compareTo(s2.getFirstName());
					
                    if (nameCompare != 0)
					{
						return nameCompare;
					}
                    else
					{
						return s1.getId() - s2.getId();
					}
                }
            }
        );
		
        for (Student student : arrayListStudent)
		{
			System.out.println(student.getFirstName());
		}
   }
}