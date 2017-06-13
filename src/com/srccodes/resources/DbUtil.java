package com.srccodes.resources;


import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class DbUtil {
	static Connection conn = null;
	static ResultSet rs = null;
	static PreparedStatement pst = null;

	public static Connection connection() {
		Properties properties = new Properties();
		InputStream input = DbUtil.class.getClassLoader().getResourceAsStream(
				"credentials.properties");
		try {
			properties.load(input);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String username = properties.get("username").toString();
		String password = properties.get("password").toString();
		String db1url = properties.get("db1url").toString();
		String driver = properties.get("driver").toString();
		try {
			// String issue_name = serviceBean.getGetIssue_name();

			Class.forName(db1url);
			conn = DriverManager.getConnection(driver, username, password);
		} catch (SQLException se) {
			System.out.println(se);
		} catch (ClassNotFoundException cnfe) {
			cnfe.printStackTrace();
		}
		return conn;
	}

	public static void closeConnection() {
		try {
			if (conn != null) {
				conn.close();
				System.out.println("connection closed");
			}
			if (pst != null) {
				pst.close();
				System.out.println("prepareStatement closed");
			}
			if (rs != null) {
				rs.close();
				System.out.println("ResultSet closed");
			}
		} catch (SQLException se1) {
			System.out.println(se1.toString());
		}
	}
}
