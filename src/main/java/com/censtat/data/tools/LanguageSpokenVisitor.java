package com.censtat.data.tools;

import java.io.FileWriter;

import com.censtat.data.implementation.DataEntity;
import com.censtat.ui.charts.BasicPieChartBuilder;
import com.censtat.ui.charts.CenPieChart;
import com.censtat.ui.charts.DataEntityViewData;
import com.censtat.ui.charts.DataEntityViewFactory;
import com.censtat.ui.charts.LanguagePieChartBuilder;
import com.github.mustachejava.DefaultMustacheFactory;
import com.github.mustachejava.Mustache;
import com.github.mustachejava.MustacheFactory;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.mongodb.util.JSON;

public class LanguageSpokenVisitor implements ModuleVisitorInterface {

	private KeyGenTemplateFile template = new KeyGenTemplateFile();
	GsonBuilder builder = new GsonBuilder();
	Gson gson = builder.create();

	@Override
	public FileWriter visit(DataEntity entity, FileWriter writer) {
		template.setKeyMap(entity.getItentifierKeys());
		MustacheFactory mf = new DefaultMustacheFactory();
		Mustache mustache = mf.compile("templates/language.tmpl");
		mustache.execute(writer, template);		
		buildandStoreGUICharts(entity);
		return writer;
	}

	private void buildandStoreGUICharts(DataEntity entity) {
		LanguagePieChartBuilder asBuilder = new LanguagePieChartBuilder();
		CenPieChart pieChart0 = asBuilder.getAgeSexPieChart(entity,
				"name_lang_spoken_at_home_bdown");		
		storeTheCharts(pieChart0, entity,"name_lang_spoken_at_home_bdown");
		
	}

	/**
	 * 
	 * @param chart
	 * @param entity
	 */
	private void storeTheCharts(CenPieChart chart, DataEntity entity,String id) {
		// Check if a DataEntityViewData Object exists.
		DataEntityViewData viewData = null;
		viewData=DataEntityViewFactory.getInstance().getDataEntityViewData(
				entity.getFipCode());
		if (viewData == null) {			
			viewData = new DataEntityViewData();
			viewData.setFipCode(entity.getFipCode());
			DataEntityViewFactory.getInstance().registerDataViewTofip(
					entity.getFipCode(), viewData);
		} 
		viewData.registerJSON(id, getJson(chart));

	}
	
	private String getJson(CenPieChart chart)
	{
		Object obj = JSON.parse(gson.toJson(chart));
		return obj.toString();
	}

}
