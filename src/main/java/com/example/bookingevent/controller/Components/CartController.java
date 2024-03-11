package com.example.bookingevent.controller.Components;

import com.example.bookingevent.Init.EmailReader;
import com.example.bookingevent.daos.BillDAO;
import com.example.bookingevent.database.DB;
import com.example.bookingevent.database.MyObject;
import com.example.bookingevent.models.Bills;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.ResourceBundle;
import java.util.UUID;

public class CartController {
    @WebServlet("/user/add_to_cart")
    public static class EventByCategory extends HttpServlet {
        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            System.out.println("vao do post");
            ResourceBundle language = (ResourceBundle) req.getAttribute("language");
            String user_id = (String) req.getSession().getAttribute("login");
            String event_id = req.getParameter("event_id");
            String quantity = req.getParameter("quantity");
            System.out.println(user_id);
            System.out.println(event_id);
            System.out.println(quantity);
            String sql = "insert into carts(user_id, event_id, quantity) values (?, ?, ?)";
            String[] vars = new String[]{user_id, event_id, quantity};
            boolean check = DB.executeUpdate(sql, vars);
            if (check){
                req.getSession().setAttribute("mess", "success|" + language.getString("add_to_cart_success"));
            } else {
                req.getSession().setAttribute("mess", "error|" + language.getString("add_to_cart_fail"));
            }
            System.out.println("cb redirect");
            resp.sendRedirect(req.getContextPath() + "/event-detail?event_id=" + event_id);
        }

        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            System.out.println("vao do get");
        }
    }
    @WebServlet("/user/viewCart")
    public static class ViewCartServlet extends HttpServlet {
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            String sql = "select carts.*, events.price as price, events.title as event_title from carts inner join events on carts.event_id = events.id where carts.user_id = ?";
            String user_id = (String) request.getSession().getAttribute("login");
            ArrayList<MyObject> carts = DB.getData(sql, new String[]{user_id}, new String[]{"id", "user_id", "event_id", "quantity", "note", "price", "event_title"});
            request.setAttribute("carts" , carts);
            request.getRequestDispatcher("/views/cart.jsp").forward(request, response);

        }
    }
    @WebServlet("/user/get-items-cart")
    public static class GetItemsCart extends HttpServlet{
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String sql = "select carts.id, carts.user_id, event_id, quantity, bill_id, note, events.price as price, events.title as event_title, events.tickets as tickets from carts inner join events on carts.event_id = events.id left join bills on carts.bill_id = bills.id where carts.user_id = ? and bill_id IS NULL";
            String user_id = (String) req.getSession().getAttribute("login");
            ArrayList<MyObject> carts = DB.getData(sql, new String[]{user_id}, new String[]{"id", "user_id", "event_id", "quantity", "note", "price", "event_title", "tickets"});
            com.google.gson.JsonObject job = new JsonObject();
            ObjectMapper objectMapper = new ObjectMapper();
            objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
            objectMapper.setSerializationInclusion(JsonInclude.Include.NON_EMPTY);
            String carts_json_string = objectMapper.writeValueAsString(carts);
            job.addProperty("carts", carts_json_string);
            Gson gson = new Gson();
            resp.getWriter().write(gson.toJson(job));
        }
    }
    @WebServlet("/user/change-cart-quantity")
    public static class ChangeCartQuantity extends HttpServlet{
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            ResourceBundle language = (ResourceBundle) req.getAttribute("language");
            String cart_id = req.getParameter("cart_id");
            String user_id = (String) req.getSession().getAttribute("login");
            String status = req.getParameter("status");
            String sql = "SELECT 'quantity' AS info_type, quantity AS info_value\n" +
                    "FROM carts\n" +
                    "WHERE id = ?\n" +
                    "\n" +
                    "UNION\n" +
                    "\n" +
                    "SELECT 'tickets' AS info_type, tickets AS info_value\n" +
                    "FROM events\n" +
                    "WHERE id = (SELECT event_id FROM carts WHERE carts.id = ?)\n" +
                    "\n" +
                    "UNION\n" +
                    "\n" +
                    "SELECT 'bought' AS info_type, SUM(IIF(bill_id IS NULL, 0, quantity)) AS info_value\n" +
                    "FROM carts\n" +
                    "WHERE bill_id IS NOT NULL AND event_id = (select event_id from carts where carts.id = ?)";
            ArrayList<MyObject> result = DB.getData(sql, new String[]{cart_id, cart_id, cart_id} ,new String[]{"info_type", "info_value"});
            boolean check = false;
            String message = language.getString("something_wrong");
            if (result.size() == 3){
                int quantity = 0;
                int bought = 0;
                int tickets = 0;
                for (int i = 0; i < result.size(); i++) {
                    if (result.get(i).info_type.equals("quantity")){
                        quantity = Integer.parseInt(result.get(i).info_value);
                    }
                    if (result.get(i).info_type.equals("tickets")){
                        tickets = Integer.parseInt(result.get(i).info_value);
                    }
                    if (result.get(i).info_type.equals("bought")){
                        bought = result.get(i).info_value == null ? 0 : Integer.parseInt(result.get(i).info_value);
                    }
                }
                if (status.equals("minus")){
                    if (quantity == 1){
                        message = language.getString("quantity_cant_lower_than_1");
                    } else {
                        sql = "update carts set quantity = quantity - 1 where id = ? and user_id = ?";
                        check = DB.executeUpdate(sql, new String[]{cart_id, user_id});
                    }

                }
                if (status.equals("plus")){
                    if (quantity + 1 + bought > tickets) {
                        message = language.getString("out_of_stock");
                    } else {
                        sql = "update carts set quantity = quantity + 1 where id = ? and user_id = ?";
                        check = DB.executeUpdate(sql, new String[]{cart_id, user_id});
                    }

                }
            }
            com.google.gson.JsonObject job = new JsonObject();
            job.addProperty("status", check);
            job.addProperty("message", message);
            Gson gson = new Gson();
            resp.getWriter().write(gson.toJson(job));
        }
    }
    @WebServlet("/user/delete-cart")
    public static class DeleteCart extends HttpServlet{
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String id = req.getParameter("id");
            String sql = "delete from carts where id = ?";
            boolean check = DB.executeUpdate(sql, new String[]{id});
            com.google.gson.JsonObject job = new JsonObject();
            job.addProperty("status", check);
            Gson gson = new Gson();
            resp.getWriter().write(gson.toJson(job));
        }
    }

    @WebServlet("/user/checkout")
    public static class Checkout extends HttpServlet{
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String cart_ids = req.getParameter("cart_ids");
            String[] ids = cart_ids.split(",");
            String uuid = UUID.randomUUID().toString();
            LocalDateTime currentTime = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String formattedTime = currentTime.format(formatter);
            String sql = "insert into bills(transfer_content, status, created_at) VALUES (?, 'false', ?)";
            int id = DB.insertGetLastId(sql, new String[]{uuid, formattedTime});
            if (id > 0){
                sql = "";
                String[] vars = new String[]{};
                for (int i = 0; i < ids.length; i++) {
                    sql += "update carts set bill_id = " + id +" where id = ?;";
                }
                boolean check = DB.executeUpdate(sql, ids);
                if (check){
                    resp.sendRedirect(req.getContextPath() + "/user/payment?bill_id=" + id);
                } else {
                    resp.sendRedirect(req.getContextPath() + "/user/viewCart");
                }
            } else {
                resp.sendRedirect(req.getContextPath() + "/user/viewCart");
            }
        }
    }

