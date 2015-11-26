package com.censtat.data.implementation;

import java.util.ArrayList;

import com.censtat.data.interfaces.DataFragmentInterface;
import com.censtat.data.interfaces.WOWOInterface;
/**
 * 
 * @author Rafi Shaik
 *
 */
public class DataFragment implements WOWOInterface {
	
	private String name = "";
	private Object value = "";
	private ArrayList<DataFragment> subdatafragements = new ArrayList<DataFragment>();
	
	public DataFragment()
	{
		
	}

	public String getName() {
	
		return this.name;
	}

	public Object getValue() {
		
		return this.value;
	}

	public String getDescription() {
		// TODO Auto-generated method stub
		return null;
	}

	public void setDescription(String desc) {
		// TODO Auto-generated method stub

	}

	public int getDataFragmentType() {
		// TODO Auto-generated method stub
		return 0;
	}

	public void setDataFragmentType(int type) {
		// TODO Auto-generated method stub

	}

	public void setName(String name) {
	this.name=name;
		
	}

	public void setValue(Object value) {
		this.value=value;
		
	}

	public void addDataFragment(DataFragment datafragment) {
		this.subdatafragements.add(datafragment);		
	}

	public boolean removeDataFragment(DataFragment datafragment) {		
		return this.subdatafragements.remove(datafragment);
	}

	@Override
	public void enableComponent(boolean enable) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean isComponentEnabled() {
		// TODO Auto-generated method stub
		return false;
	}

}
