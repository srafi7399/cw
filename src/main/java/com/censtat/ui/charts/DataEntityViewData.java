package com.censtat.ui.charts;

import java.util.HashMap;

/**
 * 
 * @author Rafi Shaik
 *
 */
public class DataEntityViewData {
	
	private String fipCode = "";
	
	private HashMap<String,String> idToJsonMap = new HashMap<String,String>();
	
	public String getFipCode() {
		return fipCode;
	}


	public void setFipCode(String fipCode) {
		this.fipCode = fipCode;
	}


	public void registerJSON(String id,String json)
	{
		this.idToJsonMap.put(id, json);
	}

	public HashMap<String, String> getIdToJsonMap() {
		return idToJsonMap;
	}


	public void setIdToJsonMap(HashMap<String, String> idToJsonMap) {
		this.idToJsonMap = idToJsonMap;
	}


	
	
	
	public DataEntityViewData()
	{
		
	}
	
	
	

}
