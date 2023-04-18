package services;

import dataaccess.UserDB;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import models.Role;
import models.Users;

public class AccountService {
    
    public Users login(String email, String password, String path) {
        UserDB userDB = new UserDB();
        
        try {
            Users user = userDB.get(email);
            if (password.equals(user.getPassword())) {               
                HashMap<String, String> tags = new HashMap<>();
                tags.put("firstname", user.getFirstName());
                tags.put("lastname", user.getLastName());
                tags.put("date", (new java.util.Date()).toString());
                
                return user;
            }
        } catch (Exception e) {
        }
        
        return null;
    }
    
    public void resetPassword(String email, String path, String url) {
        UserDB userDB = new UserDB();
        try {
            String uuid = UUID.randomUUID().toString();
            String link = url + "?uuid=" + uuid; 
            Users user = userDB.get(email);
            user.setResetPasswordUuid(uuid);
            userDB.update(user);

            HashMap<String, String> tags = new HashMap<>();
            tags.put("firstname", user.getFirstName());
            tags.put("lastname", user.getLastName());
            tags.put("link", link);


        } catch (Exception e) {
        }
    }
    
    public boolean changePassword(String uuid, String password, String email) {
        UserDB userdb = new UserDB();
        
        try {
            Users user = userdb.get(email);
            String temp = user.getResetPasswordUuid();
            if (temp.equals(uuid)) {
                user.setPassword(password);
                user.setResetPasswordUuid(null);
                userdb.update(user);
            }
            return true;
        } catch (Exception e) {
            
            return false;
        } 
    }
    
    public void changeActive(String uuid, String email) {
        UserDB userdb = new UserDB();
        try {
            Users user = userdb.get(email);
            String temp = user.getResetPasswordUuid();
            if (temp.equals(uuid)) {
                user.setActive(true);
                user.setResetPasswordUuid(null);
                userdb.update(user);
            }
        } catch (Exception e) {
        } 
    }
    
    public void register(String email, String path, String url) {
        UserDB userDB = new UserDB();
        try {
            String uuid = UUID.randomUUID().toString();
            String link = url + "?uuid=" + uuid; 
            Users user = userDB.get(email);
            user.setResetPasswordUuid(uuid);
            userDB.update(user);

            HashMap<String, String> tags = new HashMap<>();
            tags.put("firstname", user.getFirstName());
            tags.put("lastname", user.getLastName());
            tags.put("link", link);

            
        } catch (Exception e) {
            System.out.println("ERROR");
        }
    }
    
    public Users get(String email) throws Exception {
        UserDB userdb = new UserDB();
        Users user = userdb.get(email);
        return user;
    }
    
    public List<Users> getAll() throws Exception {
        UserDB userdb = new UserDB();
        List<Users> users = userdb.getAll();
        return users;
    }
    
    public void insert(String password, String email, String firstName, String lastName, boolean active, int roleid) throws Exception {
        Users user = new Users(email, password, firstName, lastName, active);
        Role role = new Role(roleid);
        user.setRole(role);
        UserDB userdb = new UserDB();
        userdb.insert(user);
    }
    
    public void update(String password, String email, String firstName, String lastName, boolean active, int roleid) throws Exception {
        UserDB userdb = new UserDB();
        Users user = userdb.get(email);
        Role role = new Role(roleid);
        user.setPassword(password);
        user.setEmail(email);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setActive(active);
        user.setRole(role);
        userdb.update(user);
    }
    
    public void delete(String username) throws Exception {
        UserDB userdb = new UserDB();
        Users user = userdb.get(username);
        userdb.delete(user);
    }
    
}
