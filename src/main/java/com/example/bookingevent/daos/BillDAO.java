package com.example.bookingevent.daos;
import com.example.bookingevent.database.DBContext;
import com.example.bookingevent.models.Bills;
import com.example.bookingevent.models.Cart;
import com.example.bookingevent.models.Category;
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



    public Bills getBillByCartID(int cart_id) {
        Bills list = new Bills();
        String query = "select * from bills where cart_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1,cart_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                list = new Bills(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getBoolean(5),
                        rs.getString(6)
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
        BillDAO test = new BillDAO();
        System.out.println(test.getBillByCartID(4));
    }

}
