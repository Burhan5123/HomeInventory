package models;

import java.io.Serializable;

public class AccountService implements Serializable{
    
    public User login(String email, String password, String first_name, String last_name, boolean active){
        
        if((email.equals("abe") || email.equals("barb")) && password.equals("password")){
        
        return new User(email, password, first_name, last_name, active);
        
        }
        else{
                
            return null;    
        }
    
    
    }  

    public User login(String email, String password) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}