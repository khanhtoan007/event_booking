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
    private String state;
    private int author_id;
    private int category_id;
    private String image;
}