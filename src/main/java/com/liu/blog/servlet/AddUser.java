package com.liu.blog.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.liu.blog.entity.User;
import com.liu.blog.service.UserService;

@WebServlet("/addUser")
public class AddUser extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userName = (String) request.getSession().getAttribute("UserName");
        UserService userService = new UserService();
        if (!userService.checkRole(userName)){
            response.sendRedirect("main");
            return;
        }
        request.getRequestDispatcher("/addUser.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //用户的信息至少包括，用户的登录名、密码、用户的姓名、性别、出生日期、手机、Email、微信号、描述信息、注册日期等。
        User user = new User();
        user.setUserName(request.getParameter("userName"));
        user.setPassword(request.getParameter("password"));
        user.setFullName(request.getParameter("fullName"));
        user.setGender(request.getParameter("gender"));
        user.setBirthday(request.getParameter("birthday"));
        user.setPhone(request.getParameter("phone"));
        user.setEmail(request.getParameter("email"));
        user.setEmail(request.getParameter("email"));
        user.setWeChatId(request.getParameter("weChatId"));
        user.setDescription(request.getParameter("description"));
        user.setRegistrationDate(request.getParameter("registrationDate"));
        user.setRole(request.getParameter("role"));
        user.setStatus(request.getParameter("status"));
        //2. 检查数据

        UserService service = new UserService();

        //2.1 检查用户名密码是否为空，两密码是否相等
        if (request.getParameter("userName").equals("")){
            request.setAttribute("errorMessage", "用户名不能为空！");
            request.getRequestDispatcher("/addUser.jsp").forward(request, response);
            return;
        }
        if (request.getParameter("password").equals("")){
            request.setAttribute("user", user);
            request.setAttribute("errorMessage", "密码不能为空！");
            request.getRequestDispatcher("/addUser.jsp").forward(request, response);
            return;
        }
        if (!request.getParameter("password").equals(request.getParameter("passwordAgain"))){
            request.setAttribute("user", user);
            request.setAttribute("errorMessage", "两次输入的密码不相同！");
            request.getRequestDispatcher("/addUser.jsp").forward(request, response);
            return;
        }

        //3.-1 检查用户是否存在
        if (service.exists(user.getUserName())){
            request.setAttribute("user", user);
            request.setAttribute("errorMessage", "用户名已经存在！");
            request.getRequestDispatcher("/addUser.jsp").forward(request, response);
            return;
        }

        //3. 新加用户
        user = service.addUser(user);
        response.sendRedirect("manageUsers");
    }

}
