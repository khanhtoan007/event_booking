package com.example.bookingevent.controller.Components;

import com.example.bookingevent.daos.BillDAO;
import com.example.bookingevent.database.DB;
import com.example.bookingevent.database.MyObject;
import com.example.bookingevent.models.Bills;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.ResourceBundle;

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
            String sql = "select carts.*, events.price as price, events.title as event_title from carts inner join events on carts.event_id = events.id where carts.user_id = ?";
            String user_id = (String) request.getSession().getAttribute("login");
            ArrayList<MyObject> carts = DB.getData(sql, new String[]{user_id}, new String[]{"id", "user_id", "event_id", "quantity", "note", "price", "event_title"});
            Bills bills = new BillDAO().getBillByCartID(4);
            request.setAttribute("bill", bills);
            request.setAttribute("carts" , carts);
            request.getRequestDispatcher("/views/cart.jsp").forward(request, response);
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
