package com.company.resume.controller;

import com.company.dao.inter.UserDaoInter;
import com.company.entity.User;
import com.company.main.Context;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author UlviAshraf
 */
@WebServlet(name = "UserController", urlPatterns = {"/users"})
public class UserController extends HttpServlet {

    UserDaoInter dao = Context.instanceUserDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        Integer nId = null;
        String nIdStr = request.getParameter("nId");
        if (nIdStr != null && !nIdStr.trim().isEmpty()) {
            nId = Integer.parseInt(nIdStr);
        }
        UserDaoInter dao = Context.instanceUserDao();
        List<User> list = dao.getAllUser(name, surname, nId);
        request.setAttribute("users", list);
        request.getRequestDispatcher("users.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}