package com.wavemagister.controllers;

import com.wavemagister.dao.UserDAO;
import com.wavemagister.dao.VesselDAO;
import com.wavemagister.entities.Login;
import com.wavemagister.entities.Offer;
import com.wavemagister.entities.User;
import com.wavemagister.entities.Vessel;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class VesselController {
    @Autowired
    private VesselDAO vesselDAO;
    
    @Autowired
    private UserDAO userDAO;

    @RequestMapping(value = "/vessel", method=RequestMethod.POST)
    public ModelAndView insertVessel( @RequestParam("name") String name,
     @RequestParam("flag") String flag,
     @RequestParam("year_built") int year_built,
     @RequestParam("dwt") int dwt,
     @RequestParam("costs") int costs ) {
        
        User shipowner = userDAO.getUserById(Login.loggedUser.getId());
        Vessel vessel = new Vessel(name, flag, year_built, dwt, shipowner, costs, true);
        
        // To implement check if vessel already exists
        vesselDAO.insertVessel(vessel);
    
        return new ModelAndView("redirect:/vessels");
    }

    @RequestMapping(value = "/Vedit")
    public ModelAndView editVessels( @RequestParam("id") int id,
     @RequestParam("shipowner") int shipowner_id,
     @RequestParam("name") String name,
     @RequestParam("flag") String flag,
     @RequestParam("year_built") int year_built,
     @RequestParam("dwt") int dwt,
     @RequestParam("costs") int costs,
     @RequestParam("active") boolean active ) {
        
        ModelAndView model = new ModelAndView("shipowner");
        System.out.println(shipowner_id);
        User user = userDAO.getUserById(shipowner_id);
        Vessel vessel = new Vessel(id, name, flag, year_built, dwt, user, costs, active);
        
        vesselDAO.updateVessel(vessel);
        List<Vessel> vesselList = vesselDAO.getAllVessels();
        model.addObject("vesselList",vesselList);

        return model;
    }

    @RequestMapping(value = "/Vdelete/{id}")
    public ModelAndView deleteVessel(@ModelAttribute("vessel") Vessel vessel, @PathVariable("id") int id)
    {
        vesselDAO.deleteVessel(id);

        // go to Dispatcher and the Dispatcher sends to appropriate controller
        return new ModelAndView("redirect:/vessels");
    }

    @RequestMapping(value = "/fleet")
    public ModelAndView listFleet(@ModelAttribute("vessel") Vessel vessel) {

        ModelAndView model = new ModelAndView("shipowner_fleet");

        List<Vessel> vesselList = vesselDAO.getFleet(Login.loggedUser.getId());

        model.addObject("vesselList", vesselList);

        return model;
    }

    
    @RequestMapping(value = "/search_results", method=RequestMethod.POST)
    public ModelAndView listOffers(@ModelAttribute("offer") Offer offer) {

        ModelAndView model = new ModelAndView("search_results");
        //offer.setDays(15);
        //offer.setOilPrice(60.5);
        List<Vessel> offers = vesselDAO.getSpotOffers(offer.getQuantity(), offer.getStart(), offer.getEnd());
        List<Integer> freight = new ArrayList<>();
        //int count = 0;
        System.out.println("Search results*******************************************************");
        for(Vessel availableVessel:offers){     
            System.out.println(offer.getOilPrice());
            System.out.println(offer.getQuantity());
            System.out.println(availableVessel.getCosts());
            int calc = ((int)(offer.getOilPrice()*0.13642565*offer.getQuantity())+availableVessel.getCosts())/offer.getDays();
            freight.add(calc);
            //System.out.println(freight.get(count));
            //count++;
        }

        model.addObject("offers", offers);
        model.addObject("freight", freight);

        return model;
    }
    

    @RequestMapping(value = "/vessels")
    public ModelAndView listVessels(@ModelAttribute("vessel") Vessel vessel) {
        ModelAndView model = new ModelAndView("shipowner_fleet");

        List<Vessel> vesselList = vesselDAO.getAllVessels();
        System.out.println(vesselList);
        model.addObject("vesselList", vesselList);

        return model;
    }
}