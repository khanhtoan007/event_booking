package com.example.bookingevent.database;


import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext {
     public Connection getConnection()throws Exception {
        String url = "jdbc:sqlserver://"+serverName+":"+portNumber + "\\" + instance +";databaseName="+dbName;
        if(instance == null || instance.trim().isEmpty())
            url = "jdbc:sqlserver://"+serverName+":"+portNumber +";databaseName="+dbName;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, userID, password);
    }
    /*Insert your other code right after this comment*/
    /*Change/update information of your database connection, DO NOT change name of instance variables in this class*/
    private final String serverName = "LAPTOP-99CNG1A4";
    private final String dbName = "EventBooking";
    private final String portNumber = "1433";
    private final String instance="";//LEAVE THIS ONE EMPTY IF YOUR SQL IS A SINGLE INSTANCE
    private final String userID = "sa";
    private final String password = "sa";
//    Test Connect DB
    public static void main(String[] args) {
        try {
            System.out.println(new DBContext().getConnection().getCatalog());
        } catch (Exception e) {
        }
    }
}
