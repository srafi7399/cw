package com.censtat.data.interfaces;

import java.util.ArrayList;
/**
 * 
 * @author Rafi Shaik
 *
 */
public interface DataModuleInterface {
	/**
	 * 
	 * @return
	 */
	public String getDataModuleName();
	
	
	/**
	 * 
	 * @param moduleName
	 */
	public void setDataModuleName(String moduleName);
	/**
	 * 
	 * @return
	 */
	public int getDataModuleType();
	/**
	 * 
	 * @param dataPoint
	 */
	public void addDataPoint(DataPointInterface dataPoint);
	/**
	 * 
	 * @param dataPoint
	 * @return
	 */
	public boolean removeDataPoint(DataPointInterface dataPoint);
	/**
	 * 
	 * @return
	 */
	public ArrayList<DataPointInterface> getAllDataPoints();
	/**
	 * 
	 * @param dataPoint
	 * @return
	 */
	public boolean disableDataPoint(DataPointInterface dataPoint);
	/**
	 * 
	 * @param dataPoint
	 * @return
	 */
	public boolean enableDataPoint(DataPointInterface dataPoint);
	/**
	 * 
	 * @param description
	 */
	public void setModuleDescription(String description);
	/**
	 * 
	 * @return
	 */
	public String getModuleDescription();
	

}
