package com.mycart.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.mycart.entities.Users;

public class UserDao {
	
	private SessionFactory factory;
	
	
	
	public UserDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}



	public Users getUserByEmailPassword(String email,String password) {
		
		Users users = null;
		
		
		
		try {
			
			String query = "from Users where user_Email =: em and user_Password =: ps";
			Session session = this.factory.openSession();
			Query q = session.createQuery(query);
			q.setParameter("em", email);
			q.setParameter("ps", password);
			
			users = (Users) q.uniqueResult();
			
			session.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return users;
		
	}
	
	
	
	

}
