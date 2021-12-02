package com.mycart.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.mycart.entities.Product;

public class ProductDao {

	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	public boolean saveProduct(Product product) {
		boolean f = false;

		try {

			Session session = this.factory.openSession();
			Transaction tx = session.beginTransaction();

			session.save(product);

			tx.commit();
			session.close();
			f = true;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			f = false;
		}
		return f;
	}

	// get all product
	public List<Product> getAllProducts() {

		Session session = this.factory.openSession();
		Query query = session.createQuery("from Product");
		List<Product> list = query.list();

		return list;
	}
	
	//products of given category
	
	  public List<Product> getAllProductsByID(int cat_ID) {
	  
	 Session session = this.factory.openSession(); Query query =
	  session.createQuery("from Product as p where p.category.categoryID =: id");
	  query.setParameter("id", cat_ID); List<Product> list = query.list();
	  
	  return list; }
	 

}
