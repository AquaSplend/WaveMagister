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
public class LoginController
{
    @Autowired
    private UserDAO userDAO;

    @RequestMapping(value = "/main", method=RequestMethod.POST)
    public ModelAndView main(@ModelAttribute("login") Login login)
    {
        login.setUserDAO(userDAO);
        
        if(login.checkLogin()){
            User user = Login.loggedUser;
            switch(user.getRole()){
                case "admin":
                    return new ModelAndView("redirect:/users");
                case "shipowner":
                    return new ModelAndView("redirect:/shipowner_agreements");
                case "charterer":
                    return new ModelAndView("redirect:/charterer_agreements");
            }
        }
        return new ModelAndView("redirect:/login");          
    }
    
    @RequestMapping( value = "/login")
    public ModelAndView loginUser(@ModelAttribute("login") Login login, 
            @ModelAttribute("register") User user)
    {
        return new ModelAndView("login"); 
    }
}