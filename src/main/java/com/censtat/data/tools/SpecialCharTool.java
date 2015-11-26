package com.censtat.data.tools;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Iterator;
import java.util.StringTokenizer;

import com.censtat.data.implementation.DataEntity;
import com.census.db.main.MongoApp;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.util.JSON;

public class SpecialCharTool {

	public static String cleanAndReturn(String toClean) {
		if (toClean.endsWith("CDP")) {
			// CHOP CDP
			toClean = toClean.substring(0, toClean.indexOf("CDP"));

		}		
		String c = toClean.replaceAll("\\W", "");
		return c;
	}
	
	public static String removeCDP(String toClean)
	{
		if (toClean.endsWith("CDP")) {
			// CHOP CDP
			toClean = toClean.substring(0, toClean.lastIndexOf("CDP"));
			toClean =toClean.trim();

		}	
		return toClean;
	}
	

	public static String getProperName(String entityName) {	
		if(entityName.contains("-"))
		{
			StringTokenizer hyphenChecker = new StringTokenizer(entityName,"-");
			entityName = getStringFromHyphen(hyphenChecker);
		}
		StringTokenizer tokens = new StringTokenizer(entityName);
		String newString = "";
		if (tokens.countTokens() == 1) {
			return entityName;

		} else {
			while (tokens.hasMoreElements()) {
				String toCleanToken = tokens.nextToken();
				//check if Token has hyphen
				StringTokenizer hyphenChecker = new StringTokenizer(toCleanToken,"-");
				if(hyphenChecker.countTokens()>1)
				{
					System.out.println("We have Some cleanup to do");
					toCleanToken=getStringFromHyphen(hyphenChecker);
				}
				String cleaned = "";
				if(toCleanToken.equals("-"))
				{
					newString = newString.concat("_");	
				}
				else
				{
					cleaned = SpecialCharTool.cleanAndReturn(toCleanToken);
					newString = newString.concat(cleaned);
				}		
						
				if (tokens.hasMoreElements()) {
					newString = newString.concat("_");
				}

			}
		}
		if(newString.endsWith("_"))
		{
			newString = newString.substring(0, newString.lastIndexOf("_"));
		}
		return newString.trim();
	}
	
	public static String getStringFromHyphen(StringTokenizer tokens)
	{
		String newString = "";
		while(tokens.hasMoreTokens())
		{
			String toClean = tokens.nextToken();
			newString = newString.concat(cleanAndReturn(toClean));
			newString=newString.concat("_");
			
		}
		if(newString.endsWith("_"))
		{
			newString = newString.substring(0, newString.lastIndexOf("_"));
		}
		return newString;
	}
	
	public static void doTest()
	{
		GsonBuilder builder = new GsonBuilder();
		Gson gson = builder.create();
		FileWriter writer = null;
		MongoApp app = new MongoApp();
		try {
			app.createConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			writer = new FileWriter(new File("Names.txt"));

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		DBCollection coll = MongoApp.db.getCollection("DataEntity");
		DBCursor cursor = coll.find();
		Iterator<DBObject> dbIter = cursor.iterator();
		while (dbIter.hasNext()) {
			BasicDBObject o = (BasicDBObject) dbIter.next();
			DataEntity entity = gson.fromJson(JSON.serialize(o),
					DataEntity.class);
			String newName = SpecialCharTool.getProperName(entity.getName());
			System.out.println(newName);
			try {
				writer.write(newName + "   State->"+ entity.getState() +"   Type---->"+ entity.getDataEntityType()+ "   Fip--"+entity.getFipCode());
				writer.write("\n");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		try {
			writer.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static void main(String[] args) {
		
		//SpecialCharTool.doTest();
		String s = SpecialCharTool.getProperName("East Hartford CDP");
		System.out.println(s);
	}
	}
		



