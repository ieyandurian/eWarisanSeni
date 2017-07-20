package com.eWarisanSeni.app.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.eWarisanSeni.app.bean.AddressBean;
import com.eWarisanSeni.app.bean.CustomerBean;
import com.eWarisanSeni.app.util.ConnectionManager;

public class AddressDAO {
	static Connection currentCon = null;
	static ResultSet rs = null;
	private static int cust_id;

	public static AddressBean viewAddress(CustomerBean bean) {
		// preparing some objects for connection
		Statement stmt = null;

		AddressBean temp = new AddressBean();

		cust_id = bean.getCust_id();

		String searchAddress = "select * from address where cust_id ='"
				+ cust_id + "'";
		// "System.out.println" prints in the console; Normally used to trace
		// the process
		System.out.println("Search Address: " + searchAddress);

		try {
			// connect to DB
			currentCon = ConnectionManager.getConnection();
			// PreparedStatement ps1 =
			// currentCon.prepareStatement(searchAddress);

			stmt = currentCon.createStatement();
			rs = stmt.executeQuery(searchAddress);
			boolean more = rs.next();
			// if user does not exist set the isValid variable to false
			if (!more) {
				System.out.println("Sorry, you have no valid address.");
				bean.setValid(false);
			}
			// if user exists set the isValid variable to true
			else if (more) {

				int add_id = rs.getInt("add_id");
				String add_address = rs.getString("add_address");
				String add_postcode = rs.getString("add_postcode");
				String add_city = rs.getString("add_city");
				String add_country = rs.getString("add_country");
				String add_state = rs.getString("add_state");
				int add_cust_id = rs.getInt("cust_id");
				System.out.println("Address: " + add_id + " " + add_address
						+ " " + add_postcode + " " + add_city + " "
						+ add_country + " " + add_state + " " + add_cust_id);

				temp.setAdd_id(add_id);
				temp.setAdd_address(add_address);
				temp.setAdd_postcode(add_postcode);
				temp.setAdd_city(add_city);
				temp.setAdd_country(add_country);
				temp.setAdd_state(add_state);
				temp.setCust_id(add_cust_id);
				temp.setValid(true);
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
		return temp;
	}

	public static AddressBean updateAddress(AddressBean userAdd)
			throws SQLException {
		// "System.out.println" prints in the console; Normally used to trace
		// the process
		System.out.println("Stage 2 - Updating address...");

		try {
			currentCon = ConnectionManager.getConnection();
			try {
				System.out.println("Stage 3 - Updating address...");
				String updateSQL = "UPDATE address SET add_address = '"
						+ userAdd.getAdd_address() + "', add_postcode = '"
						+ userAdd.getAdd_postcode() + "', add_city = '"
						+ userAdd.getAdd_city() + "', add_state = '"
						+ userAdd.getAdd_state() + "', add_country = '"
						+ userAdd.getAdd_country() + "' where add id = '"
						+ userAdd.getAdd_id() + "' and cust_id = '"
						+ userAdd.getCust_id() + "';";
				PreparedStatement ps = currentCon
						.prepareStatement("UPDATE address SET add_address=?, add_postcode=?, add_city=?, add_state=?, add_country=? where add_id=?");
				try {
					System.out.println("Stage 4 - Updating address...");
					ps.setString(1, userAdd.getAdd_address());
					ps.setString(2, userAdd.getAdd_postcode());
					ps.setString(3, userAdd.getAdd_city());
					ps.setString(4, userAdd.getAdd_state());
					ps.setString(5, userAdd.getAdd_country());
					ps.setInt(6, userAdd.getAdd_id());
					System.out.println(updateSQL);
					int i = ps.executeUpdate();
					System.out.println("Stage 5 - Updating address...");
					ps.close();
					if (i > 0) {
						System.out
								.println("Your address has been changed successfully….");
					} else {
						System.out
								.println("Address doesnot Change..Try Again…");
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
		return userAdd;
	}

	public static List<AddressBean> getAllAddress() {

		List<AddressBean> addresses = new ArrayList<AddressBean>();
		currentCon = ConnectionManager.getConnection();
		try {

			String sql = "SELECT * FROM address where cust_id = '" + cust_id
					+ "'";

			PreparedStatement pst = currentCon.prepareStatement(sql);

			ResultSet rs = pst.executeQuery();

			while (rs.next()) {

				AddressBean address = new AddressBean();

				address.setAdd_id(rs.getInt(1));
				address.setAdd_address(rs.getString(2));
				address.setAdd_postcode(rs.getString(3));
				address.setAdd_city(rs.getString(4));
				address.setAdd_state(rs.getString(5));
				address.setAdd_country(rs.getString(6));

				addresses.add(address);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return addresses;
	}

	public static AddressBean addAddress(CustomerBean user, AddressBean userAdd)
			throws SQLException {
		// "System.out.println" prints in the console; Normally used to trace
		// the process
		System.out.println("Stage 2 - adding new address...");

		try {
			currentCon = ConnectionManager.getConnection();
			try {
				System.out.println("Stage 3 - adding new address...");
				PreparedStatement ps = currentCon
						.prepareStatement("insert into address values(addid.nextVal,?,?,?,?,?,(select cust_id from customer where cust_username=? and cust_password=?))");
				try {
					System.out.println("Stage 4 - adding new address...");
					ps.setString(1, userAdd.getAdd_address());
					ps.setString(2, userAdd.getAdd_postcode());
					ps.setString(3, userAdd.getAdd_city());
					ps.setString(4, userAdd.getAdd_state());
					ps.setString(5, userAdd.getAdd_country());
					ps.setString(6, user.getCust_username());
					ps.setString(7, user.getCust_password());
					int i = ps.executeUpdate();
					userAdd.setValid(true);
					System.out.println("Stage 5 - adding new address...");
					ps.close();
					if (i > 0) {
						System.out
								.println("Your address has been added successfully….");
					} else {
						System.out
								.println("Address cannot be added..Try Again…");
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
		return userAdd;
	}

	public static AddressBean deleteAddress(AddressBean userAdd)
			throws SQLException {
		// "System.out.println" prints in the console; Normally used to trace
		// the process
		System.out.println("Stage 2 - deleting address...");
		userAdd.setValid(true);

		try {
			currentCon = ConnectionManager.getConnection();
			try {
				System.out.println("Stage 3 - deleting address...");
				PreparedStatement ps = currentCon
						.prepareStatement("delete from address where add_id = ?");
				try {
					System.out.println("Stage 4 - deleting address...");
					ps.setInt(1, userAdd.getAdd_id());
					int i = ps.executeUpdate();
					System.out.println("Stage 5 - deleting address...");
					ps.close();
					if (i > 0) {
						System.out
								.println("The address has been deleting successfully….");
					} else {
						System.out
								.println("Address cannot be deleting..Try Again…");
					}
					try {
						currentCon = ConnectionManager.getConnection();
						try {
							System.out.println("Stage 3 - deleting address...");
							PreparedStatement ps = currentCon
									.prepareStatement("delete from address where add_id = ?");
							try {
								System.out
										.println("Stage 4 - deleting address...");
								ps.setInt(1, userAdd.getAdd_id());
								int i = ps.executeUpdate();
								System.out
										.println("Stage 5 - deleting address...");
								ps.close();
								if (i > 0) {
									System.out
											.println("The address has been deleting successfully….");
								} else {
									System.out
											.println("Address cannot be deleting..Try Again…");
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
				} finally {
					ps.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} finally {
			currentCon.close();
		}
		return userAdd;
	}

	public static AddressBean updateAddress(CustomerBean cust, AddressBean add)
			throws SQLException {
		// "System.out.println" prints in the console; Normally used to trace
		// the process
		System.out.println("Stage 2 - Updating address...");

		try {
			currentCon = ConnectionManager.getConnection();
			try {
				System.out.println("Stage 3 - Updating address...");
				PreparedStatement ps = currentCon
						.prepareStatement("UPDATE address SET add_address=?, add_postcode=?, add_city=?, add_state=?, add_country=? where add_id=?");
				try {
					System.out.println("Stage 4 - Updating address...");
					ps.setString(1, add.getAdd_address());
					ps.setString(2, add.getAdd_postcode());
					ps.setString(3, add.getAdd_city());
					ps.setString(4, add.getAdd_state());
					ps.setString(5, add.getAdd_country());
					ps.setInt(6, cust.getCust_id());
					int i = ps.executeUpdate();
					System.out.println("Stage 5 - Updating address...");
					ps.close();
					add.setValid(true);
					if (i > 0) {
						System.out
								.println("Your address has been changed successfully….");
					} else {
						System.out
								.println("Address doesnot Change..Try Again…");
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
		return add;
	}

}