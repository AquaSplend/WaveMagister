
package com.wavemagister.entities;


public class Vessels {
    private int id;
    private String name;
    private String flag;
    private String year_built;
    private int dwt;
    private int costs;
    private int shipowner;
    private boolean active;

    public Vessels(){
        
    }

    public Vessels(int id, String name, String flag, String year_built, int dwt, int shipowner,int costs ,boolean active) {
        this.id = id;
        this.name = name;
        this.flag = flag;
        this.year_built = year_built;
        this.dwt = dwt;
        this.shipowner = shipowner;
        this.active = active;
    }
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public String getYear_built() {
        return year_built;
    }

    public void setYear_built(String year_built) {
        this.year_built = year_built;
    }

    public int getDwt() {
        return dwt;
    }

    public void setDwt(int dwt) {
        this.dwt = dwt;
    }

    public int getShipowner() {
        return shipowner;
    }

    public void setShipowner(int shipowner) {
        this.shipowner = shipowner;
    }

    public int getCosts() {
        return costs;
    }

    public void setCosts(int costs) {
        this.costs = costs;
    }

    public boolean getActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }
    


    
    @Override
    public String toString(){
        return "ID: " + id + "\nName: " + name + "\nFlag: " + flag + "\nYear_built: " + year_built + 
               "\nDwt: " + dwt + "\nCosts: " + costs+"\nShipowner: "+shipowner +"\nActive: "+ active ;
    }

}
