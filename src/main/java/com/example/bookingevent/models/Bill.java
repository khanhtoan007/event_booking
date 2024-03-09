package com.example.bookingevent.models;

import java.sql.Timestamp;
import java.util.ArrayList;

public class Bill {
    private int id;
    private int user_id;
    private Cart carts[];
    private int total;
    private String description;
    private Timestamp createAt;
    private String status;


}
