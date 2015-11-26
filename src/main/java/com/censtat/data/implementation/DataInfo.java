package com.censtat.data.implementation;

import java.util.ArrayList;
import java.util.Map;

import com.censtat.data.interfaces.DataEntityInterface;
import com.censtat.data.interfaces.DataEntityTypeInterface;
import com.censtat.data.interfaces.DataInfoInterface;
/**
 * 
 * @author Rafi Shaik
 *
 */
public class DataInfo implements DataInfoInterface {

	@Override
	public Map<String, Integer> getNumberOfDataEntitiesByAllTypes() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer getNumberOfDataEntitiesByType(
			DataEntityTypeInterface dataEntityType) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Integer> getNumberOfDataEntitiesByTypeFor(
			DataEntityInterface dataEntity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<DataEntityInterface> getAllDataEntitiesByType(
			DataEntityTypeInterface dataEntityType) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<DataEntityInterface> getAllDataEntitiesForDataEntity(
			DataEntityInterface dataEntity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<DataEntityInterface> getAllDataEntitiesByTypeForDataEntity(
			DataEntityInterface dataEntity,
			DataEntityTypeInterface dataEntityType) {
		// TODO Auto-generated method stub
		return null;
	}

}
