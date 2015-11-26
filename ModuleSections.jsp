<div class="row">

<!-- START OF THE SCROLL SPY SECTION -->
	<div class="col-xs-2" id="myScrollspy">
		<ul class="nav nav-tabs nav-stacked affix-top" data-spy="affix"
			data-offset-top="125">
			<li class="active"><a href="#agesection">Sex and Age</a></li>
			<li><a href="#racesection">Race</a></li>
			<li><a href="#hispanicorlatino">Hispanic or Latino</a></li>	
			<li><a href="#householdsbytype">Households by Type</a></li>
			<li><a href="#relationship">Relationship</a></li>
			<li><a href="#maritalstatus">Marital Status</a></li>			
			<li><a href="#fertility">Fertility</a></li>
			<li><a href="#grandparents">Grandparents</a></li>
			<li><a href="#schoolenrollment">School Enrollmemt</a></li>
			<li><a href="#educationalatt">Educational Attainment</a></li>			
			<li><a href="#veterans">Veteran Status</a></li>
			<li><a href="#birthplace">Place of Birth</a></li>
			<li><a href="#citizenship">US Citizenship Status</a></li>
			<!--li><a href="#foreignborn">US Citizenship Status</a></li -->
			<li><a href="#language">Language Spoken at Home</a></li>
			<li><a href="#ancestry">Ancestry</a></li>
			<li><a href="#computers">Computers and Internet Use</a></li>								
		</ul>
	</div>
	
<script>
$('body').scrollspy({
target : '#myScrollspy'
});
</script>
	
	<!-- END OF THE SCROLL SPY  SECTION  -->

<style type="text/css">
/* Custom Styles */
ul.nav-tabs {
	width: 250px;
	margin-top: 20px;
	border-radius: 4px;
	border: 1px solid #ddd;
	box-shadow: 0 1px 4px rgba(0, 0, 0, 0.067);
}
ul.nav-tabs li {
	margin: 0;
	border-top: 1px solid #ddd;
}
ul.nav-tabs li:first-child {
	border-top: none;
}
ul.nav-tabs li a {
	margin: 0;
	padding: 8px 16px;
	border-radius: 0;
}
ul.nav-tabs li.active a, ul.nav-tabs li.active a:hover {
	color: #fff;
	background: #0088cc;
	border: 1px solid #0088cc;
}
ul.nav-tabs li:first-child a {
	border-radius: 4px 4px 0 0;
}
ul.nav-tabs li:last-child a {
	border-radius: 0 0 4px 4px;
}
ul.nav-tabs.affix {
	top: 30px; /* Set the top position of pinned element */
}
</style>
  
  <script>
  $(document).ready(function() 
          {   
			
	  var re= ${fipcode};	  
	  var dat ;
	  $.ajax({
			url : '/web/charts',
			type : "GET",			
			headers: {
		        'resource':re
			},
			dataType : "json",
			contentType : "application/json",
				success: function(data){     
	             var obj= JSON.parse(JSON.stringify(data));           
	             var temp = obj.idToJsonMap; 
	            for (var key in temp) {
   			 	drawchart(key,temp[key]);
				}
	              
	             }
		});
		        	 
        	 function drawchart(chartid, jsonstring){
        			
        	         	 var obj = JSON.parse(jsonstring);        	              	
        	      	    // Build the chart
        	      	     new Highcharts.Chart({
        	      	        chart: {
        	      	        	renderTo:chartid,
        	      	            plotBackgroundColor: null,
        	      	            plotBorderWidth: null,
        	      	            plotShadow: false
        	      	            
        	      	        },
        	      	        title: {
        	      	            text: obj.chartTitle
        	      	        },
        	      	        tooltip: {
        	      	            pointFormat: '<b>{point.percentage:.1f}%</b>'
        	      	        },
        	      	        plotOptions: {
        	      	            pie: {
        	      	                allowPointSelect: true,
        	      	                cursor: 'pointer',
        	      	                showInLegend: obj.plotOptions.showInLegend,
        	      	                dataLabels: {
        	      	                    enabled: obj.plotOptions.dataLabels.enabled,
        	      	                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
        	      	                    style: {
        	      	                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
        	      	                    },
        	      	                    connectorColor: 'silver'
        	      	                }
        	      	            }
        	      	        },
        	      	        series: [{
        	      	            type: 'pie',             
        	      	            name: obj.series.name,
        	      	            data: obj.series.data
        	      	        }] 
        	      	    
        	      	    });
        	      	};
        	
    
    
   
         });
   
    </script>

