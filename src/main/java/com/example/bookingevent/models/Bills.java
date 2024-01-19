package com.example.bookingevent.models;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Bills {
    private int id;
    private int cart_id;
    private int amount;
    private String transfer_context;
    private boolean status;
    private String paid_at;
}
