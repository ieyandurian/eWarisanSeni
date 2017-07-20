package com.eWarisanSeni.app.bean;

import org.apache.catalina.Group;


public class CustomerBean extends PersonBean {
	private int cust_id;
	private String cust_firstname, cust_lastname, cust_icnum, cust_phonenumber,
			cust_email, cust_username, cust_password;
	private AddressBean address;
	private boolean valid;
	private Group group;

	public int getCust_id() {
		return cust_id;
	}

	public void setCust_id(int cust_id) {
		this.cust_id = cust_id;
	}

	public String getCust_firstname() {
		return cust_firstname;
	}

	public void setCust_firstname(String cust_firstname) {
		this.cust_firstname = cust_firstname;
	}

	public String getCust_lastname() {
		return cust_lastname;
	}

	public void setCust_lastname(String cust_lastname) {
		this.cust_lastname = cust_lastname;
	}

	public String getCust_icnum() {
		return cust_icnum;
	}

	public void setCust_icnum(String cust_icnum) {
		this.cust_icnum = cust_icnum;
	}

	public String getCust_phonenumber() {
		return cust_phonenumber;
	}

	public void setCust_phonenumber(String cust_phonenumber) {
		this.cust_phonenumber = cust_phonenumber;
	}

	public String getCust_email() {
		return cust_email;
	}

	public void setCust_email(String cust_email) {
		this.cust_email = cust_email;
	}

	public String getCust_username() {
		return cust_username;
	}

	public void setCust_username(String cust_username) {
		this.cust_username = cust_username;
	}

	public String getCust_password() {
		return cust_password;
	}

	public void setCust_password(String cust_password) {
		this.cust_password = cust_password;
	}

	public boolean isValid() {
		return valid;
	}

	public void setValid(boolean newValid) {
		valid = newValid;
	}

	public AddressBean getAddress() {
		return address;
	}

	public void setAddress(AddressBean address) {
		this.address = address;
	}

	public void setGroup(Group group) {
		this.group = group;
	}

	public Group getGroup() {
		return group;
	}
}