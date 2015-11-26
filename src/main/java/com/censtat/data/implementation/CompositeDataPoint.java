package com.censtat.data.implementation;

import java.util.ArrayList;

import com.censtat.data.interfaces.CompositeDataPointInterface;
import com.censtat.data.interfaces.DataFragmentInterface;
import com.censtat.data.interfaces.WOWOInterface;

/**
 * 
 * @author Rafi Shaik
 *
 */
public class CompositeDataPoint extends DataPoint implements WOWOInterface {

	private ArrayList<DataFragment> datafragments = new ArrayList<DataFragment>();
	private boolean isComplete = true;

	public CompositeDataPoint() {

	}

	public ArrayList<DataFragment> getAllDataFragments() {
		return this.datafragments;
	}

	public void addDataFragment(DataFragment dataFragment) {
		this.datafragments.add(dataFragment);

	}

	public void disableDataFragment(DataFragment dataFragment) {
		dataFragment.enableComponent(false);

	}

	public boolean enableAllDataFragments() {
		return false;
	}

	public boolean disableAllDataFragements() {
		return false;
	}

	public void setIsComplete(boolean isComplete) {
		this.isComplete = isComplete;
	}

	public boolean isComplete() {
		return this.isComplete;
	}

}
