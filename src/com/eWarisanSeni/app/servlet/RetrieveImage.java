package com.eWarisanSeni.app.servlet;

import java.sql.*;
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 * Servlet implementation class RetrieveImage
 */
public class RetrieveImage extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ResultSet rs;
		InputStream sImage;

		try {

			String prod_ID = request.getParameter("prod_ID");
			Connection con = null;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe", "eWarisanSeni",
					"oracle");
			Statement stmt = con.createStatement();
			String strSql = "select prod_Image from Product where prod_ID='"
					+ prod_ID + "'";
			System.out.println("inside servlet Sql–>" + strSql);
			rs = stmt.executeQuery(strSql);
			if (rs.next()) {
				byte[] bytearray = new byte[1048576];
				int size = 0;
				sImage = rs.getBinaryStream(1);
				response.reset();
				response.setContentType("image/jpeg");
				while ((size = sImage.read(bytearray)) != -1) {
					response.getOutputStream().write(bytearray, 0, size);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}