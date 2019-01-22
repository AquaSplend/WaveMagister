package com.wavemagister.entities;

public class Offer {
    private int quantity;
    private String start;
    private String end;

    public Offer() {

    }

    public Offer(int quantity, String start, String end) {
        this.quantity = quantity;
        this.start = start;
        this.end = end;
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
}