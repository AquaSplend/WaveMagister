package com.wavemagister.dao;

import com.wavemagister.entities.User;
import java.util.List;

public interface UserDAO
{
    public void insertUser(User user);
    public User getUserById(int id);
    public void updateUser(User user);
    public void deleteUser(int id);
    public List<User> getAllUsers();
    public List<User> getUsersByRole(String role);
    public User getUserByUsername(String username);
}
