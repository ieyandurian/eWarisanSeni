package com.eWarisanSeni.app.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.eWarisanSeni.app.bean.StaffBean;
import com.eWarisanSeni.app.util.ConnectionManager;

public class StaffDAO {
	static Connection currentCon = null;
	static ResultSet rs = null;

	public static StaffBean loginStaff(StaffBean bean) {
		// preparing some objects for connection
		
		Statement stmt = null;
		String staff_id = bean.getStaff_id();
		String staff_password = bean.getStaff_password();
		String searchQuery = "select * from staff where staff_id='"
				+ staff_id + "' AND staff_password='" + staff_password + "'";
		// "System.out.println" prints in the console; Normally used to trace
		// the process
		System.out.println("Staff id is " + staff_id);
		System.out.println("Staff password is " + staff_password);
		System.out.println("Query: " + searchQuery);

		try {
			// connect to DB
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			rs = stmt.executeQuery(searchQuery);
			boolean more = rs.next();
			// if user does not exist set the isValid variable to false
			if (!more) {
				System.out
						.println("Sorry, you are not a registered user! Please sign up first");
				bean.setValid(false);
			}
			// if user exists set the isValid variable to true
			else if (more) {
				System.out.println("Welcome eWarisanSeni. You log in as staff");
				bean.setValid(true);
			}
		} catch (Exception ex) {
			System.out.println("Log In failed: An Exception has occurred! "
					+ ex);
		}
		// some exception handling
		finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
				}
				rs = null;
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (Exception e) {
				}
				stmt = null;
			}
			if (currentCon != null) {
				try {
					currentCon.close();
				} catch (Exception e) {
				}
				currentCon = null;
			}
		}
		return bean;
				
	}
}