//    @WebServlet("/user/payment")
//    public static class Payment extends HttpServlet{
//        @Override
//        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//            String bill_id = req.getParameter("bill_id");
//            String user_id = (String) req.getSession().getAttribute("login");
//            ResourceBundle language = (ResourceBundle) req.getAttribute("language");
//            ArrayList<MyObject> carts = DB.getData("select carts.id, carts.user_id, event_id, quantity, bill_id, note,events.image, events.price as price, events.title as event_title, events.tickets as tickets, transfer_content, sum(quantity * events.price) as amount\n" +
//                    "from carts\n" +
//                    "         inner join bills on carts.bill_id = bills.id\n" +
//                    "         inner join events on carts.event_id = events.id\n" +
//                    "where bills.status = 'false'\n" +
//                    "  and bills.id = ?\n" +
//                    "  and carts.user_id = ?\n" +
//                    "group by carts.id, carts.user_id, event_id, quantity, bill_id, note, events.image, events.price, events.title, events.tickets, transfer_content", new String[]{bill_id, user_id}, new String[]{"id", "user_id", "event_id", "quantity", "note","image", "price", "event_title", "tickets", "amount", "transfer_content"});
//
//            if (carts.size() == 0){
//                req.getSession().setAttribute("mess", "warning|" + language.getString("bill_not_exist"));
//                resp.sendRedirect(req.getContextPath() + "/user/viewCart");
//            } else {
//                String events_ids = "(";
//                for (int i = 0; i < carts.size(); i++) {
//                    events_ids += "'" + carts.get(i).event_id + "', ";
//                }
//                events_ids += ")";
//                events_ids = EmailReader.replaceLast(events_ids, ",", "");
//                String sql = "select events.*, categories.name as category_name, users.name as username, count(carts.id) as interested, sum(iif(bills.status = 'true', carts.quantity, 0)) as count\n" +
//                        "from events\n" +
//                        "         inner join categories on events.category_id = categories.id\n" +
//                        "         inner join users on events.user_id = users.id\n" +
//                        "         left join carts on events.id = carts.event_id\n" +
//                        "         left join bills on carts.bill_id = bills.id\n" +
//                        "where events.is_verified = 'true' and events.id in x\n" +
//                        "group by users.name, categories.name, events.id, title, description, start_date, end_date, location, events.is_verified,\n" +
//                        "         events.user_id, category_id, tickets, events.price, image";
//                String[] fields = new String[]{"id", "title", "description", "start_date", "end_date", "location", "is_verified", "user_id", "category_id", "tickets", "price", "image", "category_name", "username", "interested", "count"};
//                ArrayList<MyObject> events = DB.getData(sql.replace("x", events_ids), fields);
//                int amount = 0;
//                boolean change = false;
//                sql = "";
//                String if_change = "";
//                for (int i = 0; i < carts.size(); i++) {
//                    for (int j = 0; j < events.size(); j++) {
//                        int quantity = Integer.parseInt(carts.get(i).quantity);
//                        int tickets = Integer.parseInt(carts.get(i).tickets);
//                        int bought = Integer.parseInt(events.get(j).count);
//                        if (carts.get(i).event_id.equals(events.get(j).id) && quantity + bought > tickets){
//                            change = true;
//                            if_change += language.getString("quantity_changed").replace("xx", events.get(j).title).replace("yy", carts.get(i).quantity).replace("zz", String.valueOf(tickets - bought)) + "\n";
//                            carts.get(i).quantity = String.valueOf(tickets - bought);
//                            sql = "update carts set quantity = " + carts.get(i).quantity +" where id = " + carts.get(i).id + ";";
//                            System.out.println(quantity + tickets + amount + "check");
//                            amount += Integer.parseInt(carts.get(i).quantity) * Integer.parseInt(events.get(j).price);
//                        }
//                    }
//                }
//
//                if (change){
//                    DB.executeUpdate(sql);
//                }
//                req.setAttribute("amount", amount);
//
//                DB.executeUpdate("update bills set amount = ? where id = ?", new String[]{String.valueOf(amount), bill_id});
//                req.setAttribute("transfer_content", carts.get(0).transfer_content);
//
//                req.setAttribute("carts", carts);
//                req.setAttribute("change", change);
//                req.setAttribute("if_change", if_change);
//                req.getRequestDispatcher("/views/payment.jsp").forward(req, resp);
//            }
//        }
//    }

    @WebServlet("/user/payment")
    public static class Payment extends HttpServlet{
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String bill_id = req.getParameter("bill_id");
            String user_id = (String) req.getSession().getAttribute("login");
            ResourceBundle language = (ResourceBundle) req.getAttribute("language");
            ArrayList<MyObject> carts = DB.getData("select carts.id, carts.user_id, event_id, quantity, bill_id,events.image, events.price as price, events.title as event_title, events.tickets as tickets, transfer_content, sum(quantity * events.price) as amount\n" +
                    "from carts\n" +
                    "         inner join bills on carts.bill_id = bills.id\n" +
                    "         inner join events on carts.event_id = events.id\n" +
                    "where bills.status = 'false'\n" +
                    "  and bills.id = ?\n" +
                    "  and carts.user_id = ?\n" +
                    "group by carts.id, carts.user_id, event_id, quantity, bill_id, events.image, events.price, events.title, events.tickets, transfer_content", new String[]{bill_id, user_id}, new String[]{"id", "user_id", "event_id", "quantity","image", "price", "event_title", "tickets", "amount", "transfer_content"});

            if (carts.size() == 0){
                req.getSession().setAttribute("mess", "warning|" + language.getString("bill_not_exist"));
                resp.sendRedirect(req.getContextPath() + "/user/viewCart");
            } else {
                String events_ids = "(";
                for (int i = 0; i < carts.size(); i++) {
                    events_ids += "'" + carts.get(i).event_id + "', ";
                }
                events_ids += ")";
                events_ids = EmailReader.replaceLast(events_ids, ",", "");
                String sql = "select events.*, categories.name as category_name, users.name as username, count(carts.id) as interested, sum(iif(bills.status = 'true', carts.quantity, 0)) as count\n" +
                        "from events\n" +
                        "         inner join categories on events.category_id = categories.id\n" +
                        "         inner join users on events.user_id = users.id\n" +
                        "         left join carts on events.id = carts.event_id\n" +
                        "         left join bills on carts.bill_id = bills.id\n" +
                        "where events.is_verified = 'true' and events.id in x\n" +
                        "group by users.name, categories.name, events.id, title, description, start_date, end_date, location, events.is_verified,\n" +
                        "         events.user_id, category_id, tickets, events.price, image";
                String[] fields = new String[]{"id", "title", "description", "start_date", "end_date", "location", "is_verified", "user_id", "category_id", "tickets", "price", "image", "category_name", "username", "interested", "count"};
                ArrayList<MyObject> events = DB.getData(sql.replace("x", events_ids), fields);
                int amount = 0;
                boolean change = false;
                sql = "";
                String if_change = "";
                for (int i = 0; i < carts.size(); i++) {
                    for (int j = 0; j < events.size(); j++) {
                        int quantity = Integer.parseInt(carts.get(i).quantity);
                        int tickets = Integer.parseInt(carts.get(i).tickets);
                        int bought = Integer.parseInt(events.get(j).count);
                        if (carts.get(i).event_id.equals(events.get(j).id) && quantity + bought > tickets){
                            change = true;
                            if_change += language.getString("quantity_changed").replace("xx", events.get(j).title).replace("yy", carts.get(i).quantity).replace("zz", String.valueOf(tickets - bought)) + "\n";
                            carts.get(i).quantity = String.valueOf(tickets - bought);
                            carts.get(i).amount = String.valueOf(Integer.parseInt(carts.get(i).quantity) * Integer.parseInt(events.get(j).price));
                            sql = "update carts set quantity = " + carts.get(i).quantity +" where id = " + carts.get(i).id + ";";
                        }
                        if (carts.get(i).event_id.equals(events.get(j).id)){
                            amount += Integer.parseInt(carts.get(i).quantity) * Integer.parseInt(events.get(j).price);
                        }
                    }
                }
                if (change){
                    DB.executeUpdate(sql);
                }
                req.setAttribute("amount", amount);
                DB.executeUpdate("update bills set amount = ? where id = ?", new String[]{String.valueOf(amount), bill_id});
                req.setAttribute("transfer_content", carts.get(0).transfer_content);
                req.setAttribute("carts", carts);
                req.setAttribute("change", change);
                req.setAttribute("if_change", if_change);
                req.getRequestDispatcher("/views/payment.jsp").forward(req, resp);
            }
        }
    }
}
