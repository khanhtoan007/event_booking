package com.example.bookingevent.daos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.example.bookingevent.database.DBContext;
import com.example.bookingevent.models.Account;

public class ManageAccountDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;


    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        String query = "select * from Account";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }
}
