package com.yc.utils;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class JDBCConnect {
    /* 定义数据库连接四大常量 */
    // mysql驱动包名
    private static final String Drive_Name = "com.mysql.jdbc.Driver";
    // 数据库连接地址
    private static final String URL = "jdbc:mysql://localhost:3306/scores?characterEncoding=UTF-8";
    // 用户名
    private static final String USER_NAME = "root";
    // 密码
    private static final String PASSWORD = "926400";

    /* 三剑客 ==。 */
    private static Connection connection = null;   // 连接对象
    private static PreparedStatement preparedStatement = null;     // 语句对象
    private static ResultSet resultSet = null;     // 结果集对象
    
    //加载JDBC驱动
  	static {
  		try {
  			Class.forName(Drive_Name);
  		} catch (ClassNotFoundException e) {
  			e.printStackTrace();
  		}
  	}

    /**
     * 获得连接对象
     * @return 连接对象
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        connection = DriverManager.getConnection( URL, USER_NAME, PASSWORD );
        return connection;
    }

    /**
     * 关闭三剑客
     * @return
     * @throws SQLException
     */
    public static void close() {
        try {
            if ( resultSet != null )
            {
                resultSet.close();
            }
            if ( preparedStatement != null )
            {
                preparedStatement.close();
            }
            if ( connection != null )
            {
                connection.close();
            }
        } catch ( SQLException e ) {
            e.printStackTrace();
        }
    }

    /**
     * 执行查询
     * @param sql
     *      传入预设的sql语句
     * @param params
     *      sql语句中的问号参数列表
     * @return  查询后的结果
     */
    public static List<Map<String, Object>> execQuery( String sql, Object[] params ) {
        List<Map<String, Object>> list = new ArrayList<>();
        try {
            getConnection();   // 获得连接对象
            preparedStatement = connection.prepareStatement( sql );   // 获得预设语句对象
            if ( params != null )
            {   // 设置参数列表
                for ( int i = 0; i < params.length; i++ )
                {   // 问号参数的索引是从1开始，将所有？参数值转为String
                    preparedStatement.setObject( i+1, params[i]+"");
                }
            }

            // 执行查询
            resultSet = preparedStatement.executeQuery();
            // 获得结果集元数据（元数据就是描述数据的数据，比如把表的列类型列名等作为数据）
            ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
            // 获得列的总数
            int columnCount = resultSetMetaData.getColumnCount();
            // 遍历结果集
            while ( resultSet.next() ) {
                Map<String, Object> map = new HashMap<>();
                for ( int i = 0; i < columnCount; i++ )
                {
                    // 根据列索引取得每一列的列名，索引从1开始
                    String columnName = resultSetMetaData.getColumnName( i+1 );
                    // 根据列名取得列值
                    Object columnValue = resultSet.getObject( columnName );
                    // 将列名作为key, 列值作为值，放入map中，每个map相当于一条记录
                    map.put( columnName, columnValue );
                }
                // 将每个map添加到list，list相当于是整个表，每个map是里面的一条记录
                list.add( map );
            }
        } catch (SQLException | ClassNotFoundException e ) {
            e.printStackTrace();
        }
        finally {
            close();
        }
        return list;
    }

    /**
     * 执行更新
     * @param sql
     *      传入预设的sql语句
     * @param params
     *      问号参数列表
     * @return 影响行数
     */
    public static int execUpdate( String sql, Object[] params ) {
        try {
            getConnection();   // 获得连接对象
            preparedStatement = connection.prepareStatement(sql); // 获得预设语句对象

            if ( params != null )
            {   // 设置参数列表
                for ( int i = 0; i < params.length; i++ )
                {   // 问号参数的索引是从1开始
                    preparedStatement.setObject(i+1, params[i]+"");
                }

            }
            // 执行更新
            return preparedStatement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        finally {
            close();
        }
        return 0;
    }

    /* 重写wxh的sql查询 */
    public static ResultSet executeQuery(String sql) {
        try {
            getConnection();
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return resultSet;
    }
    
    /* 重写wxh的sql增删改语句 */
    public static void execute(String sql) {
    	try {
    		preparedStatement = connection.prepareStatement(sql);
    		preparedStatement.execute();
    	} catch (SQLException e) {
    		e.printStackTrace();
    	}
    }

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
    	if(getConnection() != null) {
    		System.out.println("连接成功");
    	}
    }

}
