package com.censtat.data.interfaces;

import java.util.ArrayList;
/**
 * 
 * @author Rafi Shaik
 *
 */
public interface CompositeDataPointInterface extends DataPointInterface {
	
	/**
	 * 
	 * @return
	 */
	public ArrayList<DataFragmentInterface> getAllDataFragments();
	/**
	 * 
	 * @param dataFragment
	 */
	public void addDataFragment(DataFragmentInterface dataFragment);
	/**
	 * 
	 * @param dataFragment
	 */
	public void disableDataFragment(DataFragmentInterface dataFragment);
	/**
	 * 
	 * @return
	 */
	public boolean enableAllDataFragments();	
	/**
	 * 
	 * @return
	 */
	public boolean disableAllDataFragements();	
	/**
	 * 
	 * @param isCOmplete
	 */
	public void setIsComplete(boolean isCOmplete);
	/**
	 * 
	 * @return
	 */
	public boolean isComplete();

}
