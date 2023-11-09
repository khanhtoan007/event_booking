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
        String query = "select * from [User]";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
        ManageAccountDAO dao = new ManageAccountDAO();
        List<Account> test = dao.getAllAccount();
        System.out.println(test);
    }
}
