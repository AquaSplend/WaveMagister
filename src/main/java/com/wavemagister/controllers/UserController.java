package com.wavemagister.controllers;

import com.wavemagister.entities.User;
import com.wavemagister.dao.UserDAO;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController
{
    @Autowired
    private UserDAO userDAO;

    @RequestMapping(value = "/user",method=RequestMethod.POST)
    public ModelAndView insertUser(@ModelAttribute("admin") User user)
    {   
        try
        {
            User existingUser = userDAO.getUserByUsername(user.getUsername());
            if(existingUser != null){ 
                user.setId(existingUser.getId());
                userDAO.updateUser(user); 
            }
        }
        catch(EmptyResultDataAccessException e)
        {
            System.out.println("inside catch");
            userDAO.insertUser(user);
        }
        return new ModelAndView("redirect:/users");
    }
    
    @RequestMapping(value = "/edit/{id}")
    public ModelAndView editUser(@ModelAttribute("user") User user,@PathVariable("id") int id)
    {
        ModelAndView model = new ModelAndView("admin");
        
        user = userDAO.getUserById(id);
        List<User> userList = userDAO.getAllUsers();
        
        model.addObject("user",user);        
        model.addObject("userList",userList);
        
        return model; 
    }
    
    @RequestMapping(value = "/delete/{id}")
    public ModelAndView deleteUser(@ModelAttribute("admin") User user,@PathVariable("id") int id)
    {
        userDAO.deleteUser(id);
        
        // go to Dispatcher and the Dispatcher sends to appropriate controller
        return new ModelAndView("redirect:/users");
    }

    @RequestMapping(value = "/users")
    public ModelAndView listUsers(@ModelAttribute("user") User user)
    {
        ModelAndView model = new ModelAndView("admin");

        //List<User> userList = userDAO.getAllUsers();
        List<User> charterers = userDAO.getUsersByRole("charterer");
        List<User> shipowners = userDAO.getUsersByRole("shipowner");
        
        //System.out.println(userList);
        //model.addObject("userList", userList);
        model.addObject("charterers", charterers);
        model.addObject("shipowners", shipowners);
        
        return model;
    }
}
