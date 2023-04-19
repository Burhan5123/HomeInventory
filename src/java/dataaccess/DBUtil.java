package dataaccess;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
/**
 *
 * @author Burhan
 */
public class DBUtil {
    private static final EntityManagerFactory emf =
        Persistence.createEntityManagerFactory("HomeInventory");

    public static EntityManagerFactory getEmFactory() {
        return emf;
    }
}
