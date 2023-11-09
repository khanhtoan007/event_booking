package com.example.bookingevent.models;

public class EventPost {
    private String id;
    private String title;
    private String content;
    private String start_date;
    private String end_date;
    private String location;
    private String state;
    private String author;
    private String image;
    private String category;

    public EventPost(String id, String title, String content, String start_date, String end_date, String location, String state, String author, String image, String category) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.start_date = start_date;
        this.end_date = end_date;
        this.location = location;
        this.state = state;
        this.author = author;
        this.image = image;
        this.category = category;
    }

    public EventPost() {
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

    public String getImage() {
        return image;
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

    public void setImage(String image) {
        this.image = image;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getPost_date() {
        return start_date;
    }

    public void setPost_date(String start_date) {
        this.start_date = start_date;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    @Override
    public String toString() {
        return "EventPost{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", image='" + image + '\'' +
                ", category='" + category + '\'' +
                ", start_date='" + start_date + '\'' +
                ", end_date='" + end_date + '\'' +
                ", state='" + state + '\'' +
                ", author='" + author + '\'' +
                ", location='" + location + '\'' +
                '}';
    }
}
