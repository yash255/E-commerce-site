package com.mycart.helper;

import java.util.HashMap;
import java.util.Map;
import java.*;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class Helper {
	public  static String get10words(String desc) {
		
		String[] strs = desc.split(" ");
		if(strs.length>10) {
			
			String result ="";
			for(int i=0;i<10;i++) {
				result=result+strs[i]+" ";
			}
			return(result+"...");
			
		}else {
			
			
			return (desc);
		}
	}
	public static Map<String, Long> getCounts(SessionFactory factory) {
		Session session = factory.openSession();
		
		String q1 = "Select count(*) from Users";
		String q2 = "Select count(*) from Product";
		
		Query query1 = session.createQuery(q1);
		Query query2 = session.createQuery(q2);
		
		Long userCount = (Long) query1.list().get(0);
		Long producCount =(Long) query2.list().get(0);
		
		Map<String, Long> map = new HashMap<String, Long>();
		map.put("userCount", userCount);
		map.put("productCount", producCount);
		
		session.close();
		
		return map;
		
	}

}
