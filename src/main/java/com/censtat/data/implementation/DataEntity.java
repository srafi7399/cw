package com.censtat.data.implementation;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.censtat.data.interfaces.DataEntityInterface;
import com.censtat.data.interfaces.DataModuleInterface;
import com.censtat.data.interfaces.WOWOInterface;

/**
 * 
 * @author Rafi Shaik
 *
 */
public class DataEntity implements WOWOInterface {
	private String name = "";
	private String fipcode = "";
	private String state = "";
	private String type = "";
	private boolean isComponentEnabled = true;
	private HashMap<String, String> identifierKeys = null;
	private ArrayList<DataModule> datamodules = new ArrayList<DataModule>();

	public DataEntity() {

	}

	public ArrayList<DataModule> getAllDataModules() {
		return this.datamodules;
	}

	public int getNumberOfDataModules() {
		return datamodules.size();
	}

	public int getNumberOfEnabledDataModules() {
		return 0;
	}

	public int getNumberOfDisabledDataModules() {
		
		return 0;
	}

	public boolean disableDataModule(DataModule dataModule) {
		
		return false;
	}

	public boolean enableDataModule(DataModule dataModule) {
		
		return false;
	}

	public boolean enableAllDataModules() {
		
		return false;
	}

	public boolean disableAllDataModules() {
		
		return false;
	}

	public String getName() {

		return this.name;
	}

	public String getDataEntityType() {

		return this.type;
	}

	public void setDataEntityType(String type) {
		this.type = type;

	}

	public void setName(String name) {
		this.name = name;
	}

	public void addDataModule(DataModule dataModule) {
		this.datamodules.add(dataModule);

	}

	public void setFipCode(String fipCode) {
		this.fipcode = fipCode;

	}

	public String getFipCode() {
		return this.fipcode;
	}

	public void setState(String state) {
		this.state = state;

	}

	public String getState() {
		return this.state;
	}

	@Override
	public void enableComponent(boolean enable) {
		this.isComponentEnabled = enable;

	}

	@Override
	public boolean isComponentEnabled() {
		return this.isComponentEnabled;
	}

	public HashMap<String, String> getItentifierKeys() {
		return this.identifierKeys;
	}

	public void setIdentifierKeys(HashMap<String, String> map) {
		this.identifierKeys = map;

	}

}
