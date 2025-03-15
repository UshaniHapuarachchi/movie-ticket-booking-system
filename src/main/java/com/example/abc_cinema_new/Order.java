package com.example.abc_cinema_new;

import lombok.Data;


import java.time.LocalDateTime;
import java.time.LocalTime;

@Data
public class Order {
    int id;
    String userPhoneNumber;
    String seatIndex;
    int movieID;
    LocalTime movieTime;
    LocalDateTime movieDate;
    String payment;


}
