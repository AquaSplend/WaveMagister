
package com.wavemagister.entities;

import com.wavemagister.dao.UserDAO;

/**
 *
 * @author DStelios
 */
public class Login {
 
    public static boolean loggedIn = false;
    public static User loggedUser = null;
    
    private UserDAO userDAO;
    private String username;
    private String password;

    public Login(){}
    public Login(String username, String password){
        this.username = username;
        this.password = password;
    }
    
    public boolean checkLogin(){
        User user = userDAO.getUserByUsername(username);
        if(user == null)
            return false;
        if(!user.getPassword().equals(password))
            return false;
        
        loggedIn = true;
        loggedUser = user;
        return true;
    }
    
    public void logout(){ 
        loggedIn = false; 
        loggedUser = null;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }
}
