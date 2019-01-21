
package com.wavemagister.controllers;

import com.wavemagister.dao.RegDAO;
import com.wavemagister.entities.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author ΑΛΕΞΑΝΔΡΟΣ
 */
@Controller
public class RegController {

    @Autowired
    private RegDAO RegDAO;

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ModelAndView showRegister(@ModelAttribute("register") User user) {

        RegDAO.register(user);
        return new ModelAndView("activation_pending");
    }
}
