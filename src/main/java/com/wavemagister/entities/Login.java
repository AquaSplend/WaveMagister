
package com.wavemagister.entities;

import com.wavemagister.dao.UserDAO;

/**
 *
 * @author DStelios
 */
public class Login {
 
    private static boolean loggedIn = false;
    private static User loggedInUser = null;

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
        loggedInUser = user;
        return true;
    }
    
    public void logout(){ 
        loggedIn = false; 
        loggedInUser = null;
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
    
        public static boolean isLoggedIn() {
        return loggedIn;
    }

    public static void setLoggedIn(boolean aLoggedIn) {
        loggedIn = aLoggedIn;
    }

    public static User getLoggedInUser() {
        return loggedInUser;
    }

    public static void setLoggedInUser(User aLoggedInUser) {
        loggedInUser = aLoggedInUser;
    }    
}
