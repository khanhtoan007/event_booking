package com.example.bookingevent.daos;
import com.example.bookingevent.database.DBContext;
import com.example.bookingevent.models.*;
import com.example.bookingevent.models.Bills;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class BillDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;



    public Bills getBillByCartID(int user_id) {
        Bills list = new Bills();
        List<Cart> cartItems;
        String query = "select * from bills where user_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1,user_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                int billId = rs.getInt("id");
                int amount = rs.getInt("amount");
                String transfer_content = rs.getString("transfer_content");
                boolean status = rs.getBoolean("status");
                String paid_at = rs.getString("paid_at");
                cartItems = getItemInCartByUserID(user_id);
                list = new Bills(billId, amount,transfer_content,status,paid_at,cartItems);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    private List<Cart> getItemInCartByUserID(int user_id){
        List<Cart> cartItem = new ArrayList<>();
        String query = "select * from carts where user_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1,user_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                cartItem.add(new Cart(
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
        return cartItem;
    }

    public static void main(String[] args) {
        BillDAO test = new BillDAO();
        System.out.println(test.getBillByCartID(4));
    }

}
