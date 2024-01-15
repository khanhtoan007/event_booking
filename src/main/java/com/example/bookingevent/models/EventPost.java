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

    public EventPost(String id, String title, String content, String start_date, String end_date, String location, boolean is_verified, int author_id, int category_id, int tickets, int price, String image) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.start_date = start_date;
        this.end_date = end_date;
        this.location = location;
        this.is_verified = is_verified;
        this.author_id = author_id;
        this.category_id = category_id;
        this.tickets = tickets;
        this.price = price;
        this.image = image;
    }
}