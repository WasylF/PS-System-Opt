package wslf;

import java.util.Arrays;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Wsl_F
 */
public class PartitionTest {

    public PartitionTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

    /**
     * Test of generate method, of class Partition.
     */
    @Test
    public void testGenerate_Null() {
        int n = 100;
        int k = 10;
        List partitions = null;
        try {
            Partition.generate(n, k, partitions);
        } catch (NullPointerException e) {
            assertNull(partitions);
            return;
        }
        fail();
    }

    /**
     * Test of generate method, of class Partition.
     */
    @Test
    public void testGenerate_1() {
        int n = 1;
        int k = 1;
        int[] expecteds = {1};

        List<int[]> partitions = new LinkedList<>();
        try {
            Partition.generate(n, k, partitions);
        } catch (Throwable e) {
            fail();
        }

        if (partitions.size() != 1) {
            fail();
        }

        assertArrayEquals(expecteds, partitions.get(0));
    }

    /**
     * Test of generate method, of class Partition.
     */
    @Test
    public void testGenerate_n_k() {
        for (int size = 123; size < 150; size++) {
            int n = size;
            int k = size;
            int[] expecteds = new int[size];
            for (int i = 0; i < size; i++) {
                expecteds[i] = 1;
            }

            List<int[]> partitions = new LinkedList<>();
            try {
                Partition.generate(n, k, partitions);
            } catch (Throwable e) {
                fail();
            }

            if (partitions.size() != 1) {
                fail();
            }

            assertArrayEquals(expecteds, partitions.get(0));
        }
    }

    /**
     * Test of generate method, of class Partition.
     */
    @Test
    public void testGenerate_10_5() {
            int n = 10;
            int k = 5;
           

            List<int[]> partitions = new LinkedList<>();
            try {
                Partition.generate(n, k, partitions);
            } catch (Throwable e) {
                fail();
            }
            
            assertEquals(partitions.size(), 7);
    }

    /**
     * Test of generate method, of class Partition.
     */
    @Test
    public void testGenerate_11_4() {
            int n = 11;
            int k = 4;
           

            List<int[]> partitions = new LinkedList<>();
            try {
                Partition.generate(n, k, partitions);
            } catch (Throwable e) {
                fail();
            }
            
            assertEquals(partitions.size(), 11);
    }
}