<div class="col-xs-8">					
		<div id = "sexsection" class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Male Female ratio in Middle River CDP </h3>
			</div>
			<div  class="panel-body">
			<div class = "col-xs-4">		
			<p>	Total population : <span class="label label-primary">27452</span>
			</p><div id="name_male_female_percentage" style="min-width: 175px; height: 250px; max-width: 300px;"></div>	
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%">Male vs Female Percentage</th>								
									<th style="width: 10%">Estimate (%)</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td>Total Population -Male</td>								
									<td>48.8</td>
								</tr>
								<tr>
									<td>Total population - Female</td>								
									<td>51.2</td>
								</tr>						
							
							</tbody>
						</table>
					</div>							
			</div>
			<div class="col-xs-4">		
			<p>18 years and over: <span class="label label-primary">20285</span>
			</p><div id="name_18_years_and_over_cdp" style="min-width: 175px; height: 250px; max-width: 300px;"></div>	
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%">18 years and over</th>								
									<th style="width: 10%">Estimate (%)</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td>18 years and over  Male</td>								
									<td>47.7</td>
								</tr>
								<tr>
									<td>18 years and over  Female</td>								
									<td>52.3</td>
								</tr>											
								
							</tbody>
						</table>
					</div>							
			</div>
			<div class="col-xs-4">			
			<p>65 years and over: <span class="label label-primary">3327</span>
			</p>
			<div id="name_65_years_and_over_cdp" style="min-width: 175px; height: 250px; max-width: 300px;"></div>	
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%">65 years and over</th>								
									<th style="width: 10%">Estimate (%)</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td>65 years and over  Male</td>								
									<td>39.7</td>
								</tr>
								<tr>
									<td>65 years and over  Female</td>								
									<td>60.3</td>
								</tr>
												
								
							</tbody>
						</table>
					</div>							
			</div>
			</div>
		</div>
		
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Age details for Middle River CDP  </h3>
			</div>	
			<div id="agesection" class="panel-body">
			<div class = "col-xs-4">		
			<p>Median age (years): <span class="label label-primary">34.4 years</span>
			<p>18 years and over: <span class="label label-primary">73.9%</span>
			<p>21 years and over: <span class="label label-primary">70.2%</span>
			<p>62 years and over: <span class="label label-primary">15.4%</span>
			<p>65 years and over: <span class="label label-primary">12.1%</span>								
			</div>
			<div class = "col-xs-8">				
			<div id="name_age_distribution" style="min-width: 250px; height: 350px; max-width: 600px;"></div>						
			</div>					
		</div>
		</div>
					
		<div id ="racesection" class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Race Data for Middle River CDP </h3>
			</div>
			<div  class="panel-body">
			<div class = "col-xs-12">		
			<p>	Total population : <span class="label label-primary">27452</span>	
			<p>	One race : <span class="label label-primary">97.6 %</span>	
			<p>	Two or more races : <span class="label label-primary">2.4 %</span>								
			</div>
			<div >		
			<p><span class="label label-success">One Race-Breakdown</span></p>
					<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%">Race</th>
									<th style="width: 10%">Sub Race</th>
									<th style="width: 10%">(%)</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td>White</td>
									<td></td>
									<td>65.9</td>
								</tr>
								<tr>
									<td>Black or African American</td>
									<td></td>
									<td>28.6</td>
								</tr>
								<tr>
									<td>American Indian and Alaska Native</td>
									<td></td>
									<td>0.1</td>
								</tr>
								<tr>
									<td></td>
									<td>Cherokee tribal grouping</td>
									<td>N</td>
								</tr>
								<tr>
									<td></td>
									<td>Chippewa tribal grouping</td>
									<td>N</td>
								</tr>
								<tr>
									<td></td>
									<td>Navajo tribal grouping</td>
									<td>N</td>
								</tr>
								<tr>
									<td></td>
									<td>Sioux tribal grouping</td>
									<td>N</td>
								</tr>
								<tr>
									<td>Asian</td>
									<td></td>
									<td>2.7</td>
								</tr>
								<tr>
									<td></td>
									<td>Asian Indian</td>
									<td>N</td>
								</tr>
								<tr>
									<td></td>
									<td>Chinese</td>
									<td>N</td>
								</tr>
								<tr>
									<td></td>
									<td>Filipino</td>
									<td>N</td>
								</tr>
								<tr>
									<td></td>
									<td>Japanese</td>
									<td>N</td>
								</tr>
								<tr>
									<td></td>
									<td>Korean</td>
									<td>N</td>
								</tr>
								<tr>
									<td></td>
									<td>Vietnamese</td>
									<td>N</td>
								</tr>
								<tr>
									<td></td>
									<td>Other Asian</td>
									<td>N</td>
								</tr>
								
								<tr>
									<td>Native Hawaiian and Other Pacific Islander</td>
									<td></td>
									<td>0</td>
								</tr>
								
								<tr>
									<td></td>
									<td>Native Hawaiian</td>
									<td>N</td>
								</tr>
								<tr>
									<td></td>
									<td>Guamanian or Chamorro</td>
									<td>N</td>
								</tr>
								<tr>
									<td></td>
									<td>Samoan</td>
									<td>N</td>
								</tr>
								<tr>
									<td></td>
									<td>Other Pacific Islander</td>
									<td>N</td>
								</tr>
								
								<tr>
									<td>Some other race</td>
									<td></td>
									<td>0.4</td>
								</tr>
								
								
							</tbody>
						</table>
					</div>
					</div>


					<div>			
			<p><span class="label label-success">Two or More Races-Breakdown</span></p>
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%">Race</th>								
									<th style="width: 10%">(%)</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td>White and Black or African American</td>								
									<td>N</td>
								</tr>
								<tr>
									<td>White and American Indian and Alaska Native</td>									
									<td>N</td>
								</tr>
								<tr>
									<td>White and Asian</td>								
									<td>N</td>
								</tr>
								<tr>
									<td>Black or African American and American Indian and Alaska Native</td>								
									<td>N</td>
								</tr>
							</tbody>
						</table>
					</div>						
			</div>
		
		</div>
					
		</div>		<div id = "hispanicorlatino" class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Hispanic or Latino and Race - Middle River CDP</h3>
			</div>
			<div  class="panel-body">
			<div class = "col-xs-12">		
			<p>	Total population: <span class="label label-primary">27452</span></p>
			<div>			
			<p>Hispanic or Latino (of any race): <span class="label label-primary">8.4 %</span></p>
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%">Hispanic or Latino (of any race)</th>								
									<th style="width: 10%">(%)</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td>Mexican</td>								
									<td>0.5</td>
								</tr>
								<tr>
									<td>Puerto Rican</td>									
									<td>1</td>
								</tr>
								<tr>
									<td>Cuban</td>								
									<td>0</td>
								</tr>
								<tr>
									<td>Other Hispanic or Latino</td>								
									<td>6.9</td>
								</tr>
							</tbody>
						</table>
					</div>						
			</div>
			
			<div>			
			<p>Not Hispanic or Latino: <span class="label label-primary">91.6 %</span></p>
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%">Not Hispanic or Latino</th>								
									<th style="width: 10%">(%)</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td>White alone</td>								
									<td>58.1</td>
								</tr>
								<tr>
									<td>Black or African American alone</td>									
									<td>28.2</td>
								</tr>
								<tr>
									<td>American Indian and Alaska Native alone</td>								
									<td>0.1</td>
								</tr>
								<tr>
									<td>Asian alone</td>								
									<td>2.7</td>
								</tr>
								<tr>
									<td>Native Hawaiian and Other Pacific Islander alone</td>								
									<td>0</td>
								</tr>
								<tr>
									<td>Some other race alone</td>								
									<td>0.3</td>
								</tr>
							</tbody>
						</table>
					</div>						
			</div>
			
			<div>			
			<p>Two or more races: <span class="label label-primary">2.3 %</span></p>
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%">Two or more races</th>								
									<th style="width: 10%">(%)</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td>Two races including Some other race</td>								
									<td>0.4</td>
								</tr>
								<tr>
									<td>Two races excluding Some other race, and Three or more races</td>									
									<td>1.9</td>
								</tr>
								
							</tbody>
						</table>
					</div>						
			</div>
			
			
			</div>
		</div>
		
		</div></div>
		
	<div class="col-xs-2" style="background-color: lavender;">
		<p></p>
	</div>
		</div>
