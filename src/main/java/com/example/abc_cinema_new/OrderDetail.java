package com.example.abc_cinema_new;

public class OrderDetail {
    private int id;
    private String detail;
    private float mTotal;

    public OrderDetail(int id, float Total,String detials) {
        this.id = id;
        this.mTotal = Float.parseFloat(String.valueOf(Total));
        this.detail = detials;
    }



    public String getId() {
        return Integer.toString(id);
    }
    public String getTotal() {
        return String.format("%.2f", mTotal);
    }
    public String getDetail(){
        return detail;
    }

}
