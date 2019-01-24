package com.wavemagister.entities;

import java.io.Serializable;

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
    public Integer getId()
    {
        return id;
    }
    public void setId(Integer id)
    {
        this.id = id;
    }
    public String getStart()
    {
        return start;
    }
    public void setStart(String start)
    {
        this.start = start;
    }
    public String getEnd()
    {
        return end;
    }
    public void setEnd(String end)
    {
        this.end = end;
    }
    public Vessel getVessel()
    {
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
    
//    @Override
//    public int hashCode()
//    {
//        final int prime = 31;
//        int result = 1;
//        result = prime * result + ((vessel == null) ? 0 : vessel.hashCode());
//        result = prime * result + ((end == null) ? 0 : end.hashCode());
//        result = prime * result + ((id == null) ? 0 : id.hashCode());
//        result = prime * result + ((start == null) ? 0 : start.hashCode());
//        return result;
//    }
//    @Override
//    public boolean equals(Object obj)
//    {
//        if (this == obj)
//            return true;
//        if (obj == null)
//            return false;
//        if (getClass() != obj.getClass())
//            return false;
//        Agreement other = (Agreement) obj;
//        if (vessel == null)
//        {
//            if (other.vessel != null)
//                return false;
//        } else if (!vessel.equals(other.vessel))
//            return false;
//        if (end == null)
//        {
//            if (other.end != null)
//                return false;
//        } else if (!end.equals(other.end))
//            return false;
//        if (id == null)
//        {
//            if (other.id != null)
//                return false;
//        } else if (!id.equals(other.id))
//            return false;
//        if (start == null)
//        {
//            if (other.start != null)
//                return false;
//        } else if (!start.equals(other.start))
//            return false;
//        return true;
//    }
    @Override
    public String toString()
    {
        return "Agreement [id=" + id + ", start=" + start + ", end=" + end + ", vessel_id=" + vessel + ", user_id=" + charterer+ ", freight=" + freight  + "]";
    }
}