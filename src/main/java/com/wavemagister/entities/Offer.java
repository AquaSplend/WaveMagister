package com.wavemagister.entities;

public class Offer {
    private int quantity;
    private String start;
    private String end;
    private double oilPrice;
    private int days;

    public Offer() {

    }

    public Offer(int quantity, String start, String end, double oilPrice, int days) {
        this.quantity = quantity;
        this.start = start;
        this.end = end;
        this.oilPrice = oilPrice;
        this.days = days;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }

    public double getOilPrice() {
        return oilPrice;
    }

    public void setOilPrice(double oilPrice) {
        this.oilPrice = oilPrice;
    }

    public int getDays() {
        return days;
    }

    public void setDays(int days) {
        this.days = days;
    }
        
}