package com.mycart.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;

@Entity
public class Category {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "cat_ID")
	private int categoryID;
	@Column(name = "cat_Title")
	private String categoryTitle;
	@Column(name = "cat_Description")
	private String categoryDescription;
	@OneToMany(mappedBy = "category")
	private List<Product> products = new ArrayList<Product>();
	
	
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Category(int categoryID, String categoryTitle, String categoryDescription, List<Product> products) {
		super();
		this.categoryID = categoryID;
		this.categoryTitle = categoryTitle;
		this.categoryDescription = categoryDescription;
		this.products = products;
	}


	public Category(String categoryTitle, String categoryDescription, List<Product> products) {
		super();
		this.categoryTitle = categoryTitle;
		this.categoryDescription = categoryDescription;
		this.products = products;
	}


	public int getCategoryID() {
		return categoryID;
	}
	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}


	public String getCategoryTitle() {
		return categoryTitle;
	}
	public void setCategoryTitle(String categoryTitle) {
		this.categoryTitle = categoryTitle;
	}


	public String getCategoryDescription() {
		return categoryDescription;
	}
	public void setCategoryDescription(String categoryDescription) {
		this.categoryDescription = categoryDescription;
	}


	public List<Product> getProducts() {
		return products;
	}
	public void setProducts(List<Product> products) {
		this.products = products;
	}


	@Override
	public String toString() {
		return "Category [categoryID=" + categoryID + ", categoryTitle=" + categoryTitle + ", categoryDescription="
				+ categoryDescription + ", products=" + products + "]";
	}
	
	
	

}
