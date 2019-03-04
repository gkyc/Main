package com.yc.service;

import com.google.gson.Gson;
import com.yc.domain.University;
import com.yc.utils.JdbcConnector;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet("/select_sh")
public class SelectUniversity extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response ) throws IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response ) throws IOException {

        String location = "高校所在地：" + request.getParameter("loc");
        String leixing = "高校类型：" + request.getParameter("cate");
        String tese = request.getParameter("feat");
        String xingzhi ="高校性质：" + request.getParameter("edu");
        if(tese.equals("全部")){
            tese = "高校特色：全部";
        }else if( tese.equals("211高校")) {
            tese = " 211";
        }else {
            tese = " 211 985";
        }

        String sql = "select * from universities where school_location = '" + location +
                "' and school_leixing = '" + leixing + "' and school_tese = '" + tese +
                "' and school_xingzhi = '" + xingzhi + "' order by school_rank;";
        System.out.println("sql0:" + sql);

        // 利用正则表达式修改选择“全部”的条件项
        String s1 = "school_location\\s+=\\s+'高校所在地：全部'";
        String s2 = "school_leixing\\s+=\\s+'高校类型：全部'";
        String s3 = "school_tese\\s+=\\s+'高校特色：全部'";
        String s4 = "school_xingzhi\\s+=\\s+'高校性质：全部'";
        String replace = "1 = 1";
        Pattern pattern1 = Pattern.compile(s1);
        Pattern pattern2 = Pattern.compile(s2);
        Pattern pattern3 = Pattern.compile(s3);
        Pattern pattern4 = Pattern.compile(s4);
        // get matcher object
        Matcher matcher1 = pattern1.matcher(sql);
        sql = matcher1.replaceAll(replace);

        Matcher matcher2 = pattern2.matcher(sql);
        sql = matcher2.replaceAll(replace);

        Matcher matcher3 = pattern3.matcher(sql);
        sql = matcher3.replaceAll(replace);

        Matcher matcher4 = pattern4.matcher(sql);
        sql = matcher4.replaceAll(replace);
        System.out.println("sql1:" + sql);

        // 查询数据，返回json数据发送到前端
        List<Map<String,String>> list = new ArrayList<>();
        Connection connection = null;
        try {
            connection = JdbcConnector.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
            int colnumNum = resultSetMetaData.getColumnCount();     // 查询结果的列数
            while (resultSet.next()) {
                Map<String, String> map = new HashMap<>();
                for( int i = 1; i <= colnumNum; i++ ) {
                    // 根据列索引取得每一列的列名
                    String colnumName = resultSetMetaData.getColumnName(i);
                    // 根据列名取得列值
                    String value = String.valueOf(resultSet.getObject(colnumName));
                    // 列名为key,列值为value,存入map
                    map.put(colnumName,value);
                }
                list.add(map);
            }
            System.out.println("list");
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

//        System.out.println("list" + list);
        Gson gson = new Gson();
        String univerList = gson.toJson(list);

        System.out.println(univerList);

        response.setContentType("text/html; charset=utf-8");
        response.getWriter().write(univerList);
    }
}
