package wslf;

import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

/**
 * Partition class contains methods that generates partitions of number
 *
 * @author Wsl_F
 */
public class Partition {

    /**
     * Generates all partitions of n into k summands. Result saved in
     * partitions.
     *
     * @param n Number
     * @param k parts
     * @param partitions result
     */
    public static void generate(int n, int k, List<int[]> partitions) {
        if (partitions == null) {
            System.err.println("class Partition:\n method generate:\n"
                    + " n=" + n + "; k=" + k + ";  partitions is null");
            throw new NullPointerException("partitions shouldn't be null");
        }

        partitions.clear();

        if (n < 1 || n < k || k < 1) {
            return;
        }

        int[] partition = new int[k+1];
        if (n == k) {
            // includes n == 1
            for (int i = 0; i < k; i++) {
                partition[i]= 1;
            }
            partitions.add(Arrays.copyOfRange(partition, 0, k));
            return;
        }

        // init
        partition[0] = n - k + 1;
        for (int i = 1; i < k; i++) {
            partition[i] = 1;
        }
        partition[k]= -1;
        
        
        while (true) {
            // visit partition
            partitions.add(Arrays.copyOfRange(partition, 0, k));
            
            //generate next
            if (partition[1] < partition[0] - 1) {
                partition[1]++;
                partition[0]--;
                continue;
            } 
            
            {// search for next increments element
                int j= 2;
                int sum= partition[0] + partition[1] - 1;
                while (partition[j] >= partition[0] - 1) {
                    sum+= partition[j++];
                }
                
                // all partitions have been generated
                if (j == k) { 
                    return;
                }

                // update partition
                int tmp= ++partition[j--];
                while (j>0) {
                    partition[j--]= tmp;
                    sum-= tmp;
                }
                partition[0]= sum;
            }
        }
    }
}
