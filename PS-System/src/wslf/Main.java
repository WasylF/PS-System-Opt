package wslf;

import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author Wsl_F
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        List<int[]> list= new LinkedList<>();
        Partition.generate(10, 5, list);
        list.stream().forEach((partition) -> {
            System.out.print("# ");
            for (int i= 0; i<partition.length; i++)
                System.out.print(partition[i]+" ");
            System.out.println("");
        });
    }
    
}
