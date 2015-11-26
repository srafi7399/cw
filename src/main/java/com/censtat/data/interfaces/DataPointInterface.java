package com.censtat.data.interfaces;
/**
 * 
 * @author Rafi Shaik
 *
 */
public interface DataPointInterface {

	/**
	 * 
	 * @return
	 */
	public String getName();
	/**
	 * 
	 * @return
	 */
	public Object getValue();
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
	 * @param description
	 */
	public void setDescription(String description);
	/**
	 * 
	 * @return
	 */
	public String getDescription();
	


}
