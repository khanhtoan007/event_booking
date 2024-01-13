package com.example.bookingevent.controller.Components;

import com.example.bookingevent.daos.EventDAO;
import com.example.bookingevent.models.Cart;
import com.example.bookingevent.models.EventPost;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

public class CartController {
    @WebServlet("/add_to_cart")
    public static class EventByCategory extends HttpServlet {
        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            int event_id  = Integer.parseInt(req.getParameter("event_id"));
            EventPost event = new EventDAO().getEventPostByID(event_id);
            HttpSession session = req.getSession();
            int user_id = (int) session.getAttribute("login");
            int quantity = Integer.parseInt(req.getParameter("quantity"));
            int price = Integer.parseInt(req.getParameter("price"));
            String note = req.getParameter("note");
            EventDAO eventDAO = new EventDAO();
            System.out.println(eventDAO.addItemToCart(user_id,event_id,quantity,price,note));
            resp.sendRedirect(req.getContextPath() + "/event-detail");
        }
    }
    @WebServlet("/viewCart")
    public static class ViewCartServlet extends HttpServlet {
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            HttpSession session = request.getSession();
            int user_id = (int) session.getAttribute("login");
            List<Cart> list = new EventDAO().viewCart(user_id);
            request.setAttribute("cartItem",list);
            request.getRequestDispatcher("/views/cart.jsp").forward(request, response);
        }
    }
}
