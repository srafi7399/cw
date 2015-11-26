package com.censtat.data.tools;


import com.github.mustachejava.DefaultMustacheFactory;
import com.github.mustachejava.Mustache;
import com.github.mustachejava.MustacheFactory;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class Example2 {
	
	private HashMap<String,String> test= new HashMap<String,String>();
	
	public Example2()
	{
		init();
	}
	private void init()
	{
		test.put("name1","kishore");
		test.put("name2","Shyam");
	}
	
	public Set map()
	{
		return this.test.entrySet();
	}
	
	public String total(){
		return "100";
	}
	
	public String size(){
		return "3.5";
	}
	
	
	public String place()
	{
		return "San Jose";
	}
	
	public String name()
	{
		return "Kishore";
	}
	
	public String person()
	{
		return "Shyam";
	}


  public static void main(String[] args) throws IOException {
    MustacheFactory mf = new DefaultMustacheFactory();
    Mustache mustache = mf.compile("household.js");
    mustache.execute(new PrintWriter(System.out), new Example2()).flush();
  }
}