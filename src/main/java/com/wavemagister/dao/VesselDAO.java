package com.wavemagister.dao;


import com.wavemagister.entities.Vessel;
import java.util.List;

public interface VesselDAO
{
    public void insertVessel(Vessel vessel);
    public Vessel getVesselById(int id);
    public void updateVessel(Vessel vessel);
    public void deleteVessel(int id);
    public List<Vessel> getAllVessels();
    public Vessel getVesselByName(String Vname);
}
