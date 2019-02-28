package com.yc.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcConnector {

    public static final String Driver  = "com.mysql.jdbc.Driver";
    public static final String url = "jdbc:mysql://localhost:3306/scores?characterEncoding=utf8";
    public static final String user = "root";
    public static final String password = "926400";

    static{
        try{
            Class.forName(Driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        Connection conn = DriverManager.getConnection(url, user, password);
        return conn;
    }

    public static void main(String[] args) throws SQLException {
        if( JdbcConnector.getConnection() != null ) {
            System.out.println("数据库访问成功~！");
        }
    }
}
