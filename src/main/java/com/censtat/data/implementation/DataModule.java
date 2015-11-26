package com.censtat.data.implementation;

import java.util.ArrayList;

import com.censtat.data.interfaces.CompositeDataPointInterface;
import com.censtat.data.interfaces.DataModuleInterface;
import com.censtat.data.interfaces.DataPointInterface;
import com.censtat.data.interfaces.WOWOInterface;
/**
 * 
 * @author Rafi Shaik
 *
 */
public class DataModule implements WOWOInterface {

	private String modulename = "";
	private boolean isEnabled = true;
	private ArrayList<DataPoint> datapoints = new ArrayList<DataPoint>();
	private ArrayList<CompositeDataPoint> compositedataPoints = new ArrayList<CompositeDataPoint>();

	
	public DataModule()
	{
		
	}
	public String getDataModuleName() {
		return this.modulename;
	}

	public int getDataModuleType() {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<DataPoint> getAllDataPoints() {
		return this.datapoints;
	}
	
	public ArrayList<CompositeDataPoint> getAllCompositeDataPoints()
	{
		return this.compositedataPoints;
	}

	public boolean disableDataPoint(DataPoint dataPoint) {
		return false;
	}

	public boolean enableDataPoint(DataPoint dataPoint) {
		return false;
	}

	public void setModuleDescription(String description) {

	}

	public String getModuleDescription() {
		return null;
	}

	

	public void setDataModuleName(String moduleName) {
		this.modulename = moduleName;

	}

	public void addDataPoint(DataPoint dataPoint) {
		if(dataPoint instanceof CompositeDataPoint)
		{
			this.compositedataPoints.add((CompositeDataPoint)dataPoint);
		}
		else if(dataPoint instanceof DataPointInterface)
		{
			this.datapoints.add(dataPoint);
		}
	

	}

	
	public boolean removeDataPoint(DataPoint dataPoint) {
		
		return this.datapoints.remove(dataPoint);
	}

	

	@Override
	public void enableComponent(boolean enable) {
		this.isEnabled=enable;
		
	}

	@Override
	public boolean isComponentEnabled() {		
		return this.isEnabled;
	}

}
