package com.censtat.data.tools;

import java.io.FileWriter;
import com.censtat.data.implementation.DataEntity;
/**
 * 
 * @author Rafi Shaik
 *
 */
public interface ModuleVisitorInterface  {
	
	/**
	 * 
	 * @param entity
	 * @param writer
	 * @return
	 */
	public FileWriter visit(DataEntity entity, FileWriter writer);

}
