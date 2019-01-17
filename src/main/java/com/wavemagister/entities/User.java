
package com.wavemagister.entities;


public class User {
    private int id;
    private String username;
    private String password;
    private String company;
    private String role;
    private boolean activated;
    
    public User(){};
    public User(String username, String password, String company, String role, boolean activated){
        this.username = username;
        this.password = password;
        this.company = company;
        this.role = role;
        this.activated = activated;     
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

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public boolean isActivated() {
        return activated;
    }

    public void setActivated(boolean activated) {
        this.activated = activated;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    @Override
    public String toString(){
        return "ID: " + id + "\nUsername: " + username + "\nPassword: " + password + "\nCompany: " + company + 
               "\nRole: " + role + "\nActivated: " + activated;
    }

}
