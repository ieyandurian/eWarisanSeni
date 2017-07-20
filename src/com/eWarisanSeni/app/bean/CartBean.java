package com.eWarisanSeni.app.bean;

import java.util.HashMap;

public class CartBean {
	HashMap<Integer, Integer> cartItems;

	public CartBean() {
		cartItems = new HashMap<>();
	}

	public HashMap<Integer, Integer> getCartItems() {
		return cartItems;
	}

	public void addToCart(int prod_ID, int prod_Quantity) {
		cartItems.put(prod_ID, prod_Quantity);
	}

	public void deleteFromCart(int prod_ID) {
		cartItems.remove(prod_ID);
	}
}