package com.eWarisanSeni.app.bean;

import java.sql.Date;
import java.sql.Timestamp;

public class OrderListBean {
	private int order_id, staff_id, add_id;
	private Date order_date;
	private double order_totalprice;
	private String order_status, order_paymentmethod;
	private boolean valid;

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

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date date) {
		this.order_date = date;
	}

	public double getOrder_totalprice() {
		return order_totalprice;
	}

	public void setOrder_totalprice(double order_totalprice) {
		this.order_totalprice = order_totalprice;
	}

	public String getOrder_status() {
		return order_status;
	}

	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}

	public int getAdd_id() {
		return add_id;
	}

	public void setAdd_id(int add_id) {
		this.add_id = add_id;
	}

	public int getStaff_id() {
		return staff_id;
	}

	public void setStaff_id(int staff_id) {
		this.staff_id = staff_id;
	}

	public String getOrder_paymentmethod() {
		return order_paymentmethod;
	}

	public void setOrder_paymentmethod(String order_paymentmethod) {
		this.order_paymentmethod = order_paymentmethod;
	}

	public void setOrder_Date(Timestamp timestamp) {
		// TODO Auto-generated method stub
		
	}
}