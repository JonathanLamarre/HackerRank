class SumInLeavesVisitor extends TreeVis
{
    private int sumTreeLeaves = 0;
    
    public int getResult()
	{
        return sumTreeLeaves;
    }

    public void visitNode(TreeNode node)
	{}

    public void visitLeaf(TreeLeaf leaf)
	{
      	sumTreeLeaves += leaf.getValue();
    }
}

class ProductOfRedNodesVisitor extends TreeVis
{
    private BigInteger result = BigInteger.ONE;
    
    public int getResult()
	{
        return (result.mod(BigInteger.valueOf(1000000007))).intValue();
    }

    public void visitNode(TreeNode node)
	{
      	computeResult(node);
    }

    public void visitLeaf(TreeLeaf leaf)
	{
      	computeResult(leaf);
    }
    
    private void computeResult(Tree tree)
	{
        if (tree.getColor() == Color.RED)
		{
            BigInteger value = tree.getValue() == 0 ? BigInteger.ONE : BigInteger.valueOf(tree.getValue());
            result = result.multiply(value);
        }
    }
}

class FancyVisitor extends TreeVis
{
    private int sumEvenTreeNodes = 0;
    private int sumGreenTreeLeaves = 0;
    
    public int getResult()
	{
        int difference = sumEvenTreeNodes - sumGreenTreeLeaves;
		
        return difference > 0 ? difference : -difference;
    }

    public void visitNode(TreeNode node)
	{
        if (node.getDepth() % 2 == 0)
		{
            sumEvenTreeNodes += node.getValue();
        }
    }

    public void visitLeaf(TreeLeaf leaf)
	{
    	if (leaf.getColor() == Color.GREEN)
		{
            sumGreenTreeLeaves += leaf.getValue();
        }
    }
}

class Edge implements Comparable<Edge>
{
    public final int vertex1;
    public final int vertex2;

    public Edge(int vertex1, int vertex2)
	{
        this.vertex1 = vertex1;
        this.vertex2 = vertex2;
    }

    @Override
    public int compareTo(Edge edge)
	{
        if (vertex1 != edge.vertex1)
		{
            return vertex1 - edge.vertex1;
        }
		else
		{
            return vertex2 - edge.vertex2;
        }
    }
}

public class Solution
{    
    public static Tree solve()
	{        
        try (Scanner scanner = new Scanner(System.in);)
        {
            int n = scanner.nextInt();
            int[] listValues = new int[n];
            Color[] listColors = new Color[n];
            Edge[] edges = new Edge[n]; 
            int[] numberOfReferences = new int[n];
            Tree[] listTrees = new Tree[n];
            
            //Scanning values
            for (int i = 0; i < n; i++)
			{
                listValues[i] = scanner.nextInt();
            }
            
            //Scanning colors
            for (int i = 0; i < n; i++)
			{
                listColors[i] = scanner.nextInt() == 0 ? Color.RED : Color.GREEN;
            }
            
            //Scanning edges and counting number of references on a tree
            for (int i = 1; i < n; i++)
			{
                int vertex1 = scanner.nextInt() - 1;
                int vertex2 = scanner.nextInt() - 1;
                edges[i] = new Edge(vertex1, vertex2);
                numberOfReferences[vertex1]++;
                numberOfReferences[vertex2]++;
            }            
            
            //Building trees
            listTrees[0] = new TreeNode(listValues[0], listColors[0], 0);
            
			for (int i = 1; i < n; i++)
			{
                //Finding an edge referencing an already existing vertex
                for (int j = i + 1; listTrees[edges[i].vertex1] == null && listTrees[edges[i].vertex2] == null; j++)
				{
                    Edge tempEdge = edges[i];
                    edges[i] = edges[j];
                    edges[j] = tempEdge;
                }
                
                //Adding the tree
                int parent = listTrees[edges[i].vertex1] != null ? edges[i].vertex1 : edges[i].vertex2;
                int child = listTrees[edges[i].vertex1] == null ? edges[i].vertex1 : edges[i].vertex2;
                TreeNode parentNode = (TreeNode)(listTrees[parent]);
                Tree childTree = null;
                
				if (numberOfReferences[child] > 1)
				{
                    childTree = new TreeNode
					(
                        listValues[child],
                        listColors[child],
                        parentNode.getDepth() + 1
                    );
                }
				else
				{
                    childTree = new TreeLeaf
					(
                        listValues[child],
                        listColors[child],
                        parentNode.getDepth() + 1
                    );
                }
				
                listTrees[child] = childTree;
                parentNode.addChild(childTree);
            }
            
            return listTrees[0];
        }
    }
}