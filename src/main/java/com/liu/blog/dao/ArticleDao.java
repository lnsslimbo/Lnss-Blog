package com.liu.blog.dao;

import com.liu.blog.entity.Article;
import com.liu.blog.common.DbObject;
import com.liu.blog.entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ArticleDao {

    public Article addArticle(Article article) {
        Connection cn = DbObject.getConnection();
        PreparedStatement st = null;

        try {
            String sql = "insert into article(articleName,userName,articleTypeName,articleContent,PublishDate,ModDate)" +
                    " values(?,?,?,?,?,?)";
            st = cn.prepareStatement(sql);

            st.setString(1, article.getArticleName());
            st.setString(2, article.getUserName());
            st.setString(3, article.getArticleTypeName());
            st.setString(4, article.getArticleContent());
            st.setString(5, article.getPublishDate());
            st.setString(6, article.getModDate());


            int ret = st.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            //5.关闭数据库连接
            DbObject.close(cn, st, null);
        }
        return article;
    }

    public List<Article> findAll() {
        ArrayList<Article> articleList = new ArrayList<>();

        Connection cn = DbObject.getConnection();
        PreparedStatement st = null;
        ResultSet rs = null;
        if (cn == null)
            return null;

        try {
            //4.执行sql
            String sql = "select * from article";
            st = cn.prepareStatement(sql);

            rs = st.executeQuery();
            while (rs.next()) {
                User user = new User();
                Article article = new Article();
                article.setArticleName(rs.getString("articleName"));
                article.setArticleTypeName(rs.getString("articleTypeName"));
                article.setArticleContent(rs.getString("articleContent"));
                article.setUserName(rs.getString("userName"));

                articleList.add(article);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            //5.关闭数据库连接
            DbObject.close(cn, st, rs);
        }

        return articleList;
    }

}
