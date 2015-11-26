package com.censtat.data.tools;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.net.UnknownHostException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import com.censtat.data.implementation.CompositeDataPoint;
import com.censtat.data.implementation.DataEntity;
import com.censtat.data.implementation.DataFragment;
import com.censtat.data.implementation.DataModule;
import com.censtat.data.implementation.DataPoint;
import com.censtat.data.interfaces.DataEntityTypeInterface;
import com.censtat.data.interfaces.DataFragmentInterface;
import com.census.db.main.MongoApp;
import com.google.gson.*;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.util.JSON;

import org.apache.commons.csv.*;

/**
 * 
 * @author Rafi Shaik
 *
 */

public class DataParserJSONObjectFactory {
	
	static MongoApp app = null;
	static {
		app = new MongoApp();
		try {
			app.createConnection();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}	
	//private HashMap<String,String> identifierKeys = new HashMap<String,String>();
	private HashMap<String,String> headerIdentifierMap = new HashMap<String,String>();
	private HashMap<String, String> annotationMap = null;
	private HashMap<String, String> propertydescMap = null;
	private HashMap<Integer, String> columnHeaderMap = null;
	private HashMap<String,DataEntity> jsonObjectKeyMap = new HashMap<String,DataEntity>();
	private HashMap<String,HashMap<String,String>> keyMaptoFipCode = new HashMap<String,HashMap<String,String>>();
	int matchingCount=0;
	int nonmatchingcount=0;
	GsonBuilder builder = new GsonBuilder();
	Gson gson = builder.create();
	
	//Demographic data files to parse
	private String[] dataFiles = new String[] { 			
			"PlacesDemoDataFile.csv", "CountyDemoDataFile.csv",
			"MetroDemoDataFile.csv", 
			"NationDemoDataFile.csv" ,"StatesDemoDataFile.csv"};
	//Social data files to parse
	private String[] socialdatafiles = new String[] {
			"SocialDataFileMetroPR.csv", "SocialDataFileMetro.csv",
			"SocialDataFilePlace.csv","SocialDataFileState.csv",
			"SocialDataFileCounty.csv" ,"SocialDataFileCountyPR.csv"

	};

	// All varibles for the Social data
	private HashMap<String, String> socialannotationmap = null;
	private HashMap<String, String> socialpropdescmap = null;
	private HashMap<Integer, String> socialcolheadermap = null;
	private HashMap<String,String> socialHeaderIdentifierMap = new HashMap<String,String>();
	FileWriter writer = null;
	File socialfile = new File("SocialData.txt");
	File demofile = new File("DemoData.txt");
	
	

	public DataParserJSONObjectFactory() {

	}

	public void parseAndLoadSocialDataFile() throws IOException {
		HashMap<String,String> identifierKeys = new HashMap<String,String>();
		socialfile.createNewFile();
		writer = new FileWriter(socialfile); 
		socialcolheadermap = new HashMap<Integer, String>();
		socialannotationmap = new HashMap<String, String>();
		socialpropdescmap = new HashMap<String, String>();
		
		FileReader socialtemplate = null;
		FileReader socialdatafile = null;
		
		try {
			socialtemplate = new FileReader("SocialTemplateFile.csv");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {
			// Parse the template file and load the template
			Iterable<CSVRecord> socialtemplaterecords = CSVFormat.EXCEL
					.parse(socialtemplate);
			for (CSVRecord templaterecord : socialtemplaterecords) {
				// Create an Map of Key/Annotation
				// Create a Map of Key/Property
				socialannotationmap.put(templaterecord.get(0),
						templaterecord.get(1));
				socialpropdescmap.put(templaterecord.get(0),
						templaterecord.get(2));
				if(templaterecord.get(3)!="NONE")
				{
					
					identifierKeys.put("name_"+templaterecord.get(3), templaterecord.get(2));
					this.socialHeaderIdentifierMap.put(templaterecord.get(0), templaterecord.get(3));
				}
				
			}

			for (int i = 0; i < socialdatafiles.length; i++) {
				socialdatafile = new FileReader(this.socialdatafiles[i]);
				List<CSVRecord> datarecords = CSVFormat.EXCEL.parse(
						socialdatafile).getRecords();

				if (this.socialcolheadermap.isEmpty()) {
					for (int m = 0; m < 1; m++) {
						CSVRecord header = datarecords.get(m);
						for (int n = 0; n < header.size(); n++) {
							socialcolheadermap.put(n, header.get(n));
							

						}
					}
				}
				// First Parse only the column header row.
				List<CSVRecord> actualdatarecords = datarecords.subList(1,
						datarecords.size());
				Iterator<CSVRecord> ariterator = actualdatarecords.iterator();
				while (ariterator.hasNext()) {
					CSVRecord actualrecord = ariterator.next();
					processEachSocialRecord(actualrecord,identifierKeys);
				}

			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		writer.close();

	}

	public void processEachSocialRecord(CSVRecord record, HashMap<String,String> idKeys) throws IOException {
		DataEntity entity = null;
		DataModule currentDataModule = null;
		CompositeDataPoint currentCompositeDataPoint = null;
		HashMap<String,String> idKeyes = null;
		
		DataFragment currentDataFragment = null;
		for (int i = 0; i < record.size(); i++) {
			// Get Value at each cell
			String value = record.get(i);
			// Get the header information
			String header = this.socialcolheadermap.get(i);

			// Get the Annotation
			if (this.socialannotationmap.containsKey(header)
					&& !(this.socialannotationmap.get(header).equals("NONE"))) {
				String annotation = this.socialannotationmap.get(header);
				String propname = this.socialpropdescmap.get(header);
				String idName = this.socialHeaderIdentifierMap.get(header);
			
				if(idKeyes!=null)
				{
					idKeyes.put("value_"+idName, value);
				}
				if (annotation.equals("CREATE_ENTITY")) {
					//entity = new DataEntity();
					//entity.setName(value);

				} else if (annotation.equals("SET_FIP")) {					
						if(this.jsonObjectKeyMap.containsKey(value))
						{
							entity = this.jsonObjectKeyMap.get(value);	
							idKeyes = this.keyMaptoFipCode.get(value);
							idKeyes.put("value_"+idName, value);
							//now populate idKeys too
							idKeyes.putAll(idKeys);
							
							
						}
						else
						{
							++this.nonmatchingcount;
							System.out.println("Non Matching count is --->"+nonmatchingcount);
							System.out.println("Non Matching name --->"+entity.getName());
							System.out.println("Non Matching fip --->"+entity.getFipCode());
						}
						//entity.setFipCode(value);				
						
					
				}

				else if (annotation.equals("SET_TYPE")) {
					if (entity != null) {
						if (value.equals("County")) {
							entity.setDataEntityType(DataEntityTypeInterface.COUNTY_TYPE);
						} else if (value.equals("City")) {
							entity.setDataEntityType(DataEntityTypeInterface.CITY_TYPE);
						} else if (value.equals("State")) {
							entity.setDataEntityType(DataEntityTypeInterface.STATE_TYPE);
						} else if (value.equals("Metro")) {
							entity.setDataEntityType(DataEntityTypeInterface.METRO_TYPE);
						} else if (value.equals("Micro")) {
							entity.setDataEntityType(DataEntityTypeInterface.MICRO_TYPE);
						} else if (value.equals("Nation")) {
							entity.setDataEntityType(DataEntityTypeInterface.NATION_TYPE);
						}
					}
				}

				else if (annotation.equals("SET_STATE")) {
					if (entity != null) {
						entity.setState(value);
					}
				} else if (annotation.equals("CREATE_DATA_MODULE")) {
					if (entity != null) {
						currentDataModule = new DataModule();
						currentDataModule.setDataModuleName(propname);
						entity.addDataModule(currentDataModule);
					}
				} else if (annotation.equals("CREATE_DATA_POINT")) {
					if (entity != null && currentDataModule != null) {
						DataPoint point = new DataPoint();
						point.setName(propname);
						point.setValue(value);
						currentDataModule.addDataPoint(point);
					}
				} else if (annotation.equals("CREATE_COMPOSITE_DATA_POINT")) {
					if (entity != null) {
						currentCompositeDataPoint = new CompositeDataPoint();
						currentCompositeDataPoint.setName(propname);
						currentCompositeDataPoint.setValue(value);
						currentDataModule
								.addDataPoint(currentCompositeDataPoint);

					}

				} else if (annotation.equals("CREATE_DATA_FRAGMENT")) {
					if (entity != null && currentCompositeDataPoint != null) {
						currentDataFragment = new DataFragment();
						currentDataFragment.setName(propname);
						currentDataFragment.setValue(value);
						currentCompositeDataPoint
								.addDataFragment(currentDataFragment);
					}

				}

				else if (annotation.equals("CREATE_SUBDATA_FRAGMENT")) {
					if (entity != null && currentDataFragment != null) {
						DataFragment subdatafragment = new DataFragment();
						subdatafragment.setName(propname);
						subdatafragment.setValue(value);
						currentDataFragment.addDataFragment(subdatafragment);

					}

				}

			}

		}	
	//	System.out.println(gson.toJson(entity));
	
		
	}

	public void parseandLoadDemographyDataFiles() throws IOException {
		HashMap<String,String> identifierKeys = new HashMap<String,String>();
		columnHeaderMap = new HashMap<Integer, String>();
		annotationMap = new HashMap<String, String>();
		propertydescMap = new HashMap<String, String>();
		FileReader template = null;
		FileReader datafile = null;
	//	this.demofile.createNewFile();
	//	writer = new FileWriter(demofile); 
		
		try {
			template = new FileReader("DemographyTemplate.csv");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {
			// Parse the template file and load the template
			Iterable<CSVRecord> templaterecords = CSVFormat.EXCEL
					.parse(template);
			for (CSVRecord templaterecord : templaterecords) {
				// Create an Map of Key/Annotation
				// Create a Map of Key/Property
				annotationMap.put(templaterecord.get(0), templaterecord.get(1));
				propertydescMap.put(templaterecord.get(0),
						templaterecord.get(2));				
				if(templaterecord.get(3)!="NONE")
				{
					identifierKeys.put("name_"+templaterecord.get(3), templaterecord.get(2));
					this.headerIdentifierMap.put(templaterecord.get(0), templaterecord.get(3));
				}

			}
			for (int k = 0; k < this.dataFiles.length; k++) {
				try {
					datafile = new FileReader(dataFiles[k]);
					List<CSVRecord> datarecords = CSVFormat.EXCEL.parse(
							datafile).getRecords();
					// First Parse only the column header row.
					//if (this.columnHeaderMap.isEmpty()) {
						for (int i = 0; i < 1; i++) {
							CSVRecord header = datarecords.get(i);
							for (int j = 0; j < header.size(); j++) {
								columnHeaderMap.put(j, header.get(j));

							}
						}
					//}

					List<CSVRecord> actualdatarecords = datarecords.subList(1,
							datarecords.size());
					Iterator<CSVRecord> ariterator = actualdatarecords
							.iterator();
					while (ariterator.hasNext()) {
						CSVRecord actualrecord = ariterator.next();
						processDemographyDataRecord(actualrecord,identifierKeys);
					}

				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			// Now Parse the Data File
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//writer.close();

	}
	
	public void createDBCollection() {
		try {
			app.createConnection();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (MongoApp.db.collectionExists("DataEntity")) {
			DBCollection collection = MongoApp.db.getCollection("DataEntity");
			collection.drop();
			System.out.println("Sucessfully dropped the view collection");
		}
		MongoApp.db.createCollection("DataEntity", null);
	}

	private void processDemographyDataRecord(CSVRecord record, HashMap<String,String> identifierKeys) throws IOException {	
		
		HashMap<String,String> actualKeys = new HashMap<String,String>();
		actualKeys.putAll(identifierKeys);////PROBLEM
		DataEntity entity = null;
		DataModule currentDataModule = null;
		CompositeDataPoint currentCompositeDataPoint = null;
		DataFragment currentDataFragment = null;
		for (int i = 0; i < record.size(); i++) {
			// Get Value at each cell
			String value = record.get(i);
			// Get the header information
			String header = this.columnHeaderMap.get(i);		

			// Get the Annotation
			if (this.annotationMap.containsKey(header)
					&& !(this.annotationMap.get(header).equals("NONE"))) {
				String annotation = this.annotationMap.get(header);
				String propname = this.propertydescMap.get(header);
				String idName = this.headerIdentifierMap.get(header);
				actualKeys.put("value_"+idName, value);

				if (annotation.equals("CREATE_ENTITY")) {
					entity = new DataEntity();
					entity.setName(SpecialCharTool.removeCDP(value));
					entity.setIdentifierKeys(actualKeys);

				} else if (annotation.equals("SET_FIP")) {
					if (entity != null) {
						entity.setFipCode(value);	
						this.jsonObjectKeyMap.put(value, entity);
						this.keyMaptoFipCode.put(value, actualKeys);
					}
					
				}
 else if (annotation.equals("SET_TYPE")) {
					if (entity != null) {
						if (value.equals("County")) {
							entity.setDataEntityType(DataEntityTypeInterface.COUNTY_TYPE);
						} else if (value.equals("City")) {
							entity.setDataEntityType(DataEntityTypeInterface.CITY_TYPE);
						} else if (value.equals("State")) {
							entity.setDataEntityType(DataEntityTypeInterface.STATE_TYPE);
						} else if (value.equals("Metro")) {
							entity.setDataEntityType(DataEntityTypeInterface.METRO_TYPE);
						} else if (value.equals("Micro")) {
							entity.setDataEntityType(DataEntityTypeInterface.MICRO_TYPE);
						} else if (value.equals("Nation")) {
							entity.setDataEntityType(DataEntityTypeInterface.NATION_TYPE);
						}

					}
				}

				else if (annotation.equals("SET_STATE")) {
					if (entity != null) {
						entity.setState(value);
					}
				} else if (annotation.equals("CREATE_DATA_MODULE")) {
					if (entity != null) {
						currentDataModule = new DataModule();
						currentDataModule.setDataModuleName(propname);
						entity.addDataModule(currentDataModule);
					}
				} else if (annotation.equals("CREATE_DATA_POINT")) {
					if (entity != null && currentDataModule != null) {
						DataPoint point = new DataPoint();
						point.setName(propname);
						point.setValue(value);
						currentDataModule.addDataPoint(point);
					}
				} else if (annotation.equals("CREATE_COMPOSITE_DATA_POINT")) {
					if (entity != null) {
						currentCompositeDataPoint = new CompositeDataPoint();
						currentCompositeDataPoint.setName(propname);
						currentCompositeDataPoint.setValue(value);
						currentDataModule
								.addDataPoint(currentCompositeDataPoint);

					}

				} else if (annotation.equals("CREATE_DATA_FRAGMENT")) {
					if (entity != null && currentCompositeDataPoint != null) {
						currentDataFragment = new DataFragment();
						currentDataFragment.setName(propname);
						currentDataFragment.setValue(value);
						currentCompositeDataPoint
								.addDataFragment(currentDataFragment);
					}

				}
				
				else if (annotation.equals("CREATE_SUBDATA_FRAGMENT")) {
					if (entity != null && currentDataFragment != null) {
						DataFragment subdatafragment = new DataFragment();
						subdatafragment.setName(propname);
						subdatafragment.setValue(value);
						currentDataFragment.addDataFragment(subdatafragment);

					}

				}


			}

		}

		
	/*	writer.write((gson.toJson(entity))+"\n");
		writer.write("-------------------------------------------------------------------------------------------------------------");
		writer.write("\n");
		writer.flush();*/
		
	}
	
	public void populateDBCollection()
	{
		//First get the json object map.
		Collection<DataEntity> collection = this.jsonObjectKeyMap.values();
		DBCollection coll = MongoApp.db.getCollection("DataEntity");
		Iterator<DataEntity> dIter = collection.iterator();
		while(dIter.hasNext())
		{		
			Object o = JSON.parse(gson.toJson(dIter.next()));
			//gson.fromJson(json, typeOfT)
			BasicDBObject dbObj = (BasicDBObject) o;
			coll.insert(dbObj);
		}
	}

	public static void main(String[] args) {
		DataParserJSONObjectFactory factory = new DataParserJSONObjectFactory();
		try {			
			factory.parseandLoadDemographyDataFiles();
			factory.parseAndLoadSocialDataFile();
			factory.createDBCollection();
			factory.populateDBCollection();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}

}
