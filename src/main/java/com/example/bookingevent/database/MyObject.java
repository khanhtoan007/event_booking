package com.example.bookingevent.database;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class MyObject {
    public String event_id;
    public String title;
    public String description;
    public String start_date;
    public String end_date;
    public String location;
    public String state;
    public String user_id;
    public String image;
    public String category;
    public String password;
    public String is_verify;
}