package com.wavemagister.dao;


import com.wavemagister.entities.Vessels;
import java.util.List;

public interface VesselDAO
{
    public void insertVessel(Vessels vessel);
    public Vessels getVesselById(int id);
    public void updateVessel(Vessels vessel);
    public void deleteVessel(int id);
    public List<Vessels> getAllVessels();
    public Vessels getVesselByName(String Vname);
}
