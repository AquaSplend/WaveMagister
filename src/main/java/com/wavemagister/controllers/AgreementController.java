package com.wavemagister.controllers;

import com.wavemagister.dao.AgreementDAO;
import com.wavemagister.entities.Agreement;
import com.wavemagister.entities.Login;
import com.wavemagister.entities.User;
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
public class AgreementController
{
    @Autowired
    private AgreementDAO agreementDAO;

    
    @RequestMapping(value = "/agreement", method=RequestMethod.POST)
    public ModelAndView saveAgreement(@ModelAttribute("agreement") Agreement agreement)
    {
        if(!Login.loggedIn)
            return new ModelAndView("redirect:/login");
        if(!Login.loggedUser.getRole().equals("charterer"))
            return new ModelAndView("access_denied");
        
        
        if(agreement.getId() != null){
            agreementDAO.getAgreementById(agreement.getId());
            agreementDAO.updateAgreement(agreement);
            }
        else{            
            agreementDAO.saveAgreement(agreement);  
        }
        return new ModelAndView("redirect:/charterer_agreements");
    }
 

    @RequestMapping(value = "/shipowner_agreements")
    public ModelAndView listShipownerAgreements(@ModelAttribute("agreement") Agreement agreement)
    {
        if(!Login.loggedIn)
            return new ModelAndView("redirect:/login");
        if(!Login.loggedUser.getRole().equals("shipowner"))
            return new ModelAndView("access_denied");
        
        
        ModelAndView model = new ModelAndView("shipowner_agreements");

        List<Agreement> shipownerAgreementList = agreementDAO.getShipownerAgreements(Login.loggedUser);
        model.addObject("shipownerAgreementList", shipownerAgreementList);
        
        return model;
    }
    
    @RequestMapping(value = "/charterer_agreements")
    public ModelAndView listChartererAgreements(@ModelAttribute("agreement") Agreement agreement)
    {
        if(!Login.loggedIn)
            return new ModelAndView("redirect:/login");
        if(!Login.loggedUser.getRole().equals("charterer"))
            return new ModelAndView("access_denied");
        
        
        ModelAndView model = new ModelAndView("charterer_agreements");
        
        List<Agreement> chartererAgreementList = agreementDAO.getShipownerAgreements(Login.loggedUser);
        model.addObject("chartererAgreementList", chartererAgreementList);
        
        return model;
    }
    
    
//    @RequestMapping(value = "/agreements")
//    public ModelAndView listAgreements(@ModelAttribute("agreement") Agreement agreement)
//    {
//        ModelAndView model = new ModelAndView("agreements");
//
//        List<Agreement> agreementList = agreementDAO.getAllAgreements();
//        model.addObject("agreementList", agreementList);
//        
//        return model;
//    }
}
