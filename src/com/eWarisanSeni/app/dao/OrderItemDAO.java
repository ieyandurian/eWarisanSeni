package com.eWarisanSeni.app.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;

import com.eWarisanSeni.app.bean.CartBean;
import com.eWarisanSeni.app.bean.CustomerBean;
import com.eWarisanSeni.app.bean.OrderItemBean;
import com.eWarisanSeni.app.bean.OrderListBean;
import com.eWarisanSeni.app.bean.ProductBean;
import com.eWarisanSeni.app.util.ConnectionManager;

public class OrderItemDAO {
	static Connection currentCon = null;
	static double itemprice;

	public static OrderItemBean createOrderItem(OrderItemBean item, CartBean shoppingCart,
			CustomerBean user, OrderListBean order, ProductBean cart) throws SQLException {
		System.out.println("Stage 1 - creating order item...");

		try {
			currentCon = ConnectionManager.getConnection();
			try {
				HashMap<Integer, Integer> items = shoppingCart.getCartItems();
				for (int key : items.keySet()) {
					cart = ProductDAO.view(cart, key);
					itemprice = 0;
					itemprice = cart.getProd_Price() * items.get(key);
					System.out.println(key + " " + items.get(key) + " " + itemprice);
					cart.setProd_Price(itemprice);
					System.out.println("Stage 2 - creating order item...");
					PreparedStatement ps = currentCon
							.prepareStatement("insert into orderitem values(orditemid.nextVal,?,?,?,?,?)");
					try {
						System.out.println("Stage 3 - creating order item...");
						ps.setInt(1, user.getCust_id());
						ps.setInt(2, key);
						ps.setInt(3, items.get(key));
						ps.setDouble(4, cart.getProd_Price());
						ps.setInt(5, order.getOrder_id());
						int i = ps.executeUpdate();
						System.out.println("Stage 4 - creating order item...");
						item.setValid(true);
						ps.close();
						if (i > 0) {
							System.out
									.println("Your order item has been received successfully….");
						} else {
							System.out
									.println("Order item cannot be received..Try Again…");
						}
					} finally {
						ps.close();
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} finally {
			currentCon.close();
		}
		return item;
	}

}
