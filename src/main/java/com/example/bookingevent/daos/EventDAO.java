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
        String query = "SELECT * from Event";
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
                        rs.getString(8),
                        rs.getString(9)
                ));
            }
        } catch (Exception e) {
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
                        rs.getString(8),
                        rs.getString(9)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }
    public EventPost getEventPostByID(int contentID) {
        String query = "SELECT * from Event where id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, contentID);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new EventPost(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9)
                );
            }
        } catch (Exception e) {
        }
        return null;
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
        List<EventPost> list = dao.getEventPostByCategory("Activity");
        list = dao.getEventPostList();
        System.out.println(list.toString());
    }
}