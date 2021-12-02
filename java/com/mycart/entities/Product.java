package com.mycart.entities;

import javax.persistence.*;

@Entity
public class Product {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "product_ID")
	private int pID;
	@Column(name = "product_Name")
	private String pName;
	@Column(name = "product_Description" ,length = 3000)
	private String pDesc;
	@Column(name = "product_Photo")
	private String pPhoto;
	@Column(name = "product_Price")
	private double pPrice;
	@Column(name = "product_Discount")
	private double pDiscount;
	@Column(name = "product_Quantity")
	private int pQuantity;
	@ManyToOne
	private Category category;
	
	
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}



	public Product(int pID, String pName, String pDesc, String pPhoto, double pPrice, double pDiscount, int pQuantity,
			Category category) {
		super();
		this.pID = pID;
		this.pName = pName;
		this.pDesc = pDesc;
		this.pPhoto = pPhoto;
		this.pPrice = pPrice;
		this.pDiscount = pDiscount;
		this.pQuantity = pQuantity;
		this.category = category;
	}



	public Product(String pName, String pDesc, String pPhoto, double pPrice, double pDiscount, int pQuantity,
			Category category) {
		super();
		this.pName = pName;
		this.pDesc = pDesc;
		this.pPhoto = pPhoto;
		this.pPrice = pPrice;
		this.pDiscount = pDiscount;
		this.pQuantity = pQuantity;
		this.category = category;
	}



	public int getpID() {
		return pID;
	}
	public void setpID(int pID) {
		this.pID = pID;
	}



	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}



	public String getpDesc() {
		return pDesc;
	}
	public void setpDesc(String pDesc) {
		this.pDesc = pDesc;
	}



	public String getpPhoto() {
		return pPhoto;
	}
	public void setpPhoto(String pPhoto) {
		this.pPhoto = pPhoto;
	}



	public double getpPrice() {
		return pPrice;
	}
	public void setpPrice(double pPrice) {
		this.pPrice = pPrice;
	}



	public double getpDiscount() {
		return pDiscount;
	}
	public void setpDiscount(double pDiscount) {
		this.pDiscount = pDiscount;
	}



	public int getpQuantity() {
		return pQuantity;
	}
	public void setpQuantity(int pQuantity) {
		this.pQuantity = pQuantity;
	}



	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}



	@Override
	public String toString() {
		return "Category [pID=" + pID + ", pName=" + pName + ", pDesc=" + pDesc + ", pPhoto=" + pPhoto + ", pPrice="
				+ pPrice + ", pDiscount=" + pDiscount + ", pQuantity=" + pQuantity + ", category=" + category + "]";
	}

	
	//calculate price after discount
	
	public int priceAfterDiscount() {
		int d= (int) ((this.getpDiscount()/100.0)*this.getpPrice());
		return (int) (this.getpPrice()-d);
	}
	
	
}
