package com.example.bookingevent.database;

import com.example.bookingevent.Init.Config;

import java.lang.reflect.Field;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

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
        ArrayList<MyObject> users = DB.getData("select users.*, count(carts.id) as count from users join carts on users.id = carts.user_id where users.id = ? and bill_id is NULL group by users.id, name, email, phone, password, avatar, gender, token, is_verified, role_id", new String[]{id}, new String[]{"id", "name", "email", "phone", "password", "avatar", "gender", "token", "is_verified", "role_id", "count"});
        return users.size() == 0 ? null : users.get(0);
    }

    public static void main(String[] args) throws Exception{
//        String s = "Blue Tran Dinh Khanh Toan thân mến, Tài khoản Spend Account vừa tăng 10.000 VND vào 22/01/2024 13:36. Số dư hiện tại: 30.000 VND. Mô tả: MBVCB.5131494248.038489.abcdefgh.CT tu 9763416782 TRAN QUANG MINH toi 9021329646765 TRAN DINH KHANH TOAN tai BVBank Timo. Cảm ơn Quý khách đã sử dụng dịch vụ Ngân hàng số Timo! Để được hỗ trợ tốt hơn trong quá trình sử dụng, tham gia ngay: Group Facebook: Cộng đồng ngân hàng số Timo (Offical Group) Zalo Page            : Timo Trân trọng, Timo Team";
//        System.out.println(s.split("tăng ")[1].split(" VND")[0].replace(".", ""));
//        System.out.println(UUID.randomUUID().toString());
        String sql = "select events.*, categories.name as category_name, users.name as username, count(carts.id) as interested, sum(iif(bills.status = 'true', carts.quantity, 0)) as count\n" +
                "from events\n" +
                "         inner join categories on events.category_id = categories.id\n" +
                "         inner join users on events.user_id = users.id\n" +
                "         left join carts on events.id = carts.event_id\n" +
                "         left join bills on carts.bill_id = bills.id\n" +
                "where events.is_verified = 'true'\n" +
                "group by users.name, categories.name, events.id, title, description, start_date, end_date, location, events.is_verified,\n" +
                "         events.user_id, category_id, tickets, events.price, image";
        System.out.println(sql);
    }
}
