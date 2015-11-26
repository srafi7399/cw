package com.censtat.data.tools;

import java.io.IOException;
import java.util.Properties;

import com.github.jknack.handlebars.Context;
import com.github.jknack.handlebars.Handlebars;
import com.github.jknack.handlebars.Template;
import com.github.jknack.handlebars.io.ClassPathTemplateLoader;
import com.github.jknack.handlebars.io.FileTemplateLoader;
import com.github.jknack.handlebars.io.TemplateLoader;

/**
 * 
 * @author Rafi Shaik
 *
 */
public class StaticPageTool {

	public StaticPageTool() {

	}

	public void buildPages() {

		//Handlebars handle = new Handlebars();
		TemplateLoader loader = new FileTemplateLoader(".");
		//loader.setPrefix("/templates");
		//loader.setSuffix(".hbs");
		Handlebars handlebars = new Handlebars(loader);
		Properties prop = new Properties();
		prop.put("title", "world");
		try {
			Template template = handlebars.compile("test");
			System.out.println(template.apply("title: My New Post"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static void main(String[] args) {
		
		StaticPageTool tool = new StaticPageTool();
		tool.buildPages();

	}

}
