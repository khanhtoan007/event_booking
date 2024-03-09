package com.example.bookingevent.daos;
import com.example.bookingevent.database.DBContext;
import com.example.bookingevent.models.Cart;
import com.example.bookingevent.models.Category;
import com.example.bookingevent.models.EventPost;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EventDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;



    public List<EventPost> getEvent() {
        List<EventPost> list = new ArrayList<>();
        String query = "select e.*, c.name as category_name\n" +
                "FROM events e\n" +
                "JOIN categories c ON e.category_id = c.id";
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
                        rs.getBoolean(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getString(12),
                        rs.getString(13)

                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }




    public EventPost getEventPostByID(int eventID) {
        EventPost list = new EventPost();
        String query = "select e.*, c.name as category_name\n" +
                "FROM events e\n" +
                "JOIN categories c ON e.category_id = c.id where e.id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1,eventID);
            rs = ps.executeQuery();
            if (rs.next()) {
                list = new EventPost(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getBoolean(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getString(12),
                        rs.getString(13)
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean addItemToCart(int user_id, int event_id,int quantity,int price, String note){
        String query = "INSERT INTO carts values (?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1,user_id);
            ps.setInt(2,event_id);
            ps.setInt(3,quantity);
            ps.setInt(4,price);
            ps.setString(5,note);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("add to cart");
            return false;
        }
        return true;
    }


    public List<Cart> viewCart(int id){
        List<Cart> cartList = new ArrayList<>();
        String query = "select * from carts where user_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                cartList.add(new Cart(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6)

                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cartList;
    }



    public boolean addEventPost(String title, String description, String start_date,  String end_date, String location, String state, String user_id, String category_id, String image) {
        String query = "INSERT INTO Event VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, description);
            ps.setString(3, start_date);
            ps.setString(4, end_date);
            ps.setString(5, location);
            ps.setString(6, state);
            ps.setString(7, user_id);
            ps.setString(8, category_id);
            ps.setString(9, image);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("add event ok");
            return false;
        }
        System.out.println("add event ok");
        return true;
    }  //done

    public boolean updateEventPost(String title, String description, String start_date,  String end_date, String location, String state, int event_id, String category_id, String image) {
        String query = "UPDATE Event SET title = ?,\n" +
                        "    description = ?,\n" +
                        "    start_date = ?,\n" +
                        "    end_date = ?,\n" +
                        "    location = ?,\n" +
                        "    state = ?,\n" +
                        "    category_id = ?,\n" +
                        "    image = ?\n" +
                        "WHERE event_id = ?;";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, description);
            ps.setString(3, start_date);
            ps.setString(4, end_date);
            ps.setString(5, location);
            ps.setString(6, state);
            ps.setString(7, category_id);
            ps.setString(8, image);
            ps.setInt(9, event_id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("update event not ok");
            return false;
        }
        System.out.println("update event ok");
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



    public ArrayList<Category> getAllCategory()
    {
        ArrayList<Category> list = new ArrayList<>();
        String query = "SELECT * from categories";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getString(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }




    public static void main(String[] args) {
        EventDAO dao = new EventDAO();

//        System.out.println(dao.addItemToCart(2,2,3,30000,"new cart"));
        System.out.println(dao.getEventPostByID(1));
    }

}