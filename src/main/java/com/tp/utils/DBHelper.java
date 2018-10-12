package com.tp.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by hongjian.chen on 2018/3/28.
 */
public class DBHelper {
    public static final String url = "jdbc:mysql://114.115.217.234:3306/work?useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull";
    public static final String name = "com.mysql.jdbc.Driver";
    public static final String user = "after";
    public static final String password = "after";

    public Connection conn = null;
    public PreparedStatement pst = null;

    public DBHelper() {
        try {
            Class.forName(name);
            conn = DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void getById(String sql, Long pid) {
        try {
            pst = conn.prepareStatement(sql);
            pst.setObject(1, pid);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void getAll(String sql) {
        try {
            pst = conn.prepareStatement(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void close() {
        try {
            this.conn.close();
            this.pst.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
