package com.censtat.web;

import java.net.UnknownHostException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.census.db.main.CensusAccess;
import com.census.db.main.CensusConst;
import com.census.db.main.MongoApp;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ContentPopulationController {

	private static final Logger logger = LoggerFactory
			.getLogger(ContentPopulationController.class);
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

	@Autowired
	private HttpServletRequest request;

	@RequestMapping(value = "content/population", method = RequestMethod.GET, produces="application/json")
	public @ResponseBody List<DBObject> getPopulation(Locale locale, Model model) {
		CensusAccess access = new CensusAccess();
		DBCursor cursor = access.getAllPopEstimatesForState2010To2014(
				request.getHeader("typeofchart"),
				request.getHeader("nameofchart"));
		return cursor.toArray();
	}
}
