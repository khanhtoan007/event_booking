package com.example.bookingevent.models;

import lombok.*;

import java.util.List;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Bills {
    private int id;
    private int amount;
    private String transfer_context;
    private boolean status;
    private String paid_at;
    private List<Cart> item;

}
