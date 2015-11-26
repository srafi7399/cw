package com.censtat.web;


import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.census.db.main.CensusAccess;
import com.mongodb.DBObject;

@Controller
public class ViewDataController {
	private CensusAccess access = new CensusAccess();	
	
	@Autowired
	private HttpServletRequest request;
	@RequestMapping(value = "/charts", method = RequestMethod.GET, produces="application/json")
	public @ResponseBody DBObject getCharts(Locale locale, Model model) {		 		
		DBObject object = access.getChartsForFip(request.getHeader("resource"));		
		return object;
	}

}
