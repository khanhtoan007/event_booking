package com.example.bookingevent.daos;

import com.example.bookingevent.database.DBContext;
import com.example.bookingevent.models.EventPost;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EventDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<EventPost> getEventPostList() {
        List<EventPost> list = new ArrayList<>();
        String query = "SELECT Event.*, Category.name as Category_name, U.name as U_name  from Event inner join Category on Event.category_id = Category.category_id inner join [User] U on U.user_id = Event.user_id";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new EventPost(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12)

                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<EventPost> getEventPostByCategory(String category) {
        List<EventPost> list = new ArrayList<>();
        String query = "SELECT * from Event where category = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, category);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add( new EventPost(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12)

                ));
            }
        } catch (Exception e) {
        }
        return list;
    }
    public List<EventPost> getEventByState(String state) {
        List<EventPost> list = new ArrayList<>();
        String query = "SELECT * from Event where state = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, state);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add( new EventPost(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12)

                ));
            }
        } catch (Exception e) {
        }
        return list;
    }
//    public String getState() throws Exception {
//        EventPost eventPost = new EventPost();
//        String query = "SELECT DISTINCT state FROM Event";
//        List<String> states = new ArrayList<>();
//        try {
//            conn = new DBContext().getConnection();
//            ps = conn.prepareStatement(query);
//            rs = ps.executeQuery();
//            s
//
//        } catch (Exception e) {
//            throw new RuntimeException(e);
//        }
//        return eventPost.getState();
//    }
    public ArrayList<EventPost> getEventPostByID(int eventID) {
        String query = "SELECT * from Event SELECT Event.*, Category.name as Category_name  from Event inner join Category on Event.category_id = Category.category_id  where event_id = ?";
        ArrayList<EventPost> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, eventID);
            rs = ps.executeQuery();
            if (rs.next()) {
                list.add(new EventPost(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getString(10)
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean addEventPost(String contentType, String contentName, String label,  String secondLabel,int likeHit, String image, String description, String comment) {
        String query = "INSERT INTO Event VALUES (?,?,?,?,?,?,?,?)";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,contentType);
            ps.setString(2, contentName);
            ps.setString(3, label);
            ps.setString(4, secondLabel);
            ps.setInt(5, likeHit);
            ps.setString(6, image);
            ps.setString(7, description);
            ps.setString(8, comment);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }  //done
    public boolean deleteEventPost(String contentID) {
        String query = "delete from Event\n"
                + "where EventPostID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, contentID);
            ps.executeUpdate();
        } catch (Exception e) {
            return false;
        }
        return  true;
    }
    public void updateEventPost(int contentID, String contentType,  String contentName, String label, String secondLabel, int likeHit, String image, String description, String comment) {
        String query = "update Event set" +
                "type=?" +
                "EventPostName=?" +
                "Label=?" +
                "SecondLabel=?" +
                "LikeHit=?" +
                "Image=?" +
                "Description=?" +
                "Comment=?" +
                "where EventPostID=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, contentType);
            ps.setString(2, contentName);
            ps.setString(3, label);
            ps.setString(4, secondLabel);
            ps.setInt(5, likeHit);
            ps.setString(6, image);
            ps.setString(7, description);
            ps.setString(8, comment);
            ps.setInt(9, contentID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public static void main(String[] args) {
        EventDAO dao = new EventDAO();
        ArrayList<EventPost> list = dao.getEventPostByID(1);


        System.out.println(list);
    }
}