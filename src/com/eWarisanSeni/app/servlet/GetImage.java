package com.eWarisanSeni.app.servlet;

import java.sql.*;
import java.util.*;

public class GetImage {
	public Vector ImageList() throws SQLException {
		Vector vList = new Vector();
		try {
			Connection con = null;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe", "eWarisanSeni",
					"oracle");
			Statement stmt = con.createStatement();
			String strSql = "select prod_id,prod_name from product";
			System.out.println("ImageList query–" + strSql);
			ResultSet rs = stmt.executeQuery(strSql);

			while (rs.next()) {
				String temp[] = new String[2];
				temp[0] = rs.getString("Prod_ID");
				temp[1] = rs.getString("Prod_Name");
				vList.add(temp);
			}
		} catch (Exception e) {
			System.err.print("ImageList Exception : " + e);
			System.err.println("ImageList Exception : " + e.getMessage());
		}
		return vList;
	}
}