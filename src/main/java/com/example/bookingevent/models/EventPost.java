package com.example.bookingevent.models;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class EventPost {
    private String id;
    private String title;
    private String content;
    private String start_date;
    private String end_date;
    private String location;
    private boolean is_verified;
    private int author_id;
    private int category_id;
    private int tickets;
    private int price;
    private String image;
    private String category_name;
}