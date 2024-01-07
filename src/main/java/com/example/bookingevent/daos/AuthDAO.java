package com.example.bookingevent.daos;

import com.example.bookingevent.database.DBContext;
import com.example.bookingevent.models.Account;
import com.example.bookingevent.models.User;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AuthDAO {
    Connection con = null;
    PreparedStatement stm = null;
    ResultSet rs = null;

    public Account login(String username)
    {
        String sql = "select * from [Account] where username = ?";
        try
        {
            con = new DBContext().getConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1, username);
            rs = stm.executeQuery();
            while (rs.next())
            {
                System.out.println("found");
                return (Account) new Account(rs.getInt(1),
                                            rs.getString(2),
                                            rs.getString(3),
                                            rs.getString(4),
                                            rs.getString(5),
                                            rs.getString(6),
                                            rs.getString(7));
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("not found");
        return null;
    }

    public boolean register(String username, String password, String name,
                                      String phone, String email, String role)
    {
        try {
            String sql = "insert into [Account] values(?, ?, ?, ?, ?, ?)";
            con = new DBContext().getConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            stm.setString(3, name);
            stm.setString(4, phone);
            stm.setString(5, email);
            stm.setString(6, role);
            int row = stm.executeUpdate();
            if (row > 0) {
                System.out.println("add user ok");
                return true;
            }
        } catch (SQLException e) {
            System.out.println("SQL error in DAO " + e.getMessage());
        } catch (Exception e) {
            System.out.println("SQL error in DAO " + e.getMessage());
        }
        System.out.println("add user not ok");
        return false;
    }





}
