package com.wavemagister.controllers;

import com.wavemagister.entities.User;
import com.wavemagister.dao.UserDAO;
import com.wavemagister.entities.Login;
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

    @RequestMapping(value = "/user", method=RequestMethod.POST)
    public ModelAndView insertUser(@ModelAttribute("admin") User user) {
        
        try {
            User existingUser = userDAO.getUserByUsername(user.getUsername());
            if(existingUser != null){
                user.setId(existingUser.getId());
                userDAO.updateUser(user);
            }
        }
        catch(EmptyResultDataAccessException e) {
            System.out.println("inside catch");
            userDAO.insertUser(user);
        }
        return new ModelAndView("redirect:/admin");
    }
    
    
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public boolean showRegister(@ModelAttribute("register") User user) {
        boolean check = false;
        try{
            userDAO.insertUser(user);
            check = true;
        }
        catch(Exception e){
        }
        return check;
        //return new ModelAndView("activation_pending");
    }
    

    @RequestMapping(value = "/edit/{id}")
    public ModelAndView editUser(@ModelAttribute("user") User user, @PathVariable("id") int id) {
        if(!Login.loggedIn)
            return new ModelAndView("redirect:/login");
        if(!Login.loggedUser.getRole().equals("admin"))
            return new ModelAndView("access_denied");
        
        ModelAndView model = new ModelAndView("admin");

        user = userDAO.getUserById(id);
        List<User> userList = userDAO.getAllUsers();

        model.addObject("user",user);
        model.addObject("userList",userList);

        return model;
    }

    @RequestMapping(value = "/delete/{id}")
    public ModelAndView deleteUser(@ModelAttribute("admin") User user,@PathVariable("id") int id) {
        if(!Login.loggedIn)
            return new ModelAndView("redirect:/login");
        if(!Login.loggedUser.getRole().equals("admin"))
            return new ModelAndView("access_denied");
        
        userDAO.deleteUser(id);
        return new ModelAndView("redirect:/admin");
    }

    @RequestMapping(value = "/admin")
    public ModelAndView listUsers(@ModelAttribute("user") User user) {
        if(!Login.loggedIn)
            return new ModelAndView("redirect:/login");
        if(!Login.loggedUser.getRole().equals("admin"))
            return new ModelAndView("access_denied");
        
        List<User> charterers = userDAO.getUsersByRole("charterer");
        List<User> shipowners = userDAO.getUsersByRole("shipowner");

        ModelAndView model = new ModelAndView("admin");
        model.addObject("charterers", charterers);
        model.addObject("shipowners", shipowners);

        return model;
    }
}