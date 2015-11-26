package com.censtat.data.interfaces;

import java.util.ArrayList;
import java.util.Map;
/**
 * 
 * @author Rafi Shaik
 *
 */
public interface DataInfoInterface {

	/**
	 * 
	 * @return
	 */
	public Map<String, Integer> getNumberOfDataEntitiesByAllTypes();

	/**
	 * 
	 * @param dataEntityType
	 * @return
	 */
	public Integer getNumberOfDataEntitiesByType(
			DataEntityTypeInterface dataEntityType);

	/**
	 * 
	 * @param DataEntity
	 * @return
	 */
	public Map<String, Integer> getNumberOfDataEntitiesByTypeFor(
			DataEntityInterface dataEntity);

	/**
	 * 
	 * @param dataEntityType
	 * @return
	 */
	public ArrayList<DataEntityInterface> getAllDataEntitiesByType(
			DataEntityTypeInterface dataEntityType);

	/**
	 * 
	 * @param dataEntity
	 * @return
	 */
	public ArrayList<DataEntityInterface> getAllDataEntitiesForDataEntity(
			DataEntityInterface dataEntity);

	/**
	 * 
	 * @param dataEntity
	 * @param dataEntityType
	 * @return
	 */
	public ArrayList<DataEntityInterface> getAllDataEntitiesByTypeForDataEntity(
			DataEntityInterface dataEntity,
			DataEntityTypeInterface dataEntityType);

}
