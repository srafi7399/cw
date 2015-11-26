package com.censtat.ui.charts;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;

import com.censtat.data.implementation.CompositeDataPoint;
import com.censtat.data.implementation.DataEntity;
import com.censtat.data.implementation.DataFragment;
import com.censtat.data.implementation.DataModule;
/**
 * 
 * @author Rafi Shaik
 *
 */
public class LanguagePieChartBuilder extends BasicPieChartBuilder {	
	
	
	public CenPieChart getAgeSexPieChart(DataEntity entity, String chartId)
	{
		this.dataEntity=entity;	
		//First Check if the Chart Key Value is the same as the Composite Data Point Name.
		if(entity.getItentifierKeys().containsKey(chartId))
		{
		//get the value
		String value = entity.getItentifierKeys().get(chartId);
		Iterator<DataModule> dataModuleIter = entity.getAllDataModules().iterator();
		while(dataModuleIter.hasNext())
		{
			DataModule module = dataModuleIter.next();
			Iterator<CompositeDataPoint> dataPointIter = module.getAllCompositeDataPoints().iterator();
			while(dataPointIter.hasNext())
			{
				CompositeDataPoint point =  dataPointIter.next();
				//if(point instanceof CompositeDataPoint)
				//{
					
					if(point.getName().equals(value))
					{
						CenPieChart chart = new CenPieChart();
						Iterator<DataFragment> fragmentIter = point.getAllDataFragments().iterator();
						ArrayList<LinkedHashMap<String,Double>> dataHolder = new ArrayList<LinkedHashMap<String,Double>>();
						LinkedHashMap<String,Double> rowHolderm = new LinkedHashMap<String,Double>();
						while(fragmentIter.hasNext())
						{
							DataFragment fragment = fragmentIter.next();
							if((fragment.getName().equals(entity.getItentifierKeys().get("name_english_only").toString())
							|| (fragment.getName().equals(entity.getItentifierKeys().get("name_lang_other_than_english").toString()))))
							try
							{
								rowHolderm.put(fragment.getName(), Double.valueOf(fragment.getValue().toString()));		
							}
							catch(Exception e)
							{
								System.out.println("!!!!!!!Exception occured......in Vistor-->"+entity.getName());
								System.out.println("!!!!!!!Exception occured......Chart IDr-->"+chartId);
								System.out.println("!!!!!!!Exception occured......Chart IDr-->"+fragment.getValue().toString());
							}
																	
						}
						dataHolder.add(rowHolderm);
						chart.setChartTitle(point.getName());	
						chart.series.setName(point.getName());
						chart.series.setData(dataHolder);	
						customizeChart(chartId,chart);
						return chart;
					}
				//}
			}
		}
		
		
			
		}
		//For Title make sure you set it out specifically
		//For the Elements just iterate
		
		return null;
	}

}
