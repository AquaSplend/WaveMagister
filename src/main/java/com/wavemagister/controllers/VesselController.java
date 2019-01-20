package com.wavemagister.controllers;

import com.wavemagister.dao.VesselDAO;
import com.wavemagister.entities.Vessel;
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
public class VesselController
{
    @Autowired
    private VesselDAO vesselDAO;

    @RequestMapping(value = "/vessel",method=RequestMethod.POST)
    public ModelAndView insertVessel(@ModelAttribute("vessel") Vessel vessel)
    {
        try
        {
            Vessel existingVessel = vesselDAO.getVesselById(vessel.getId());
            if(existingVessel != null){
                vessel.setId(existingVessel.getId());
                vesselDAO.updateVessel(vessel);
            }
        }
        catch(EmptyResultDataAccessException e)
        {
            System.out.println("inside catch");
            vesselDAO.insertVessel(vessel);
        }
        return new ModelAndView("redirect:/vessels");
    }

    @RequestMapping(value = "/Vedit/{id}")
    public ModelAndView editVessels(@ModelAttribute("vessel") Vessel vessel,@PathVariable("id") int id)
    {
        ModelAndView model = new ModelAndView("shipowner");

        vessel = vesselDAO.getVesselById(id);
        List<Vessel> vesselList = vesselDAO.getAllVessels();

        model.addObject("vessel",vessel);
        model.addObject("vesselList",vesselList);

        return model;
    }

    @RequestMapping(value = "/Vdelete/{id}")
    public ModelAndView deleteVessel(@ModelAttribute("vessel") Vessel vessel,@PathVariable("id") int id)
    {
        vesselDAO.deleteVessel(id);

        // go to Dispatcher and the Dispatcher sends to appropriate controller
        return new ModelAndView("redirect:/vessels");
    }

    @RequestMapping(value = "/vessels")
    public ModelAndView listVessels(@ModelAttribute("vessel") Vessel vessel)
    {
        ModelAndView model = new ModelAndView("shipowner");

        List<Vessel> vesselList = vesselDAO.getAllVessels();
        System.out.println(vesselList);
        model.addObject("vesselList", vesselList);

        return model;
    }
}