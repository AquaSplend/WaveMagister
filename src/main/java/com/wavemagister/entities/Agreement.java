package com.wavemagister.entities;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class Agreement implements Serializable {
   

    private Integer id;
    private String start;
    private String end;
    private Vessel vessel;
    private User charterer;
    private Integer freight;
    
    
    public Agreement()
    {
        super();
    }
    public Agreement(String start, String end, Vessel vessel, User charterer, Integer freight)
    {
        super();
        this.start = start;
        this.end = end;
        this.vessel = vessel;
        this.charterer = charterer;
        this.freight = freight;
    }
    public Agreement(Integer id, String start, String end, Vessel vessel, User charterer, Integer freight)
    {
        super();
        this.id = id;
        this.start = start;
        this.end = end;
        this.vessel = vessel;
        this.charterer = charterer;
        this.freight = freight;
    }
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStart() {
        try {
            return new SimpleDateFormat("dd-MM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(start));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getEnd() {
        try {
            return new SimpleDateFormat("dd-MM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(end));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void setEnd(String end) {
        this.end = end;
    }

    public Vessel getVessel() {
        return vessel;
    }

    public void setVessel(Vessel vessel)
    {
        this.vessel = vessel;
    }

    public User getCharterer() {
        return charterer;
    }

    public void setCharterer(User charterer) {
        this.charterer = charterer;
    }

    public Integer getFreight() {
        return freight;
    }

    public void setFreight(Integer freight) {
        this.freight = freight;
    }    

    @Override
    public String toString()
    {
        return "Agreement [id=" + id + ", start=" + start + ", end=" + end + ", vessel_id=" + vessel + ", user_id=" + charterer+ ", freight=" + freight  + "]";
    }
}