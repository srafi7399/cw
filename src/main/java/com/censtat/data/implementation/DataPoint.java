package com.censtat.data.implementation;

import com.censtat.data.interfaces.DataPointInterface;
import com.censtat.data.interfaces.WOWOInterface;
/**
 * 
 * @author Rafi Shaik
 *
 */
public class DataPoint implements DataPointInterface,WOWOInterface{
	
	private String name ="";
	private Object value ="";
	private boolean isEnabled = true;
	
	
	public DataPoint()
	{
		
	}
	
	@Override
	public String getName() {
		return this.name;
	}

	@Override
	public Object getValue() {		
		return this.value;
	}

	@Override
	public void setName(String name) {
		this.name=name;
	}

	@Override
	public void setValue(Object value) {
		this.value=value;
	}

	@Override
	public void setDescription(String description) {
		// TODO Auto-generated method stub

	}

	@Override
	public String getDescription() {
		// TODO Auto-generated method stub
		return null;
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
