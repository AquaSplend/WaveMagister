package com.wavemagister.controllers;

import com.wavemagister.dao.AgreementDAO;
import com.wavemagister.dao.VesselDAO;
import com.wavemagister.entities.Agreement;
import com.wavemagister.entities.Login;
import com.wavemagister.entities.User;
import com.wavemagister.entities.Vessel;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AgreementController
{
    @Autowired
    private AgreementDAO agreementDAO;
    
    @Autowired
    private VesselDAO vessselDAO;

    
    @RequestMapping(value = "/agreement", method=RequestMethod.POST)
    public ModelAndView saveAgreement( @RequestParam("id") int vessel_id,
     @RequestParam("freight") int freight,
     @RequestParam("start") String start,
     @RequestParam("end") String end ){

        System.out.println("Add agreement*****************************************");
        System.out.println(start);
        System.out.println(end);
        System.out.println(freight);

        if(!Login.loggedIn)
            return new ModelAndView("redirect:/login");
        if(!Login.loggedUser.getRole().equals("charterer"))
            return new ModelAndView("access_denied");
        
        Vessel vessel = vessselDAO.getVesselById(vessel_id);
        User charterer = Login.loggedUser;
        Agreement agreement = new Agreement(start, end, vessel, charterer, freight);
        
        // Check if agreement exists ?
        agreementDAO.saveAgreement(agreement);  
        
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
}