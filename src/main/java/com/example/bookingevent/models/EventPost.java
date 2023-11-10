package com.example.bookingevent.models;

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
    private String Category_name;
    private String U_name;

    public EventPost(String id, String title, String content, String start_date, String end_date, String location, String state, int author_id, int category_id, String image, String category_name, String u_name) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.start_date = start_date;
        this.end_date = end_date;
        this.location = location;
        this.state = state;
        this.author_id = author_id;
        this.category_id = category_id;
        this.image = image;
        Category_name = category_name;
        U_name = u_name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public int getAuthor_id() {
        return author_id;
    }

    public void setAuthor_id(int author_id) {
        this.author_id = author_id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public EventPost() {
    }


    public String getCategory_name() {
        return Category_name;
    }

    public void setCategory_name(String category_name) {
        Category_name = category_name;
    }

    public String getU_name() {
        return U_name;
    }

    public void setU_name(String u_name) {
        U_name = u_name;
    }

    @Override
    public String toString() {
        return "EventPost{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", start_date='" + start_date + '\'' +
                ", end_date='" + end_date + '\'' +
                ", location='" + location + '\'' +
                ", state='" + state + '\'' +
                ", author_id=" + author_id +
                ", category_id=" + category_id +
                ", image='" + image + '\'' +
                ", Category_name='" + Category_name + '\'' +
                ", U_name='" + U_name + '\'' +
                '}';
    }
}
