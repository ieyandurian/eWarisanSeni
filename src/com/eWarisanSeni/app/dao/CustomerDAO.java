package com.eWarisanSeni.app.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.eWarisanSeni.app.bean.CustomerBean;
import com.eWarisanSeni.app.util.ConnectionManager;

public class CustomerDAO {
	static Connection currentCon = null;
	static ResultSet rs = null;

	public static CustomerBean loginCustomer(CustomerBean bean) {
		// preparing some objects for connection
		Statement stmt = null;
		String cust_username = bean.getCust_username();
		String cust_password = bean.getCust_password();
		String searchQuery = "select * from customer where cust_username='"
				+ cust_username + "' AND cust_password='" + cust_password + "'";
		// "System.out.println" prints in the console; Normally used to trace
		// the process
		System.out.println("Your user name is " + cust_username);
		System.out.println("Your password is " + cust_password);
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
				int cust_ID = rs.getInt("cust_ID");
				String cust_firstName = rs.getString("cust_firstName");
				String cust_lastName = rs.getString("cust_lastName");
				String cust_icNum = rs.getString("cust_icNum");
				String cust_Email = rs.getString("cust_Email");
				String cust_phoneNumber = rs.getString("cust_phoneNumber");

				System.out.println("Welcome " + cust_firstName);
				bean.setCust_id(cust_ID);
				bean.setCust_firstname(cust_firstName);
				bean.setCust_lastname(cust_lastName);
				bean.setCust_icnum(cust_icNum);
				bean.setCust_email(cust_Email);
				bean.setCust_phonenumber(cust_phoneNumber);
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

	public static CustomerBean updatePassword(CustomerBean bean, String newpswd) throws SQLException {
		Connection con = ConnectionManager.getConnection();
		try {
			PreparedStatement ps = con
					.prepareStatement("update customer set cust_password = ? where cust_username = ? and cust_password = ?");
			try {
				ps.setString(1, newpswd);
				ps.setString(2, bean.getCust_username());
				ps.setString(3, bean.getCust_password());
				ps.executeUpdate();
				bean.setValid(true);
				System.out.println("Updating password...");
			} finally {
				ps.close();
			}
		} finally {
			con.close();
		}
		return bean;
	}

	public static CustomerBean updateAccount(CustomerBean userAcc)
			throws SQLException {
		// "System.out.println" prints in the console; Normally used to trace
		// the process
		System.out.println("Stage 4 - Updating account...");

		try {
			currentCon = ConnectionManager.getConnection();
			try {
				System.out.println("Stage 5 - Updating account...");
				String updateSQL = "UPDATE customer SET cust_email = '"
						+ userAcc.getCust_email() + "', cust_firstname = '"
						+ userAcc.getCust_firstname() + "', cust_lastname = '"
						+ userAcc.getCust_lastname() + "', cust_icnum = '"
						+ userAcc.getCust_icnum() + "', cust_phonenumber = '"
						+ userAcc.getCust_phonenumber() + "' where cust id = '"
						+ userAcc.getCust_id() + "';";
				PreparedStatement ps = currentCon
						.prepareStatement("UPDATE customer SET cust_email=?, cust_firstname=?, cust_lastname=?, cust_icnum=?, cust_phonenumber=? where cust_id=?");
				try {
					System.out.println("Stage 6 - Updating account...");
					ps.setString(1, userAcc.getCust_email());
					ps.setString(2, userAcc.getCust_firstname());
					ps.setString(3, userAcc.getCust_lastname());
					ps.setString(4, userAcc.getCust_icnum());
					ps.setString(5, userAcc.getCust_phonenumber());
					ps.setInt(6, userAcc.getCust_id());
					System.out.println(updateSQL);
					int i = ps.executeUpdate();
					System.out.println("Stage 7 - Updating account...");
					ps.close();
					if (i > 0) {
						System.out
								.println("Your account has been changed successfully….");
					} else {
						System.out
								.println("Account does not Change..Try Again…");
					}
				} finally {
					ps.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} finally {
			currentCon.close();
		}
		return userAcc;
	}

	public static CustomerBean updateCustomerAccount(CustomerBean userAcc)
			throws SQLException {
		// "System.out.println" prints in the console; Normally used to trace
		// the process
		System.out.println("Stage 4 - Updating account...");
		try {
			currentCon = ConnectionManager.getConnection();
			try {
				System.out.println("Stage 5 - Updating account...");
				PreparedStatement ps = currentCon
						.prepareStatement("update customer set cust_id=?, cust_username=?, cust_password=?, cust_email=?, cust_firstname=?, cust_lastname=?, cust_icnum=?, cust_phonenumber=? where cust_id=?");
				try {
					System.out.println("Stage 6 - Updating account...");
					ps.setInt(1, userAcc.getCust_id());
					ps.setString(2, userAcc.getCust_username());
					ps.setString(3, userAcc.getCust_password());
					ps.setString(4, userAcc.getCust_email());
					ps.setString(5, userAcc.getCust_firstname());
					ps.setString(6, userAcc.getCust_lastname());
					ps.setString(7, userAcc.getCust_icnum());
					ps.setString(8, userAcc.getCust_phonenumber());
					ps.setInt(9, userAcc.getCust_id());
					int i = ps.executeUpdate();
					System.out.println("Stage 7 - Updating account...");
					ps.close();
					userAcc.setValid(true);
					if (i > 0) {
						System.out
								.println("Your account has been changed successfully….");
					} else {
						System.out
								.println("Account does not Change..Try Again…");
					}
				} finally {
					ps.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} finally {
			currentCon.close();
		}
		return userAcc;
	}

	public static CustomerBean createNewCustomer(CustomerBean cust) {
		try {
			Connection con = ConnectionManager.getConnection();

			PreparedStatement ps = con
					.prepareStatement("insert into customer values(custid.nextVal,?,?,?,?,?,?,?,?)");
			ps.setInt(1, 1000);
			ps.setString(2, cust.getCust_username());
			ps.setString(3, cust.getCust_password());
			ps.setString(4, cust.getCust_email());
			ps.setString(5, cust.getCust_firstname());
			ps.setString(6, cust.getCust_lastname());
			ps.setString(7, cust.getCust_icnum());
			ps.setString(8, cust.getCust_phonenumber());
			ps.executeUpdate();
			cust.setValid(true);
		} catch (Exception e2) {
			System.out.println(e2);
		}
		return cust;
	}
}
