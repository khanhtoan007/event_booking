package com.example.bookingevent.daos;
import com.example.bookingevent.database.DBContext;
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
                        rs.getString(10)
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

//    public List<EventPostDTO> getEventPostListById(int user_id) {
//        List<EventPostDTO> list = new ArrayList<>();
//        String query = "select * from Event join Category C on Event.category_id = C.category_id where user_id = ?;";
//        try {
//            conn = new DBContext().getConnection();
//            ps = conn.prepareStatement(query);
//            ps.setInt(1, user_id);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                list.add(new EventPostDTO(
//                        rs.getString(1),
//                        rs.getString(2),
//                        rs.getString(3),
//                        rs.getString(4),
//                        rs.getString(5),
//                        rs.getString(6),
//                        rs.getString(7),
//                        rs.getString(8),
//                        rs.getString(10),
//                        rs.getString(12)
//                ));
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }

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
                        rs.getString(10)

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
                        rs.getString(10)

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
        String query = "SELECT Event.*, Category.name as Category_name, U.name as U_name  from Event inner join Category on Event.category_id = Category.category_id inner join [User] U on U.user_id = Event.user_id  where event_id = ?";
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
        String query = "SELECT * from Category";
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

    //get event by price
    public List<EventPost> getEventByPrice(int minPrice, int maxPrice) {
        List<EventPost> list = new ArrayList<>();
        String query = "SELECT * FROM products WHERE price BETWEEN ? AND ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, minPrice);
            ps.setInt(2, maxPrice);
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
                        rs.getString(10)
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    public static void main(String[] args) {
        EventDAO dao = new EventDAO();

        ArrayList<EventPost> list = dao.getEventPostByID(1);

        System.out.println(list);
    }
}