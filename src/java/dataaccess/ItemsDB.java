package dataaccess;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import models.Item;
import models.User;


/**
 *
 * @author Burhan
 */
public class ItemsDB {
    
    public List<Item> getAllItems() throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        try {
            List<Item> itemList = em.createNamedQuery("Item.findAll", Item.class).getResultList();
            return itemList;
        } finally {
            em.close();
        }
    }
    
    public List<Item> getAll(String username) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        try {
            User user = em.find(User.class, username);
            List<Item> noteList = user.getItemList();
            return noteList;
        } finally {
            em.close();
        }
    }
    
    public Item get(int itemID) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        try {
            Item item = em.find(Item.class, itemID);
            return item;
        } finally { 
            em.close();
        }
    }
    
    public void insert(Item item) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();

        try {
            User user = item.getOwner();
            user.getItemList().add(item);
            trans.begin();
            em.persist(item);
            em.merge(user);
            trans.commit();
        } finally {
            em.close();
        }
    }
    
    public void update(Item item) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        
        try {
            trans.begin();
            em.merge(item);
            trans.commit();
        } catch(Exception e) {
            trans.rollback();
        } finally {
            em.close();
        }
    }
    
    public void delete(Item item) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        
        try {
            User user = item.getOwner();
            user.getItemList().remove(item);
            trans.begin();
            em.remove( em.merge(item) );
            em.merge(user);
            trans.commit();
        } catch(Exception e) {
            trans.rollback();
        } finally {
            em.close();
        }
    }
    
}
