package com.censtat.data.tools;

import java.io.FileWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

import com.censtat.data.implementation.DataEntity;
import com.censtat.data.implementation.DataModule;

/**
 * 
 * @author Rafi Shaik
 *
 */
public class DataModuleRef {
	private String race_module_key="name_race";
	private String age_sex_module_key = "name_sex_and_age";
	private String hispanic_latino_module_key = "name_hispanic_or_latino";
	private String marital_status_key = "name_maritial_status";
	private String scholl_enrollment_key = "name_school_enrollment";
	private String educational_attainment_key = "name_educational_attainment";
	private String relationship_key = "name_relationship";
	private String fertility_key = "name_fertitlity";
	private String grandparent_key = "name_garndparents";
	private String veterans_key = "name_veteran_status";
	private String computers_key = "name_cmp_and_internet_use";
	private String ancestry_key = "name_ancestry";
	private String citizenship_key = "name_us_citizenship_status";
	private String households_key = "name_hoshold_by_type";
	private String placeofbirth_key = "name_place_of_birth";
	private String language_key = "name_lang_spoken_at_home";
//	private String foreignborn_key = "name_foreigh_born_population_rob";
	
	HashMap<String,  ModuleVisitorInterface > moduleVisitorMap = new HashMap<String, ModuleVisitorInterface>();
	
	private static DataModuleRef singleton = null;
	
	private DataModuleRef()
	{
		init();
	}
	
	private void init()
	{
		moduleVisitorMap.put(race_module_key, new RaceModuleVisitor());
		moduleVisitorMap.put(age_sex_module_key, new AgeSexModuleVisitor());
		moduleVisitorMap.put(hispanic_latino_module_key, new HispanicModuleVisitor());		
		moduleVisitorMap.put(marital_status_key, new MaritialStatusVisitor());	
		moduleVisitorMap.put(scholl_enrollment_key, new SchoolEnrollmentVisitor());
		moduleVisitorMap.put(educational_attainment_key, new EducationalAttainmentVisitor());
		moduleVisitorMap.put(relationship_key, new RelationshipVisitor());
		moduleVisitorMap.put(fertility_key, new FertilityVisitor());
		moduleVisitorMap.put(grandparent_key, new GrandparentVisitor());
		moduleVisitorMap.put(veterans_key, new VeteransVisitor());
		moduleVisitorMap.put(computers_key, new ComputerVisitor());
		moduleVisitorMap.put(ancestry_key, new AncestryVisitor());
		moduleVisitorMap.put(citizenship_key, new CitizenshipVisitor());
		moduleVisitorMap.put(households_key, new HouseholdTypeVisitor());
		moduleVisitorMap.put(placeofbirth_key, new PlaceofBirthVisitor());
		moduleVisitorMap.put(language_key, new LanguageSpokenVisitor());
		
	//	moduleVisitorMap.put(foreignborn_key, new BirthRegionVisitor());
				
	}
	
	public static DataModuleRef getInstance()
	{
		if(singleton== null){
			synchronized(DataModuleRef.class)
			{
				if(singleton==null)
				{
					return new DataModuleRef();
				}
			}
		}
		return singleton;
		
	}
	
	/**
	 * 
	 * @param entity
	 * @param writer
	 * @return
	 */
	public FileWriter createModuleContent(DataEntity entity, FileWriter writer) {
		ModuleSectionsStartVisitor startSection = new ModuleSectionsStartVisitor();
		ModuleSectionStopVisitor stopSection = new ModuleSectionStopVisitor();
		InforBarVisitor infoBarVisitor = new InforBarVisitor();	
		infoBarVisitor.visit(entity, writer);
		startSection.visit(entity, writer);		
		ArrayList<DataModule> modules = entity.getAllDataModules();
		Iterator<DataModule> moduleIter = modules.iterator();
		while (moduleIter.hasNext()) {
			// Check if the name is the module has a key in the ModuleVisitorMap
			DataModule datamodule = moduleIter.next();
			Set<String> keyset = moduleVisitorMap.keySet();
			Iterator<String> keysetIter = keyset.iterator();
			while (keysetIter.hasNext()) {
				String key = keysetIter.next();
				if (entity.getItentifierKeys().containsKey(key)) {
					String name = entity.getItentifierKeys().get(key);
					if (name.equals(datamodule.getDataModuleName())) {
						// Voila we have a match!!
						// get the visitor
						ModuleVisitorInterface mvi = moduleVisitorMap.get(key);
						mvi.visit(entity, writer);
					}
				}
			}
		}
		stopSection.visit(entity, writer);
		return writer;
	}
}
