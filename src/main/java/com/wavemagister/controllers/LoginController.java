package com.wavemagister.controllers;

import com.wavemagister.entities.User;
import com.wavemagister.dao.UserDAO;
import com.wavemagister.entities.Login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

    @Autowired
    private UserDAO userDAO;

    @RequestMapping(value = "/main", method = RequestMethod.POST)
    public ModelAndView main(@ModelAttribute("login") Login login) {
        login.setUserDAO(userDAO);

        if (login.checkLogin()) {
            User user = Login.getLoggedInUser();

            if (user.isActivated()) {
                switch (user.getRole()) {
                    case "admin":
                        return new ModelAndView("redirect:/admin");
                    case "shipowner":
                        return new ModelAndView("redirect:/shipowner");
                    case "charterer":
                        return new ModelAndView("redirect:/charterer");
                }
            } else {
                return new ModelAndView("activation_pending");
            }
        }
        return new ModelAndView("redirect:/login");
    }

    @RequestMapping(value = "/login")
    public ModelAndView loginUser(@ModelAttribute("login") Login login, @ModelAttribute("register") User user) {

        if (Login.getLoggedInUser() != null) {
            switch (Login.getLoggedInUser().getRole()) {
                case "admin":
                    return new ModelAndView("redirect:/admin");
                case "shipowner":
                    return new ModelAndView("redirect:/shipowner");
                case "charterer":
                    return new ModelAndView("redirect:/charterer");
            }
        }
        return new ModelAndView("login");
    }

    @RequestMapping(value = "/logout")
    public ModelAndView logoutUser(@ModelAttribute("login") Login login, @ModelAttribute("register") User user) {
        Login.setLoggedInUser(null);
        Login.setLoggedIn(false);
        return new ModelAndView("redirect:/login");
    }

    @RequestMapping(value = "/change_password", method = RequestMethod.POST)
    public ModelAndView changePassword(@RequestParam("password") String password) {
        Login.getLoggedInUser().setPassword(password);
        userDAO.updateUser(Login.getLoggedInUser());
        return new ModelAndView("redirect:/login");
    }

    @RequestMapping(value = "/shipowner")
    public ModelAndView shipowner() {
        if (!Login.isLoggedIn()) {
            return new ModelAndView("redirect:/login");
        }
        if (!Login.getLoggedInUser().getRole().equals("shipowner")) {
            return new ModelAndView("access_denied");
        }

        return new ModelAndView("shipowner");
    }

    @RequestMapping(value = "/charterer")
    public ModelAndView charterer() {
        if (!Login.isLoggedIn()) {
            return new ModelAndView("redirect:/login");
        }
        if (!Login.getLoggedInUser().getRole().equals("charterer")) {
            return new ModelAndView("access_denied");
        }

        return new ModelAndView("charterer");
    }
}
