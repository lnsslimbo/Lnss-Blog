package com.liu.blog.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.liu.blog.entity.Article;

import com.liu.blog.service.ArticleService;


@WebServlet("/manageArticleByUserNameAndArticleType")
public class ManageArticleByUserNameAndArticleType extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArticleService articleService = new ArticleService();
        String userName = request.getParameter("userName");
        String articleTypeName = request.getParameter("articleTypeName");


        List<Article> articleList = articleService.findByUserNameAndArticleTypeName(userName,articleTypeName);
        request.setAttribute("articleList", articleList);
        request.getRequestDispatcher("/manageArticle.jsp").forward(request, response);
    }

}