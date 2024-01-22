package com.example.bookingevent.controller.Components;

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
            ResourceBundle language = (ResourceBundle) req.getAttribute("language");
            String user_id = (String) req.getSession().getAttribute("login");
            String event_id = req.getParameter("event_id");
            String quantity = req.getParameter("quantity");
            String note = req.getParameter("note");
            String sql = "insert into carts(user_id, event_id, quantity, note) values (?, ?, ?, ?)";
            String[] vars = new String[]{user_id, event_id, quantity, note};
            boolean check = DB.executeUpdate(sql, vars);
            if (check){
                req.getSession().setAttribute("mess", "success|" + language.getString("add_to_cart_success"));
            } else {
                req.getSession().setAttribute("mess", "error|" + language.getString("add_to_cart_fail"));
            }
            resp.sendRedirect(req.getContextPath() + "/event-detail?event_id=" + event_id);
        }
    }
    @WebServlet("/user/viewCart")
    public static class ViewCartServlet extends HttpServlet {
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
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
                    resp.sendRedirect(req.getContextPath() + "/payment?bill_id=" + id);
                } else {
                    resp.sendRedirect(req.getContextPath() + "/user/viewCart");
                }
            } else {
                resp.sendRedirect(req.getContextPath() + "/user/viewCart");
            }
        }
    }

    @WebServlet("/payment")
    public static class Payment extends HttpServlet{
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String bill_id = req.getParameter("bill_id");
            ResourceBundle language = (ResourceBundle) req.getAttribute("language");
            ArrayList<MyObject> bills = DB.getData("select * from bills where id = ?", new String[]{bill_id}, new String[]{"amount", "transfer_content", "status", "paid_at"});
            if (bills.size() == 0){
                req.getSession().setAttribute("mess", "warning|" + language.getString("bill_not_exist"));
                resp.sendRedirect(req.getContextPath() + "/user/viewCart");
            } else {
                MyObject bill = bills.get(0);
                if (bill.status.equals("0")){
                    ArrayList<MyObject> carts = DB.getData("select carts.id, carts.user_id, event_id, quantity, bill_id, note, events.price as price, events.title as event_title, events.tickets as tickets, sum(quantity * events.price) as amount from carts inner join events on carts.event_id = events.id left join bills on carts.bill_id = bills.id where bill_id = ?\n" +
                            "group by carts.id, events.title, events.tickets, carts.user_id, event_id, quantity, bill_id, note, events.price", new String[]{bill_id}, new String[]{"id", "user_id", "event_id", "quantity", "note", "price", "event_title", "tickets", "amount"});
                    int amount = 0;
                    for (int i = 0; i < carts.size(); i++) {
                        amount += Integer.parseInt(carts.get(i).amount);
                    }
                    req.setAttribute("transfer_content", bill.transfer_content);
                    req.setAttribute("amount", amount);
                    req.setAttribute("carts", carts);
                    req.getRequestDispatcher("/views/payment.jsp").forward(req, resp);
                } else {
                    req.getSession().setAttribute("mess", "warning|" + language.getString("something_wrong"));
                    resp.sendRedirect(req.getContextPath() + "/user/viewCart");
                }
            }
        }
    }
}
