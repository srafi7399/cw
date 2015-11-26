package com.censtat.data.tools;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

import com.censtat.data.implementation.DataEntity;
import com.github.mustachejava.DefaultMustacheFactory;
import com.github.mustachejava.Mustache;
import com.github.mustachejava.MustacheFactory;

public class ModuleSectionStopVisitor implements ModuleVisitorInterface {

	@Override
	public FileWriter visit(DataEntity entity, FileWriter writer) {
		MustacheFactory mf = new DefaultMustacheFactory();
		Mustache mustache = mf.compile("templates/modulesectionstop.tmpl");
		mustache.execute(writer, null);		
		return writer;

	}

	public static void main(String[] args) {
		ModuleSectionStopVisitor modulestop = new ModuleSectionStopVisitor();
		modulestop.visit(null, null);

	}

}
