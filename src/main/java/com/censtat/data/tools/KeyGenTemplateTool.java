package com.censtat.data.tools;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVRecord;

import com.github.mustachejava.DefaultMustacheFactory;
import com.github.mustachejava.Mustache;
import com.github.mustachejava.MustacheFactory;

/**
 * 
 * @author Rafi Shaik
 *
 */
public class KeyGenTemplateTool {
	

	private static KeyGenTemplateTool singleton = null;	
	private ArrayList<String> keys = new ArrayList<String>();

	private KeyGenTemplateTool() {
		
	}


	
	public void generateKeyFile(String[] filearray) {
		for (int i = 0; i < filearray.length; i++) {
			try {
				FileReader reader = new FileReader(filearray[i]);
				this.populateKeys(reader);
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		System.out.println("Keys -->"+keys.toString());

	}
	
	private void populateKeys(FileReader reader)
	{
		try {
			List<CSVRecord> records = CSVFormat.EXCEL
					.parse(reader).getRecords();
			List<CSVRecord> actualdatarecords = records.subList(1, records.size());
			Iterator<CSVRecord> recIter = actualdatarecords.iterator();
			while(recIter.hasNext()) {
				{
					String key = recIter.next().get(3);
					if(!key.equals("NONE"))
					{
						this.keys.add("name_"+key);
						this.keys.add("value_"+key);
					}
					
				}
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public void generateKeyFileUsingTemplate()
	{
		keyobject obj = new keyobject();
		obj.setkeys(this.keys);
		MustacheFactory mf = new DefaultMustacheFactory();
		Mustache mustache = mf.compile("templates/keygen.tmpl");		
		try {
			FileWriter keyFileWriter = new FileWriter("KeyFile.java");			
			mustache.execute(keyFileWriter, obj).flush();
			keyFileWriter.close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	
	public void generateKeyTemplateFile()
	{
		String methodSig = "public String ";
		String methodBrace = "()";
		String openBrace = "{";
		String ifcheck = "if (this.keyMap.get(\"";
		String ifCheckClose = "";
		String nullCheck = "!=null";
		String returnStat = "return this.keyMap.get(\"";
							
		String returnStatClose = "\").toString()";
		String semiColon = ";";
		String closeBrace = "}";
		FileWriter writer = null;
		try {
			 writer = new FileWriter(new File("KeyFile.java"));
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Object keys[] = this.keys.toArray();
		for(int i=0; i<keys.length; i++)
		{
			Object o = keys[i];
			StringBuffer sb = new StringBuffer();
			sb.append(methodSig).append(o.toString()).append(methodBrace).append(openBrace).
			
			append(returnStat).append(o.toString()).append(returnStatClose).append(semiColon).append(closeBrace);
			System.out.println("Generated Method"+sb.toString());
			try {
				writer.write(sb.toString());
				writer.write("\n");
				writer.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}
		
		
		
	}

	/**
	 * 
	 * @return
	 */
	public static KeyGenTemplateTool getInstance() {

		if (singleton != null) {
			return singleton;
		} else {
			if (singleton == null) {
				synchronized (KeyGenTemplateTool.class) {
					singleton = new KeyGenTemplateTool();
					return singleton;
				}
			}
		}
		return singleton;

	}
	
	class keyobject
	{
		private ArrayList<String> keys;
		int i=0;
		
		public String getkey()
		{	 			
			return keys.get(i);
		}
		
		public void updateindex()
		{
			i++;
		}
		
		ArrayList<String> keys()
		{
			return this.keys;
		}
		public keyobject()
		{
			
		}
		public void setkeys(ArrayList<String> k)
		{
			this.keys=k;
		}
	}
	public static void main(String[] args)
	{
		 String[] dataFiles = new String[]{"DemographyTemplate.csv","SocialTemplateFile.csv"};
		 KeyGenTemplateTool.getInstance().generateKeyFile(dataFiles);
		 KeyGenTemplateTool.getInstance().generateKeyFileUsingTemplate();
		// KeyGenTemplateTool.getInstance().generateKeyTemplateFile();
		 
	}

}
