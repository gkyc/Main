package com.yc.servlet;

import com.google.gson.Gson;
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

/**
 * 从项目数据库读取高校列表
 */
@WebServlet("/selectSh")
public class SelectSh extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response ) throws IOException {

        doPost(request, response);
    }

    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws IOException {

        String location = request.getParameter("loc");

        String sql = "select sch_name from school where sch_province = '" + location + "' order by sch_proranking";
        Connection connection = null;
        List<String> schList = new ArrayList<>();
        try {
            connection = JdbcConnector.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
                String schoolName = resultSet.getString(1);
                schList.add(schoolName);
            }
            System.out.println(schList);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // 将schList转为json格式，发送到前端页面
        Gson gson = new Gson();
        String schJson = gson.toJson(schList);

        response.setContentType("text/html; charset=utf-8");
        response.getWriter().write(schJson);
    }
}
