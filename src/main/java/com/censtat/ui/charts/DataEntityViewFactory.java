package com.censtat.ui.charts;

import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Iterator;

import com.census.db.main.MongoApp;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.util.JSON;
/**
 * 
 * @author Rafi Shaik
 *
 */
public class DataEntityViewFactory {
	
	private static DataEntityViewFactory singleton = null;
	private HashMap<String,DataEntityViewData> fipToViewMap = null;
	private MongoApp app = null;
	
	private DataEntityViewFactory()
	{
		fipToViewMap = new HashMap<String,DataEntityViewData>();
		initMongo();
	}
	
	private void initMongo()
	{
		 app = new MongoApp();
			try {
				app.createConnection();
			} catch (UnknownHostException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (MongoApp.db.collectionExists("DataEntityViewData")) {
				DBCollection collection = MongoApp.db.getCollection("DataEntityViewData");
				collection.drop();
				System.out.println("Sucessfully dropped the view collection");
			}
			MongoApp.db.createCollection("DataEntityViewData", null);
	}
	
	public void storeViewData()
	{
		DBCollection coll = MongoApp.db.getCollection("DataEntityViewData");
		Iterator<DataEntityViewData> dataIter = fipToViewMap.values().iterator();
		GsonBuilder builder = new GsonBuilder();
		Gson gson = builder.create();
		while(dataIter.hasNext())
		{
			
			Object o = JSON.parse(gson.toJson(dataIter.next()));
			//System.out.println("Insering --->"+o.toString());
			//gson.fromJson(json, typeOfT)
			BasicDBObject dbObj = (BasicDBObject) o;
			coll.insert(dbObj);
		}
	}
	
	/**
	 * 
	 * @return
	 */
	public static DataEntityViewFactory getInstance()
	{
		if(singleton!=null)
		{
			return singleton;
		}
		if(singleton== null)
		{
			synchronized(DataEntityViewFactory.class)
			{
				singleton = new DataEntityViewFactory();
				return singleton;
			}
		}
		return null;
	}
	/**
	 * 
	 * @param fipCode
	 * @param dataEntityViewData
	 */
	public void registerDataViewTofip(String fipCode, DataEntityViewData dataEntityViewData)
	{
		this.fipToViewMap.put(fipCode, dataEntityViewData);
	}
	
	/**
	 * 
	 * @param fipCode
	 * @return
	 */
	public DataEntityViewData getDataEntityViewData(String fipCode)
	{
		if(this.fipToViewMap!=null)
		{
			//Check if the key exists
			if(this.fipToViewMap.containsKey(fipCode))
			{
				return fipToViewMap.get(fipCode);
			}
		}
		return null;
	}
	

}
