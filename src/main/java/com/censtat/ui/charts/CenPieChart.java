package com.censtat.ui.charts;

import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map.Entry;

import com.censtat.data.implementation.DataEntity;
import com.census.db.main.MongoApp;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.util.JSON;

/**
 * 
 * @author Rafi Shaik
 *
 */
public class CenPieChart {

	 String chartTitle = "";
	 String chartToolTip = "";
	 CenPieChartSeries series = new CenPieChartSeries();
	 CenPiePlotOptions plotOptions = new CenPiePlotOptions();
	 
	 public CenPieChart()
	 {
		 
	 }

	public String getChartToolTip() {
		return chartToolTip;
	}

	public void setChartToolTip(String chartToolTip) {
		this.chartToolTip = chartToolTip;
	}

	public String getChartTitle() {
		return chartTitle;
	}

	public void setChartTitle(String chartTitle) {
		this.chartTitle = chartTitle;
	}
	
	class CenPiePlotOptions {
		boolean allowedPointSelect = false;
		String cursor = "";
		boolean showInLegend = false;
		HashMap<String,Boolean> dataLabels = new HashMap<String,Boolean>();	
		
		
		public CenPiePlotOptions()
		{
			dataLabels.put("enabled", true);
			this.setDataLabels(dataLabels);
		}
		
		public boolean isAllowedPointSelect() {
			return allowedPointSelect;
		}
		public void setAllowedPointSelect(boolean allowedPointSelect) {
			this.allowedPointSelect = allowedPointSelect;
		}
		public String getCursor() {
			return cursor;
		}
		public void setCursor(String cursor) {
			this.cursor = cursor;
		}
		public boolean isShowInLegend() {
			return showInLegend;
		}
		public void setShowInLegend(boolean showInLegend) {
			this.showInLegend = showInLegend;
		}
		public HashMap<String, Boolean> getDataLabels() {
			return dataLabels;
		}
		public void setDataLabels(HashMap<String, Boolean> dataLabels) {
			this.dataLabels = dataLabels;
		}			

	}
	

	class CenPieChartSeries {
		String type = "pie";
		String name = "";
		Object[][] data = {};
		
		
		public CenPieChartSeries()
		{
			
		}

		public String getType() {
			return type;
		}

		public void setType(String type) {
			this.type = type;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		
		
		

		public void setData(ArrayList<LinkedHashMap<String, Double>> dataHolder) {
			LinkedHashMap<String, Double> rowValue = dataHolder.get(0);
			rowValue.size();
			Object[][] _data = new Object[rowValue.size()][];
			Iterator<Entry<String, Double>> iterArray = rowValue.entrySet().iterator();
			int i = 0;
			while (iterArray.hasNext()) {
				Entry<String, Double> entry = iterArray.next();
				_data[i] = new Object[] { entry.getKey(), entry.getValue() };
				i++;
			}
			this.data = _data;
		}
	}
	
	public static void main(String[] args)
	{
		GsonBuilder builder = new GsonBuilder();
		Gson gson = builder.create();
		MongoApp app = new MongoApp();
		try {
			app.createConnection();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBCollection coll = app.db.getCollection("DataEntity");
		DBCursor cursor = coll.find().limit(1);
		Iterator<DBObject> dbIter = cursor.iterator();
		while(dbIter.hasNext())
		{
			BasicDBObject o = (BasicDBObject) dbIter.next();
			DataEntity entity = gson.fromJson(JSON.serialize(o),
					DataEntity.class);
			BasicPieChartBuilder asBuilder = new BasicPieChartBuilder();
			CenPieChart pieChart0 =asBuilder.getAgeSexPieChart(entity, "name_male_female_percentage");
			CenPieChart pieChart1 =asBuilder.getAgeSexPieChart(entity, "name_18_years_and_over_cdp");
			CenPieChart pieChart2 =asBuilder.getAgeSexPieChart(entity, "name_age_distribution");
			CenPieChart pieChart3 =asBuilder.getAgeSexPieChart(entity,"name_65_years_and_over_cdp");
			Object obj = JSON.parse(gson.toJson(pieChart1));
			Object obj2 = JSON.parse(gson.toJson(pieChart2));
			Object obj3 = JSON.parse(gson.toJson(pieChart0));
			Object obj4 = JSON.parse(gson.toJson(pieChart3));			
			System.out.println(obj.toString());
			System.out.println(obj2.toString());
			System.out.println(obj3.toString());
			System.out.println(obj4.toString());
			
		}
		
	
	}

}
