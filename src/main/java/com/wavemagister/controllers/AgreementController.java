package com.wavemagister.controllers;

import com.wavemagister.dao.AgreementDAO;
import com.wavemagister.entities.Agreement;
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

    @RequestMapping(value = "/agreement",method=RequestMethod.POST)
    public ModelAndView saveAgreement(@ModelAttribute("agreement") Agreement agreement)
    {
        if(agreement.getId() != null){
            agreementDAO.getAgreementById(agreement.getId());
            agreementDAO.updateAgreement(agreement);
            }else{            
            agreementDAO.saveAgreement(agreement);  
            }
        return new ModelAndView("redirect:/agreements");
    }
    
    @RequestMapping(value = "/editagreement/{id}")
    public ModelAndView editAgreement(@ModelAttribute("agreement") Agreement agreement,@PathVariable("id") int id)
    {
        ModelAndView model = new ModelAndView("agreements");
        
        agreement = agreementDAO.getAgreementById(id);
        List<Agreement> agreementList = agreementDAO.getAllAgreements();
        
        model.addObject("agreement",agreement);        
        model.addObject("agreementList",agreementList);
        
        return model;
        
    }
    
    @RequestMapping(value = "/deleteagreement/{id}")
    public ModelAndView deleteAgreement(@ModelAttribute("agreement") Agreement employee,@PathVariable("id") int id)
    {
        agreementDAO.deleteAgreement(id);
        
        return new ModelAndView("redirect:/agreements");
    }

    @RequestMapping(value = "/shipowner_agreements")
    public ModelAndView listShipownerAgreements(@ModelAttribute("agreement") Agreement agreement)
    {
        ModelAndView model = new ModelAndView("shipowner_agreements");
        // for testing :
        User loggedInUser = new User();
        loggedInUser.setId(2);
    
        List<Agreement> shipownerAgreementList = agreementDAO.getShipownerAgreements(loggedInUser);
        model.addObject("shipownerAgreementList", shipownerAgreementList);
        
        return model;
    }
    
    @RequestMapping(value = "/charterer_agreements")
    public ModelAndView listChartererAgreements(@ModelAttribute("agreement") Agreement agreement)
    {
        ModelAndView model = new ModelAndView("charterer_agreements");
        
        // for testing :
        User loggedInUser = new User();
        loggedInUser.setId(2);
        
        List<Agreement> chartererAgreementList = agreementDAO.getShipownerAgreements(loggedInUser);
        model.addObject("chartererAgreementList", chartererAgreementList);
        
        return model;
    }
    
    @RequestMapping(value = "/agreements")
    public ModelAndView listAgreements(@ModelAttribute("agreement") Agreement agreement)
    {
        ModelAndView model = new ModelAndView("agreements");

        List<Agreement> agreementList = agreementDAO.getAllAgreements();
        model.addObject("agreementList", agreementList);
        
        return model;
    }
}
