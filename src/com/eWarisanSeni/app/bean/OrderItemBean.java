package com.eWarisanSeni.app.bean;

public class OrderItemBean {
	private int orderitem_id, cust_id, prod_id, orderitem_quantity, orderitem_totalprice, order_id;
	private boolean valid;

	public int getProd_id() {
		return prod_id;
	}

	public void setProd_id(int prod_id) {
		this.prod_id = prod_id;
	}

	public int getOrderitem_quantity() {
		return orderitem_quantity;
	}

	public void setOrderitem_quantity(int orderitem_quantity) {
		this.orderitem_quantity = orderitem_quantity;
	}

	public int getCust_id() {
		return cust_id;
	}

	public void setCust_id(int cust_id) {
		this.cust_id = cust_id;
	}

	public int getOrderitem_totalprice() {
		return orderitem_totalprice;
	}

	public void setOrderitem_totalprice(int orderitem_totalprice) {
		this.orderitem_totalprice = orderitem_totalprice;
	}

	public int getOrderitem_id() {
		return orderitem_id;
	}

	public void setOrderitem_id(int orderitem_id) {
		this.orderitem_id = orderitem_id;
	}
	

	public boolean isValid() {
		return valid;
	}

	public void setValid(boolean newValid) {
		valid = newValid;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
}