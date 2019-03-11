package com.yc.servlet;

import com.google.gson.Gson;
import com.yc.domain.Score;
import com.yc.utils.JdbcConnector;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/showdata")
public class ShowDataServlet extends HttpServlet {

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws IOException {
        doPost(request,response);

    }

    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws IOException {
        request.setCharacterEncoding("utf-8");
        String university = request.getParameter("university");
        String province = request.getParameter("province");
        String subject = request.getParameter("subject");
        province = province.substring(0,2);

        System.out.println(university+" "+province+" "+subject);

        /* 测试 */
        List<Score>  list = new ArrayList<>();
        Connection connection = null;
        try{
            connection = JdbcConnector.getConnection();
            String sql = "select year,mark from mark where school='" + university + "' and " +
                    "subject='" + subject + "' and province like '" + province + "%'";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Score score = new Score(resultSet.getInt(1),resultSet.getInt(2));
                list.add(score);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        Gson gson = new Gson();
        String data = gson.toJson(list);
        System.out.println("showdata servlet");
        response.setContentType("text/html; charset=utf-8");
        response.getWriter().write(data);

    }
}
