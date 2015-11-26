package com.censtat.data.tools;

import java.io.FileWriter;

import com.censtat.data.implementation.DataEntity;
import com.censtat.data.interfaces.DataEntityTypeInterface;
import com.github.mustachejava.DefaultMustacheFactory;
import com.github.mustachejava.Mustache;
import com.github.mustachejava.MustacheFactory;

public class InforBarVisitor implements ModuleVisitorInterface {
	InfoBarTemplate inforBar = null;
	@Override
	public FileWriter visit(DataEntity entity, FileWriter writer) {
		inforBar = new InfoBarTemplate(entity);
		MustacheFactory mf = new DefaultMustacheFactory();
		Mustache mustache = mf.compile("templates/inforbar.tmpl");
		mustache.execute(writer, inforBar);		
		return null;
	}
	
	
	

}

class InfoBarTemplate {
	DataEntity dataEntity = null;

	public InfoBarTemplate(DataEntity entity) {
		this.dataEntity = entity;
	}

	public String getType() {
		return dataEntity.getDataEntityType();
	}

	public String getName() {
		return dataEntity.getName();
	}

	public String getState() {
		if (dataEntity.getDataEntityType().equals(
				DataEntityTypeInterface.STATE_TYPE)) {
			return "United States";
		}
		return dataEntity.getState();
	}
}
