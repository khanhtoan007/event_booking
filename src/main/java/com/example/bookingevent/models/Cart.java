package com.example.bookingevent.models;

import lombok.*;

import java.util.List;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
    private int id;
    private int user_id;
    private int event_id;
    private int quantity;
    private int price;
    private String note;
}
