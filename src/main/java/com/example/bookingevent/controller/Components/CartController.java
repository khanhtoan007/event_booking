package com.example.bookingevent.controller.Components;

import com.example.bookingevent.daos.EventDAO;
import com.example.bookingevent.database.DB;
import com.example.bookingevent.database.MyObject;
import com.example.bookingevent.models.Cart;
import com.example.bookingevent.models.EventPost;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.ResourceBundle;

public class CartController {
    @WebServlet("/user/add_to_cart")
    public static class EventByCategory extends HttpServlet {
        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            /*ResourceBundle language = (ResourceBundle) req.getAttribute("language");
            // Set content type to JSON
            resp.setContentType("application/json");

            // Retrieve JSON data from the request body
            StringBuilder sb = new StringBuilder();
            try (BufferedReader reader = new BufferedReader(new InputStreamReader(req.getInputStream()))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    sb.append(line);
                }
            }

            // Parse JSON data
            ObjectMapper objectMapper = new ObjectMapper();
            Cart cartItem = objectMapper.readValue(sb.toString(), Cart.class);

            // Assuming CartItem class has appropriate fields and a constructor
            int event_id = cartItem.getId();
            EventPost event = new EventDAO().getEventPostByID(event_id);

            HttpSession session = req.getSession();
            int user_id = (int) session.getAttribute("login");
            int quantity = cartItem.getQuantity();
            int price = cartItem.getPrice();
            String note = cartItem.getNote();

            EventDAO eventDAO = new EventDAO();
            boolean check = eventDAO.addItemToCart(user_id, event_id, quantity, price, note);
            if (check){
                req.getSession().setAttribute("mess", "success|" + language.getString("add_to_cart_success"));
            }else{
                req.getSession().setAttribute("mess", "success|" + language.getString("reset_password_success"));
            }
            resp.sendRedirect(req.getContextPath() + "/event-detail");*/
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
            String sql = "select carts.*, events.price as price, events.title as event_title from carts inner join events on carts.event_id = events.id where carts.user_id = ?";
            String user_id = (String) request.getSession().getAttribute("login");
            ArrayList<MyObject> carts = DB.getData(sql, new String[]{user_id}, new String[]{"id", "user_id", "event_id", "quantity", "note", "price", "event_title"});

            request.setAttribute("carts" , carts);
            request.getRequestDispatcher("views/cart.jsp").forward(request, response);
        }
    }
    @WebServlet("/user/delete-cart")
    public static class DeleteCart extends HttpServlet{
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            ResourceBundle language = (ResourceBundle) req.getAttribute("language");
            String id = req.getParameter("id");
            String sql = "delete from carts where id = ?";
            boolean check = DB.executeUpdate(sql, new String[]{id});
            if (check){
                req.getSession().setAttribute("mess", "success|" + language.getString("delete_success"));
            } else {
                req.getSession().setAttribute("mess", "error|" + language.getString("delete_fail"));
            }
            resp.sendRedirect(req.getContextPath() + "/user/viewCart");
        }
    }
}
