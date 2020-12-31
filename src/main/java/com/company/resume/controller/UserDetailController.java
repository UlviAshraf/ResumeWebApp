package com.company.resume.controller;

import com.company.dao.inter.UserDaoInter;
import com.company.entity.User;
import com.company.main.Context;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author UlviAshraf
 */
@WebServlet(name = "UserDetailController", urlPatterns = {"/userdetail"})
public class UserDetailController extends HttpServlet {

    UserDaoInter dao = Context.instanceUserDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String userIdStr = request.getParameter("id");
            if (userIdStr == null || userIdStr.trim().isEmpty()) {
                throw new IllegalArgumentException("id is not specified");
            }
            Integer userId = Integer.parseInt(userIdStr);
            UserDaoInter dao = Context.instanceUserDao();
            User u = dao.getById(userId);
            if (u == null) {
                throw new IllegalArgumentException("there is not user with this id");
            }
            request.setAttribute("user", u);
            request.getRequestDispatcher("userdetail.jsp").forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendRedirect("error.jsp?msg=" + ex.getMessage());
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        int id = Integer.parseInt(request.getParameter("id"));
        if (action.equals("update")) {
            Date dateU = null;
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            String name = request.getParameter("name");
            String surname = request.getParameter("surname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String birthdateStr = request.getParameter("birthdate");
            try {
                dateU = sdf.parse(birthdateStr);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            long l = dateU.getTime();
            java.sql.Date date = new java.sql.Date(l);
            User user = dao.getById(id);
            user.setName(name);
            user.setSurname(surname);
            user.setPhone(phone);
            user.setEmail(email);
            user.setAddress(address);
            user.setBirthDate(date);
            dao.update(user);
        } else if (action.equals("delete")) {
            dao.remove(id);
        }
        response.sendRedirect("users");
    }
}

