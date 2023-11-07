package com.example.bookingevent.models;

public class EventPost {
    private String id;
    private String title;
    private String content;
    private String image;
    private String category;
    private String post_date;
    private String state;
    private String author;
    private String location;

    public EventPost(String id, String title, String content, String image, String category, String post_date, String state, String author, String location) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.image = image;
        this.category = category;
        this.post_date = post_date;
        this.state = state;
        this.author = author;
        this.location = location;
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
        return post_date;
    }

    public void setPost_date(String post_date) {
        this.post_date = post_date;
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
                ", post_date='" + post_date + '\'' +
                ", state='" + state + '\'' +
                ", author='" + author + '\'' +
                ", location='" + location + '\'' +
                '}';
    }
}
