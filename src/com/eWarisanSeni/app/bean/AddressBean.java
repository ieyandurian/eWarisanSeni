package com.eWarisanSeni.app.bean;

public class AddressBean {
	private int add_id, cust_id;
	private String add_address, add_city, add_postcode, add_country, add_state;
	private boolean valid;
	
	public int getAdd_id() {
		return add_id;
	}

	public void setAdd_id(int add_id) {
		this.add_id = add_id;
	}
	
	public int getCust_id() {
		return cust_id;
	}

	public void setCust_id(int cust_id) {
		this.cust_id = cust_id;
	}
	
	public String getAdd_address() {
		return add_address;
	}

	public void setAdd_address(String add_address) {
		this.add_address = add_address;
	}
	
	public String getAdd_city() {
		return add_city;
	}

	public void setAdd_city(String add_city) {
		this.add_city = add_city;
	}
	
	public String getAdd_postcode() {
		return add_postcode;
	}

	public void setAdd_postcode(String add_postcode) {
		this.add_postcode = add_postcode;
	}
	
	public String getAdd_country() {
		return add_country;
	}

	public void setAdd_country(String add_country) {
		this.add_country = add_country;
	}
	
	public String getAdd_state() {
		return add_state;
	}

	public void setAdd_state(String add_state) {
		this.add_state = add_state;
	}
	
	public boolean isValid() {
		return valid;
	}

	public void setValid(boolean newValid) {
		valid = newValid;
	}
}
