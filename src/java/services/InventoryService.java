package services;

import dataaccess.CategoriesDB;
import dataaccess.ItemsDB;
import dataaccess.UserDB;
import java.util.List;
import models.Category;
import models.Item;
import models.User;

public class InventoryService {
    public Item get(int itemID) throws Exception {
        ItemsDB itemsdb = new ItemsDB();
        Item items = itemsdb.get(itemID);
        return items;
    }
    
    public List<Item> getAll(String email) throws Exception {
        ItemsDB itemsdb = new ItemsDB();
        List<Item> Item = itemsdb.getAll(email);
        return Item;
    }
    
    public List<Item> getAll() throws Exception {
        ItemsDB itemsdb = new ItemsDB();
        List<Item> items = itemsdb.getAllItems();
        return items;
    }
    
    public List<Category> getAllCats() throws Exception {
        CategoriesDB cdb = new CategoriesDB();
        List<Category> Category = cdb.getAll();
        return Category;
    }
    
    public void insertCat(String categoryName) {
        CategoriesDB cdb = new CategoriesDB();
        Category category = new Category(0, categoryName);
        cdb.insert(category);
    }
    
    public void insert(int category, String itemName, double price, String owner) throws Exception {
        Item items = new Item(0, itemName, price);
        Category categories = new Category(category);
        UserDB udb = new UserDB();
        User user = udb.get(owner);
        items.setOwner(user);
        items.setCategory(categories);
        ItemsDB itemdb = new ItemsDB();
        itemdb.insert(items);
    }
    
    public void updateCat(String categoryName, int categoryID) throws Exception {
        CategoriesDB cdb = new CategoriesDB();
        Category category = cdb.get(categoryID);
        category.setCategoryName(categoryName);
        cdb.update(category);
    }
    
    public void update(int itemid, int category, String itemname, double price, String owner) throws Exception {
        ItemsDB idb = new ItemsDB();
        UserDB udb = new UserDB();
        Item item = idb.get(itemid);
        Category cat = new Category(category);
        User user = udb.get(owner);
        item.setCategory(cat);
        item.setItemName(itemname);
        item.setOwner(user);
        item.setPrice(price);
        idb.update(item);
    }
    
    public void delete(int itemID) throws Exception {
        ItemsDB itemsdb = new ItemsDB();
        Item item = itemsdb.get(itemID);
        itemsdb.delete(item);
    }
}
