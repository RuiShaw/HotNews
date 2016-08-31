package com.springapp.mvc.utils;

import com.springapp.mvc.bean.User;

import java.sql.*;
import java.util.Properties;

/**
 * Created by Xr on 2016/8/25.
 */
public class MySQLUtils {

    private static Connection conn = null;

    static {
        Properties pp = new Properties();
        try {

            Class.forName("com.mysql.jdbc.Driver");

            pp.load(MySQLUtils.class.getClassLoader().getResourceAsStream("mysql.properties"));

            String url = pp.getProperty("db.url");
            String username = pp.getProperty("db.username");
            String password = pp.getProperty("db.password");

            conn = DriverManager.getConnection(url, username, password);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * get mysql connect
     * @return
     */
    public static Connection getConn() {
        return conn;
    }


    /**
     * insert data to users table.
     * @param sql
     * @return �Ƿ�ɹ�����
     */
    public static boolean insert(String sql) throws SQLException {
        Statement stmt = conn.createStatement();
        return stmt.executeUpdate(sql) > 0;
    }

    /**
     * ��������Ƿ����
     * @param sql
     * @return true: ����, false: ������.
     */
    public static boolean queryEmail(String sql) throws SQLException {
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        int size = 0;
        if (rs != null) {
            rs.beforeFirst();
            rs.last();
            size = rs.getRow();
        }
        return size > 0;
    }

    /**
     * ��ѯ�û�
     * @param sql ��ѯSQL
     * @return �����û�
     */
    public static User queryForUser(String sql) throws SQLException {
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        User user = new User();
        if (rs.next()) {
            String nickname = rs.getString("nickname");
            String username = rs.getString("username");
            String password = rs.getString("password");
            user.setNickname(nickname);
            user.setEmail(username);
            user.setPassword(password);
        }
        return user;
    }

    /**
     * close mysql connect
     */
    public static void closeConn() {
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
