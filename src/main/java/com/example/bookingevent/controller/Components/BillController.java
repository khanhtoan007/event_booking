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
public class BillController {
    @WebServlet("/user/bills")
    public static class CheckBills extends HttpServlet{
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            ResourceBundle language = (ResourceBundle) req.getAttribute("language");
            String user_id = (String) req.getSession().getAttribute("login");
            String sql = "select carts.id, carts.user_id, event_id, quantity, bill_id, events.price as price, events.title as event_title, transfer_content, sum(quantity * events.price) as amount, bills.status\n" +
                    "                   from carts\n" +
                    "                            inner join bills on carts.bill_id = bills.id\n" +
                    "                            inner join events on carts.event_id = events.id\n" +
                    "                     and carts.user_id = ?\n" +
                    "                   where status = 'false'\n" +
                    "                   group by carts.id, carts.user_id, event_id, quantity, bill_id, events.price, events.title, transfer_content, bills.status";
            ArrayList<MyObject> bills = DB.getData(sql, new String[]{user_id}, new String[]{"id", "user_id", "event_id", "quantity","bill_id", "price", "event_title", "amount", "transfer_content", "status"});
            if (bills.size() ==0){
                req.getSession().setAttribute("mess", "warning|" + language.getString("bill_empty"));
                resp.sendRedirect(req.getContextPath() + "/homepage");
            }else {
                req.setAttribute("bills", bills);
                req.getSession().setAttribute("mess","success|"+ language.getString("inform_bill"));
                req.getRequestDispatcher("/views/user/bills.jsp").forward(req, resp);
            }
        }
    }
}
