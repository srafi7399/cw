package com.censtat.data.interfaces;

import java.util.ArrayList;
import java.util.Map;
/**
 * 
 * @author Rafi Shaik
 *
 */
public interface DataEntityInterface {
	
	
	/**
	 * A method to set the Identifier Keys
	 * @return Map, The map of all the keys for this DataEntity
	 */
	public Map<String,String> getItentifierKeys();
	/**
	 * A method to set the identifier keys for this DataEntity
	 * @param map
	 */
	public void setIdentifierKeys(Map<String,String> map);
	/**
	 * 
	 * @param fipCode
	 */
	public void setFipCode(String fipCode);
	/**
	 * 
	 * @return
	 */
	public String getFipCode();
	/**
	 * 
	 * @param state
	 */
	public void setState(String state);
	/**
	 * 
	 * @return
	 */
	public String getState();
	
	/**
	 * 
	 * @param name
	 */
	public void setName(String name);
	/**
	 * Name of the Data Entity
	 * @return
	 */
	public String getName();
	/**
	 * 
	 * @return
	 */
	public String getDataEntityType();
	/**
	 * 
	 * @param type
	 */
	public void setDataEntityType(String type);	
	/**
	 * 
	 * @return
	 */
	public ArrayList<DataModuleInterface> getAllDataModules();
	
	/**
	 * 
	 * @param dataModule
	 */
	public void addDataModule(DataModuleInterface dataModule);	
	/**
	 * 
	 * @return
	 */
	public int getNumberOfDataModules();
	/**
	 * 
	 * @return
	 */
	public int getNumberOfEnabledDataModules();
	/**
	 * 
	 * @return
	 */
	public int getNumberOfDisabledDataModules();
	/**
	 * 
	 * @param dataModule
	 * @return
	 */
	public boolean disableDataModule(DataModuleInterface dataModule);
	/**
	 * 
	 * @param dataModule
	 * @return
	 */
	public boolean enableDataModule(DataModuleInterface dataModule);
	/**
	 * 
	 * @return
	 */
	public boolean enableAllDataModules();
	/**
	 * 
	 * @return
	 */
	public boolean disableAllDataModules();
	
	
	

}
