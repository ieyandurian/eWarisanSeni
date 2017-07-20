package com.eWarisanSeni.app.dao;

import java.io.IOException;
import java.sql.*;

import org.apache.commons.fileupload.FileItem;

import com.eWarisanSeni.app.bean.ProductBean;
import com.eWarisanSeni.app.bean.StaffBean;
import com.eWarisanSeni.app.util.ConnectionManager;

public class ProductDAO {
	static Connection currentCon = null;
	static ResultSet rs = null;

	public static ProductBean searchProduct(ProductBean prd) {
		// preparing some objects for connection
		Statement stmt = null;

		String prod_SearchName = prd.getProd_SearchName();

		String Productsearch = "select * from product where lower(prod_name) like '%"
				+ prod_SearchName
				+ "%' or upper(prod_name) like '%"
				+ prod_SearchName + "%'";
		// "System.out.println" prints in the console; Normally used to trace
		// the process
		System.out.println("Search Product: " + Productsearch);

		try {
			// connect to DB
			currentCon = ConnectionManager.getConnection();
			// PreparedStatement ps1 =
			// currentCon.prepareStatement(searchAddress);

			stmt = currentCon.createStatement();
			rs = stmt.executeQuery(Productsearch);

			boolean more = rs.next();
			// if user does not exist set the isValid variable to false
			if (!more) {
				System.out.println("Sorry, you have no product.");
				prd.setValid(false);
			}
			// if user exists set the isValid variable to true
			else if (more) {

				prd.setProd_SearchName(prod_SearchName);

				prd.setValid(true);
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
		return prd;
	}

	public static ProductBean addProduct(ProductBean prod, FileItem file,
			StaffBean staff) throws SQLException, IOException {
		// Connect to Oracle
		currentCon = ConnectionManager.getConnection();
		try {
			PreparedStatement ps = currentCon
					.prepareStatement("insert into product values(prodid.nextVal,?,?,?,?,?,?,?)");
			ps.setString(1, prod.getProd_Name());
			ps.setString(2, prod.getProd_Desc());
			ps.setDouble(3, prod.getProd_Price());
			ps.setString(4, prod.getProd_Size());
			ps.setString(5, prod.getProd_Type());
			ps.setString(6, staff.getStaff_id());
			System.out.println("here1");
			// size must be converted to int otherwise it results in error
			ps.setBinaryStream(7, file.getInputStream(), (int) file.getSize());
			System.out.println("here2");
			ps.executeUpdate();
			System.out.println("here3");
		} catch (Exception ex) {
			System.out.println("Update failed: An Exception has occurred! "
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
			if (currentCon != null) {
				try {
					currentCon.close();
				} catch (Exception e) {
				}
				currentCon = null;
			}
		}
		return prod;
	}

	public static ProductBean viewProduct(ProductBean cart) {
		// preparing some objects for connection
		Statement stmt = null;

		int cart_prod_id = cart.getProd_ID();
		int cart_prod_quantity = cart.getProd_Quantity();

		String searchProduct = "select * from product where prod_id ='"
				+ cart_prod_id + "'";
		// "System.out.println" prints in the console; Normally used to trace
		// the process
		System.out.println("Search Product: " + searchProduct);

		try {
			// connect to DB
			currentCon = ConnectionManager.getConnection();
			// PreparedStatement ps1 =
			// currentCon.prepareStatement(searchAddress);

			stmt = currentCon.createStatement();
			rs = stmt.executeQuery(searchProduct);
			boolean more = rs.next();
			// if user does not exist set the isValid variable to false
			if (!more) {
				System.out
						.println("Sorry, the product is currently not available.");
				cart.setValid(false);
			}
			// if user exists set the isValid variable to true
			else if (more) {
				int prod_id = rs.getInt("prod_id");
				String prod_name = rs.getString("prod_name");
				String prod_desc = rs.getString("prod_desc");
				double prod_price = rs.getDouble("prod_price");
				String prod_size = rs.getString("prod_size");
				String prod_type = rs.getString("prod_type");

				cart.setProd_ID(prod_id);
				cart.setProd_Name(prod_name);
				cart.setProd_Desc(prod_desc);
				cart.setProd_Quantity(cart_prod_quantity);
				cart.setProd_Price(prod_price);
				cart.setProd_Size(prod_size);
				cart.setProd_Type(prod_type);
				cart.setValid(true);
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
		return cart;
	}

	public static ProductBean deleteProduct(ProductBean prod)
			throws SQLException {
		// "System.out.println" prints in the console; Normally used to trace
		// the process
		System.out.println("Stage 2 - deleting product...");

		try {
			currentCon = ConnectionManager.getConnection();
			try {
				System.out.println("Stage 3 - deleting product...");
				PreparedStatement ps = currentCon
						.prepareStatement("delete from product where prod_id = ?");
				try {
					System.out.println("Stage 4 - deleting address...");
					ps.setInt(1, prod.getProd_ID());
					int i = ps.executeUpdate();
					System.out.println("Stage 5 - deleting address...");
					ps.close();
					if (i > 0) {
						System.out
								.println("The product has been deleted successfully….");
					} else {
						System.out
								.println("Product cannot be deleted..Try Again…");
					}
				} catch (SQLException ex) {
					System.out
							.println("Integrity constraint: an exception has occurred! "
									+ ex);
				} finally {
					ps.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} finally {
			currentCon.close();
		}
		return prod;
	}

	public static ProductBean view(ProductBean cart, int key) {
		Statement stmt = null;
		int cart_prod_id = key;

		String searchProduct = "select * from product where prod_id ='"
				+ cart_prod_id + "'";
		// "System.out.println" prints in the console; Normally used to
		// trace
		// the process
		System.out.println("Search Product: " + searchProduct);

		try {
			// connect to DB
			currentCon = ConnectionManager.getConnection();
			// PreparedStatement ps1 =
			// currentCon.prepareStatement(searchAddress);

			stmt = currentCon.createStatement();
			rs = stmt.executeQuery(searchProduct);
			boolean more = rs.next();
			// if user does not exist set the isValid variable to false
			if (!more) {
				System.out
						.println("Sorry, the product is currently not available.");
				cart.setValid(false);
			}
			// if user exists set the isValid variable to true
			else if (more) {
				int prod_id = rs.getInt("prod_id");
				String prod_name = rs.getString("prod_name");
				String prod_desc = rs.getString("prod_desc");
				double prod_price = rs.getDouble("prod_price");
				String prod_size = rs.getString("prod_size");
				String prod_type = rs.getString("prod_type");

				cart.setProd_ID(prod_id);
				cart.setProd_Name(prod_name);
				cart.setProd_Desc(prod_desc);
				cart.setProd_Price(prod_price);
				cart.setProd_Size(prod_size);
				cart.setProd_Type(prod_type);
				cart.setValid(true);
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
		return cart;
	}

	public static ProductBean updateProduct(ProductBean prod)
			throws SQLException {
		try {
			currentCon = ConnectionManager.getConnection();
			try {
				PreparedStatement ps = currentCon
						.prepareStatement("update product set prod_ID=?, prod_Name=?, prod_Desc=?, prod_Size=?, prod_Price=?, prod_Type=? where prod_ID=?");
				try {
					ps.setInt(1, prod.getProd_ID());
					ps.setString(2, prod.getProd_Name());
					ps.setString(3, prod.getProd_Desc());
					ps.setString(4, prod.getProd_Size());
					ps.setDouble(5, prod.getProd_Price());
					ps.setString(6, prod.getProd_Type());
					ps.setInt(7, prod.getProd_ID());
					ps.executeUpdate();
					prod.setValid(true);
				} finally {
					ps.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} finally {
			currentCon.close();
		}
		return prod;
	}
}