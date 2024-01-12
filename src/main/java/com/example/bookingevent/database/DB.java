package com.example.bookingevent.database;

import com.example.bookingevent.Init.Config;

import java.lang.reflect.Field;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class DB {
    public static Connection getConnection() {
        try {
            Class.forName(Config.db_class_name);
            String serverName = Config.db_server;
            String port = Config.db_port;
            String databaseName = Config.db_name;
            String username = Config.db_username;
            String password = Config.db_password;
            String url = "jdbc:sqlserver://" + serverName + ":" + port + ";databaseName=" + databaseName + ";trustServerCertificate=true;";
            return DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static boolean executeUpdate(String sql) {// insert update delete
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            int row = preparedStatement.executeUpdate();
            connection.close();
            return row > 0;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static boolean executeUpdate(String sql, String[] fields) {// insert update delete
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            for (int i = 0; i < fields.length; i++) {
                preparedStatement.setString(i + 1, fields[i]);
            }
            int row = preparedStatement.executeUpdate();
            connection.close();
            return row > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static ArrayList<MyObject> getData(String sql, String[] fields) {
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            ArrayList<MyObject> result = new ArrayList<>();
            List<MyObject> re ;
            while (resultSet.next()) {
                MyObject myObject = new MyObject();
                for (int i = 0; i < fields.length; i++) {
                    Field field = MyObject.class.getDeclaredField(fields[i]);
                    field.setAccessible(true);
                    field.set(myObject, resultSet.getString(fields[i]));
                }
                result.add(myObject);
            }
            connection.close();
            return result;
        } catch (SQLException | NoSuchFieldException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }
    }

    public static ArrayList<MyObject> getData(String sql, String[] vars, String[] fields) {
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            for (int i = 0; i < vars.length; i++) {
                preparedStatement.setString(i + 1, vars[i]);
            }
            ResultSet resultSet = preparedStatement.executeQuery();
            ArrayList<MyObject> result = new ArrayList<>();
            while (resultSet.next()) {
                MyObject myObject = new MyObject();
                for (int i = 0; i < fields.length; i++) {
                    Field field = MyObject.class.getDeclaredField(fields[i]);
                    field.setAccessible(true);
                    field.set(myObject, resultSet.getString(fields[i]));
                }
                result.add(myObject);
            }
            connection.close();
            return result;
        } catch (SQLException | NoSuchFieldException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }
    }

    public static int insertGetLastId(String sql, String[] fields){
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            for (int i = 0; i < fields.length; i++) {
                preparedStatement.setString(i + 1, fields[i]);
            }
            preparedStatement.executeUpdate();
            ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
            if (generatedKeys.next()){
                return (int) generatedKeys.getLong(1);
            } else {
                return 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public static MyObject getUser(String id){
        if (id == null){
            return null;
        }
        if (id.equals("")){
            return null;
        }
        ArrayList<MyObject> users = DB.getData("select * from users where id = ?", new String[]{id}, new String[]{"id", "name", "email", "phone", "password", "avatar", "gender", "token", "is_verified", "role_id"});
        return users.size() == 0 ? null : users.get(0);
    }
    public static List<List<Integer>> combine(int n, int k) {
        List<List<Integer>> result = new ArrayList<>();

        // Initialize the combination array with the first combination
        List<Integer> combination = new ArrayList<>();
        for (int i = 1; i <= k; i++) {
            combination.add(i);
        }

        while (combination.get(0) <= n - k + 1) {
            // Add a copy of the current combination to the result
            result.add(new ArrayList<>(combination));

            // Find the rightmost element that can be incremented
            int index = k - 1;
            while (index >= 0 && combination.get(index) == n - (k - index) + 1) {
                index--;
            }

            // Increment the rightmost element
            combination.set(index, combination.get(index) + 1);

            // Adjust the elements to the right of the incremented element
            for (int i = index + 1; i < k; i++) {
                combination.set(i, combination.get(i - 1) + 1);
            }
        }

        return result;
    }
    public static void main(String[] args) throws Exception{
        int n = 4;
        int k = 2;

        List<List<Integer>> combinations = combine(n, k);

        for (List<Integer> combination : combinations) {
            System.out.println(combination);
        }

    }
    // result  =2
}
