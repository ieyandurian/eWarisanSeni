package com.eWarisanSeni.app.bean;

public class ProductBean {
	private int prod_ID, prod_Quantity;
	private double prod_Price;
	private String prod_Name, prod_Desc, prod_Size, prod_Type, prod_Image, prod_SearchName;
	private boolean valid;

	public int getProd_ID() {
		return prod_ID;
	}

	public void setProd_ID(int prod_ID) {
		this.prod_ID = prod_ID;
	}

	public String getProd_Name() {
		return prod_Name;
	}

	public void setProd_Name(String prod_Name) {
		this.prod_Name = prod_Name;
	}
	
	public String getProd_SearchName() {
		return prod_SearchName;
	}

	public void setProd_SearchName(String prod_SearchName) {
		this.prod_SearchName = prod_SearchName;
	}
	
	public String getProd_Desc() {
		return prod_Desc;
	}

	public void setProd_Desc(String prod_Desc) {
		this.prod_Desc = prod_Desc;
	}

	public int getProd_Quantity() {
		return prod_Quantity;
	}

	public void setProd_Quantity(int prod_Quantity) {
		this.prod_Quantity = prod_Quantity;
	}

	public double getProd_Price() {
		return prod_Price;
	}

	public void setProd_Price(double prod_Price) {
		this.prod_Price = prod_Price;
	}

	public String getProd_Size() {
		return prod_Size;
	}

	public void setProd_Size(String prod_Size) {
		this.prod_Size = prod_Size;
	}

	public String getProd_Type() {
		return prod_Type;
	}

	public void setProd_Type(String prod_Type) {
		this.prod_Type = prod_Type;
	}

	public String getProd_Image() {
		return prod_Image;
	}

	public void setProd_Image(String prod_Image) {
		this.prod_Image = prod_Image;
	}

	public boolean isValid() {
		return valid;
	}

	public void setValid(boolean newValid) {
		valid = newValid;
	}
}