package kr.co.mlec.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

public class HandlerMapping {
	
	private Map<String, Controller> mappings = null; 
	
	public HandlerMapping(String propLoc) {
		
		Properties prop = new Properties();
		mappings = new HashMap<>();
		
		try {
		
			InputStream is = new FileInputStream(propLoc);
			prop.load(is);
			
			
			Set<Object> keys = prop.keySet(); 
			for(Object key : keys) {
				String className = prop.getProperty(key.toString()); 
				System.out.println(key + " : " + className);
				
				Class<?> clz = Class.forName(className);
				mappings.put(key.toString(), (Controller)clz.newInstance());
		
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public Controller getController(String uri) {
		return mappings.get(uri);
	}

	public static void main(String[] args) throws Exception {
		
	}

}

