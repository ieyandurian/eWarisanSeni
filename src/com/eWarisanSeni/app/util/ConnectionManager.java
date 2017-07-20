package com.eWarisanSeni.app.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {

	static Connection con;

	private static final String DB_DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String DB_CONNECTION = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String DB_USER = "eWarisanSeni";
	private static final String DB_PASSWORD = "oracle";

	public static Connection getConnection() {

		try {
			System.out.println("connected 50%");

			Class.forName(DB_DRIVER);
			System.out.println("connected 75%");

			try {
				con = DriverManager.getConnection(DB_CONNECTION, DB_USER,
						DB_PASSWORD);
				System.out.println("connected 100%");

			}

			catch (SQLException ex) {
				ex.printStackTrace();
			}
		}

		catch (ClassNotFoundException e) {
			System.out.println(e);
		}

		return con;
	}
}
