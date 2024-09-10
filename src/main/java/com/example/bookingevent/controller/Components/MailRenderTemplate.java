package com.example.bookingevent.controller.Components;

import com.example.bookingevent.database.DB;
import com.example.bookingevent.database.MyObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.ResourceBundle;

public class MailRenderTemplate {
    @WebServlet("/user/render-mail")
    public static class ParseItemToTemplate extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            ResourceBundle language = (ResourceBundle) req.getAttribute("language");
            String bill_id = req.getParameter("bill_id");
            String user_id = (String) req.getSession().getAttribute("login");
            String sql = "\n" +
                    "select  carts.user_id, quantity, bill_id,LEFT(events.image, CHARINDEX(',', events.image + ',') - 1) AS first_image, events.price as price, events.title as event_title, sum(quantity * events.price) as amount\n" +
                    "                                        from carts\n" +
                    "                                                 inner join bills on carts.bill_id = bills.id\n" +
                    "                                                 inner join events on carts.event_id = events.id\n" +
                    "                                        where bills.status = 'true'\n" +
                    "                                          and bills.id = ?\n" +
                    "                                          and carts.user_id = ?\n" +
                    "                                        group by  carts.user_id,  quantity, bill_id, events.image, events.price, events.title";
            ArrayList<MyObject> items = DB.getData(sql, new String[]{bill_id,user_id}, new String[]{ "user_id", "quantity", "bill_id", "first_image", "price", "event_title", "amount"});
            int amount = 0;
            for (MyObject item : items) {
                amount = Integer.parseInt(item.getAmount());
            }
            if (items.size() ==0){
                req.getSession().setAttribute("mess", "warning|" + language.getString("bill_empty"));
                resp.sendRedirect(req.getContextPath() + "/homepage");
            }else {
                req.setAttribute("items", items);
                req.setAttribute("amount", amount);
                req.getRequestDispatcher("/views/mail-template.jsp").forward(req, resp);
            }
        }
    }
}
