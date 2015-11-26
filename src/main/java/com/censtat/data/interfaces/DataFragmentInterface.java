package com.censtat.data.interfaces;
/**
 * 
 * @author Rafi Shaik
 *
 */
public interface DataFragmentInterface {

	/**
	 * 
	 * @return
	 */
	public String getName();
	
	/**
	 * 
	 * @param name
	 */
	public void setName(String name);
	
	/**
	 * 
	 * @param value
	 */
	public void setValue(Object value);
	

	/**
	 * 
	 * @return
	 */
	public Object getValue();

	/**
	 * 
	 * @return
	 */
	public String getDescription();

	/**
	 * 
	 * @param desc
	 */
	public void setDescription(String desc);

	/**
	 * 
	 * @return
	 */
	public int getDataFragmentType();

	/**
	 * 
	 * @param type
	 */
	public void setDataFragmentType(int type);
	
	/**
	 * 
	 * @param datafragment
	 */
	public void addDataFragment(DataFragmentInterface datafragment);
	
	/**
	 * 
	 * @param datafragment
	 * @return
	 */
	public boolean removeDataFragment(DataFragmentInterface datafragment);

}
