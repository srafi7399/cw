package com.censtat.ui.charts;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;

import com.censtat.data.implementation.CompositeDataPoint;
import com.censtat.data.implementation.DataEntity;
import com.censtat.data.implementation.DataFragment;
import com.censtat.data.implementation.DataModule;
import com.censtat.data.implementation.DataPoint;

/**
 * 
 * @author Rafi Shaik
 *
 */
public class BasicPieChartBuilder {
	
	protected DataEntity dataEntity = null;
	
	public DataEntity getDataEntity() {
		return dataEntity;
	}

	public void setDataEntity(DataEntity dataEntity) {
		this.dataEntity = dataEntity;
	}

	/**
	 * 
	 */
	public BasicPieChartBuilder()
	{
		
	}
	/**
	 * 
	 * @param entity
	 * @param chartId, chartID is the Composite Data Fragment Key
	 * @return
	 */
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
	
	
	protected void customizeChart(String chartId,CenPieChart chart)
	{
		if((chartId.equals("name_male_female_percentage")) 
				|| (chartId.equals("name_18_years_and_over_cdp")) 
				|| (chartId.equals("name_maritial_status_male"))
				|| (chartId.equals("name_maritial_status_female"))
				|| (chartId.equals("name_65_years_and_over_cdp"))
				|| (chartId.equals("name_school_enrollment_by_grade"))
				|| (chartId.equals("name_educational_attainment_levels"))
				|| (chartId.equals("name_natural_us_citizen_vs_not_a_us_citizen"))
				|| (chartId.equals("name_relationship_by_type"))
				|| (chartId.equals("name_foreign_born_population_regions"))
				|| (chartId.equals("name_fam_vs_nonfam_hos"))
				|| (chartId.equals("name_nat_vs_foreign"))
				|| (chartId.equals("name_lang_spoken_at_home_bdown")))
		{
			//No data Labels and also we need Legend
			chart.plotOptions.setShowInLegend(true);
			chart.plotOptions.getDataLabels().put("enabled", false);			
		}
		else if((chartId.equals("name_age_distribution")))
		{
			//No need of Legend but need Data Labels.
			chart.plotOptions.setShowInLegend(false);
		}
		
	}
	
	

}
