package com.censtat.data.tools;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

import com.censtat.data.implementation.DataEntity;
import com.github.mustachejava.DefaultMustacheFactory;
import com.github.mustachejava.Mustache;
import com.github.mustachejava.MustacheFactory;

public class RaceModuleVisitor implements ModuleVisitorInterface {
	private KeyGenTemplateFile template = new KeyGenTemplateFile();
	
	@Override
	public FileWriter visit(DataEntity entity, FileWriter writer) {		
		template.setKeyMap(entity.getItentifierKeys());
		MustacheFactory mf = new DefaultMustacheFactory();
		Mustache mustache = mf.compile("templates/race.tmpl");
		mustache.execute(writer, template);			
		return writer;
	}

}
