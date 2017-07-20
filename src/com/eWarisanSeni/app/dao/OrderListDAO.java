package com.eWarisanSeni.app.dao;

import java.sql.*;

import com.eWarisanSeni.app.bean.AddressBean;
import com.eWarisanSeni.app.bean.OrderListBean;
import com.eWarisanSeni.app.util.ConnectionManager;

public class OrderListDAO {
	static Connection currentCon = null;

	/*
	 * private static Timestamp getCurrentDate() { java.util.Date today = new
	 * java.util.Date(); return new java.sql.Timestamp(today.getTime()); }
	 */

	private static Date getCurrentDate() {
		java.util.Date today = new java.util.Date();
		return new java.sql.Date(today.getTime());
	}

	public static OrderListBean createOrder(String address, String payment,
			AddressBean userAdd, double totalprice) throws SQLException {
		System.out.println("Stage 3 - creating order...");
		OrderListBean order = new OrderListBean();
		order.setOrder_date(getCurrentDate());
		order.setOrder_totalprice(totalprice);
		order.setOrder_paymentmethod("Cash On Delivery");
		order.setOrder_status("Processing");
		order.setAdd_id(userAdd.getAdd_id());

		try {
			currentCon = ConnectionManager.getConnection();
			try {
				Statement stmt = currentCon.createStatement();
				ResultSet rs = stmt
						.executeQuery("select ordid.nextval from dual");
				boolean more = rs.next();
				// if user does not exist set the isValid variable to false
				if (!more) {
					System.out.println("Sorry, you have no order.");
					order.setValid(false);
				}
				// if user exists set the isValid variable to true
				else if (more) {
					int order_id = rs.getInt("nextval");
					order.setOrder_id(order_id);
					order.setValid(true);
				}
				System.out.println("Stage 4 - creating order...");
				PreparedStatement ps = currentCon
						.prepareStatement("insert into orderlist values(ordid.currval,?,?,?,?,?,?)");
				try {
					System.out.println("Stage 5 - creating order...");
					ps.setDate(1, order.getOrder_date());
					ps.setDouble(2, totalprice);
					ps.setString(3, order.getOrder_status());
					ps.setInt(4, 1000);
					ps.setString(5, order.getOrder_paymentmethod());
					ps.setInt(6, order.getAdd_id());
					int i = ps.executeUpdate();
					System.out.println("Stage 6 - creating order...");
					order.setValid(true);
					ps.close();

					stmt = currentCon.createStatement();
					rs = stmt.executeQuery("select ordid.currval from dual");
					more = rs.next();
					// if user does not exist set the isValid variable to false
					if (!more) {
						System.out.println("Sorry, you have no order.");
						order.setValid(false);
					}
					// if user exists set the isValid variable to true
					else if (more) {
						int order_id = rs.getInt("currval");
						order.setOrder_id(order_id);
						order.setValid(true);
					}

					if (i > 0) {
						System.out
								.println("Your order has been submitted successfully….");
					} else {
						System.out
								.println("The order cannot be submitted..Try Again…");
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
		return order;
	}

	public static OrderListBean updateOrder(OrderListBean ord)
			throws SQLException {
		try {
			String updateOrderSQL = "update orderList set order_Status = '"
					+ ord.getOrder_status() + "' where order_ID = '"
					+ ord.getOrder_id() + "'";
			currentCon = ConnectionManager.getConnection();
			try {
				Statement statement = currentCon.createStatement();
				System.out.println("updating status");
				statement.execute(updateOrderSQL);
				ord.setValid(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} finally {
			currentCon.close();
		}
		return ord;
	}

}
