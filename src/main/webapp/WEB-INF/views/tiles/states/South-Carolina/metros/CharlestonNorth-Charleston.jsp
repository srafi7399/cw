<div class="row">
<div class="bs-example">
    <ul class="breadcrumb">
        <li><a href="/">Home</a></li> 
        <li><a href="/states">states</a></li> 
        <li><a href="/states/South-Carolina">South Carolina</a></li> 
        <li><a href="/states/South-Carolina/metros-South-Carolina">Metros</a></li> 
              <li class="active">Charleston-North Charleston</li>
    </ul>
</div>
</div>
                            		<div class="row">
<div class="well">
<div itemscope itemtype="http://schema.org/CreativeWork">
<h5>This page displays Information and Stats about Demographic and Social aspects of Charleston-North Charleston in South Carolina. The information includes data on <span itemprop="about"> Age,Sex,Race,Households,Relationships,Veteran Status,School Enrollment levels,Educational Attainment levels, Fertility, Place of Birth,Languages Spoken at home, Ancestry, U.S Citizenship Status and Computer and Internet usage.</h5>
 <h5><small>NOTE: An entry of 'X' in an estimate indicates data is not available and an entry of 'N' indicates that the number of sample cases is too small</small></h5>
 <h5><small>NOTE:  All the data and stats displayed on this page are based on 2013 U.S Government estimates</small></h5>	 
</div>
</div>
</div>

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
			url : '${pageContext.request.contextPath}/charts',
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
<div itemscope itemtype="http://schema.org/Dataset">				
		<div id = "sexsection" class="panel panel-default">
		
			<div class="panel-heading">
				<h3 class="panel-title"><span itemprop="about">The ratio of Male to Female population in Charleston-North Charleston</h3>
			</div>
			<div  class="panel-body">
			<div class = "col-xs-4">		
			<p>	Total population : <span class="label label-primary">697116</span>
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
									<td>48.9</td>
								</tr>
								<tr>
									<td>Total population - Female</td>								
									<td>51.1</td>
								</tr>						
							
							</tbody>
						</table>
					</div>							
			</div>
			<div class="col-xs-4">		
			<p>18 years and over: <span class="label label-primary">538074</span>
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
									<td>48.4</td>
								</tr>
								<tr>
									<td>18 years and over  Female</td>								
									<td>51.6</td>
								</tr>											
								
							</tbody>
						</table>
					</div>							
			</div>
			<div class="col-xs-4">			
			<p>65 years and over: <span class="label label-primary">85972</span>
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
									<td>44</td>
								</tr>
								<tr>
									<td>65 years and over  Female</td>								
									<td>56</td>
								</tr>
												
								
							</tbody>
						</table>
					</div>							
			</div>
			</div>
			</div>
		
		
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><span itemprop="about">Age details for Charleston-North Charleston  </h3>
			</div>	
			<div id="agesection" class="panel-body">
			<div class = "col-xs-4">		
			<p>Median age (years): <span class="label label-primary">35.7 years</span>
			<p>18 years and over: <span class="label label-primary">77.2%</span>
			<p>21 years and over: <span class="label label-primary">72.9%</span>
			<p>62 years and over: <span class="label label-primary">15.7%</span>
			<p>65 years and over: <span class="label label-primary">12.3%</span>								
			</div>
			<div class = "col-xs-8">				
			<div id="name_age_distribution" style="min-width: 250px; height: 350px; max-width: 600px;"></div>						
			</div>					
		</div>
		</div>
		
		</div>
					
		<div itemscope itemtype="http://schema.org/Dataset">
<div id ="racesection" class="panel panel-default">

			<div class="panel-heading">
				<h3 class="panel-title"><span itemprop="about">Race Data for Charleston-North Charleston </h3>
			</div>
			<div  class="panel-body">
			<div class = "col-xs-12">		
			<p>	Total population : <span class="label label-primary">697116</span>	
			<p>	One race : <span class="label label-primary">97.8 %</span>	
			<p>	Two or more races : <span class="label label-primary">2.2 %</span>								
			</div>
			<div >		
			<p><span class="label label-success"><span itemprop="about">One Race-Breakdown</span></p>
					<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%"><span itemprop="about">Race</th>
									<th style="width: 10%"><span itemprop="about">Sub Race</th>
									<th style="width: 10%">Estimate(%)</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td><span itemprop="about">White</td>
									<td></td>
									<td>67.3</td>
								</tr>
								<tr>
									<td><span itemprop="about">Black or African American</td>
									<td></td>
									<td>27.2</td>
								</tr>
								<tr>
									<td><span itemprop="about">American Indian and Alaska Native</td>
									<td></td>
									<td>0.4</td>
								</tr>
								<tr>
									<td></td>
									<td><span itemprop="about">Cherokee tribal grouping</td>
									<td>N</td>
								</tr>
								<tr>
									<td></td>
									<td><span itemprop="about">Chippewa tribal grouping</td>
									<td>N</td>
								</tr>
								<tr>
									<td></td>
									<td><span itemprop="about">Navajo tribal grouping</td>
									<td>N</td>
								</tr>
								<tr>
									<td></td>
									<td><span itemprop="about">Sioux tribal grouping</td>
									<td>N</td>
								</tr>
								<tr>
									<td><span itemprop="about">Asian</td>
									<td></td>
									<td>1.7</td>
								</tr>
								<tr>
									<td></td>
									<td><span itemprop="about">Asian Indian</td>
									<td>0.2</td>
								</tr>
								<tr>
									<td></td>
									<td><span itemprop="about">Chinese</td>
									<td>0.4</td>
								</tr>
								<tr>
									<td></td>
									<td><span itemprop="about">Filipino</td>
									<td>0.6</td>
								</tr>
								<tr>
									<td></td>
									<td><span itemprop="about">Japanese</td>
									<td>0</td>
								</tr>
								<tr>
									<td></td>
									<td><span itemprop="about">Korean</td>
									<td>0.1</td>
								</tr>
								<tr>
									<td></td>
									<td><span itemprop="about">Vietnamese</td>
									<td>0.2</td>
								</tr>
								<tr>
									<td></td>
									<td><span itemprop="about">Other Asian</td>
									<td>0.2</td>
								</tr>
								
								<tr>
									<td><span itemprop="about">Native Hawaiian and Other Pacific Islander</td>
									<td></td>
									<td>0.1</td>
								</tr>
								
								<tr>
									<td></td>
									<td><span itemprop="about">Native Hawaiian</td>
									<td>N</td>
								</tr>
								<tr>
									<td></td>
									<td><span itemprop="about">Guamanian or Chamorro</td>
									<td>N</td>
								</tr>
								<tr>
									<td></td>
									<td><span itemprop="about">Samoan</td>
									<td>N</td>
								</tr>
								<tr>
									<td></td>
									<td><span itemprop="about">Other Pacific Islander</td>
									<td>N</td>
								</tr>
								
								<tr>
									<td><span itemprop="about">Some other race</td>
									<td></td>
									<td>1.2</td>
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
									<th style="width: 10%">Estimate(%)</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td><span itemprop="about">White and Black or African American</td>								
									<td>0.7</td>
								</tr>
								<tr>
									<td><span itemprop="about">White and American Indian and Alaska Native</td>									
									<td>0.4</td>
								</tr>
								<tr>
									<td><span itemprop="about">White and Asian</td>								
									<td>0.4</td>
								</tr>
								<tr>
									<td><span itemprop="about">Black or African American and American Indian and Alaska Native</td>								
									<td>0.2</td>
								</tr>
							</tbody>
						</table>
					</div>						
			</div>
		
		</div>
					
		</div>
		</div><div itemscope itemtype="http://schema.org/Dataset">
<div id = "hispanicorlatino" class="panel panel-default">
		
			<div class="panel-heading">
				<h3 class="panel-title"><span itemprop="about">Hispanic or Latino and Race - Charleston-North Charleston</h3>
			</div>
			<div  class="panel-body">
			<div class = "col-xs-12">		
			<p>	Total population: <span class="label label-primary">697116</span></p>
			<div>			
			<p>Hispanic or Latino (of any race): <span class="label label-primary">5.3 %</span></p>
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%"><span itemprop="about">Hispanic or Latino (of any race)</th>								
									<th style="width: 10%">Estimate(%)</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td><span itemprop="about">Mexican</td>								
									<td>2.9</td>
								</tr>
								<tr>
									<td><span itemprop="about">Puerto Rican</td>									
									<td>0.8</td>
								</tr>
								<tr>
									<td><span itemprop="about">Cuban</td>								
									<td>0.1</td>
								</tr>
								<tr>
									<td><span itemprop="about">Other Hispanic or Latino</td>								
									<td>1.4</td>
								</tr>
							</tbody>
						</table>
					</div>						
			</div>
			
			<div>			
			<p>Not Hispanic or Latino: <span class="label label-primary">94.7 %</span></p>
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%">Not Hispanic or Latino</th>								
									<th style="width: 10%">Estimate(%)</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td><span itemprop="about">White alone</td>								
									<td>63.7</td>
								</tr>
								<tr>
									<td><span itemprop="about">Black or African American alone</td>									
									<td>27</td>
								</tr>
								<tr>
									<td><span itemprop="about">American Indian and Alaska Native alone</td>								
									<td>0.4</td>
								</tr>
								<tr>
									<td><span itemprop="about">Asian alone</td>								
									<td>1.7</td>
								</tr>
								<tr>
									<td><span itemprop="about">Native Hawaiian and Other Pacific Islander alone</td>								
									<td>0.1</td>
								</tr>
								<tr>
									<td><span itemprop="about">Some other race alone</td>								
									<td>0</td>
								</tr>
							</tbody>
						</table>
					</div>						
			</div>
			
			<div>			
			<p>Two or more races: <span class="label label-primary">1.9 %</span></p>
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%">Two or more races</th>								
									<th style="width: 10%">Estimate(%)</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td><span itemprop="about">Two races including Some other race</td>								
									<td>0</td>
								</tr>
								<tr>
									<td><span itemprop="about">Two races excluding Some other race, and Three or more races</td>									
									<td>1.9</td>
								</tr>
								
							</tbody>
						</table>
					</div>						
			</div>
			
			
			</div>
		</div>
		
		</div>
		</div><div itemscope itemtype="http://schema.org/Dataset">
<div id = "householdsbytype" class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><span itemprop="about">Households by type in <span itemprop="spatial">Charleston-North Charleston </h3>
			</div>			
			<div  class="panel-body">
			<div class = "col-xs-6">		
			<p>	<span itemprop="about">Total Households in Charleston-North Charleston : <span class="label label-primary">263127</span>
			<p>	<span itemprop="about">Households with one or more people under 18 years  : <span class="label label-primary">31.1%</span>
			<p>	<span itemprop="about">Households with one or more people 65 years and over  : <span class="label label-primary">23.3%</span>
			<p>	<span itemprop="about">Average household size in Charleston-North Charleston : <span class="label label-primary">2.58</span>
			<p>	<span itemprop="about">Average family size in Charleston-North Charleston : <span class="label label-primary">3.19</span>	
			</p>
			<div id="name_fam_vs_nonfam_hos" style="min-width: 175px; height: 250px; max-width: 300px;"></div>						
			
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%"><span itemprop="about">Household Type</th>								
									<th style="width: 10%">Estimate (%)</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><span itemprop="about">Family households (families)</td>								
									<td>64.4</td>
								</tr>
								<tr>
									<td><span itemprop="about">Nonfamily households</td>								
									<td>35.6</td>
								</tr>													
								
							</tbody>
						</table>
					</div>					
		</div>
		
		<div class = "col-xs-6">
		<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%"><span itemprop="about">Family Households by type</th>								
									<th style="width: 10%">Estimate (%)</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><span itemprop="about">Married Couple family</td>								
									<td>45.9</td>
								</tr>
								<tr>
									<td><span itemprop="about">Male Household- No Wife Present</td>								
									<td>4.4</td>
								</tr>
								<tr>
									<td><span itemprop="about">Female Household-No Husband Present</td>								
									<td>14.1</td>
								</tr>														
								
							</tbody>
						</table>
					</div>		
					
		<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%"><span itemprop="about">Nonfamily households</th>								
									<th style="width: 10%">Estimate (%)</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><span itemprop="about">Householder living alone</td>								
									<td>28.3</td>
								</tr>
								<tr>
									<td><span itemprop="about">65 years and over</td>								
									<td>8.3</td>
								</tr>													
								
							</tbody>
						</table>
					</div>		
					</div>
					
					
					</div>
					</div>
					
					</div>
					
		
			<div itemscope itemtype="http://schema.org/Dataset">
<div id = "relationship" class="panel panel-default">

			<div class="panel-heading">
				<h3 class="panel-title"><span itemprop="about">Relationship in <span itemprop="spatial">Charleston-North Charleston households</h3>
			</div>			
			<div  class="panel-body">
			<div class = "col-xs-12">		
			<p>	Population in households : <span class="label label-primary">679506</span></p>
									
			<div class="col-xs-12">	
			<div  class="panel-body">		
			<div id="name_relationship_by_type" style="min-width: 375px; height: 450px; max-width: 500px;">
			</div>
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%"><span itemprop="about">Relationship by type</th>								
									<th style="width: 10%">Estimate (%)</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td><span itemprop="about">Householder</td>								
									<td>38.7</td>
								</tr>
								<tr>
									<td><span itemprop="about">Spouse</td>								
									<td>17.7</td>
								</tr>
								<tr>
									<td><span itemprop="about">Child</td>								
									<td>29.6</td>
								</tr>
								<tr>
									<td><span itemprop="about">Other relatives</td>								
									<td>7.3</td>
								</tr>
								<tr>
									<td><span itemprop="about">Nonrelatives</td>								
									<td>6.6</td>
								</tr>								
								
							</tbody>
						</table>
					</div>		
				</div>
			</div>						
			
					
		</div>	

					
		</div>
		</div>
		
		</div>
		
		

					
		<div itemscope itemtype="http://schema.org/Dataset">
<div id = "maritalstatus" class="panel panel-default">

			<div class="panel-heading">
				<h3 class="panel-title"><span itemprop="about">Marital Status in <span itemprop="spatial">Charleston-North Charleston </h3>
			</div>			
			<div  class="panel-body">
			<div class = "col-xs-12">		
			<p>	Population of Males 15 years and over : <span class="label label-primary">273047</span>
			<p> Population of Females 15 years and over: <span class="label label-primary">289738</span>		
			
			<div class="col-xs-6">	
			<div  class="panel-body">		
			<div id="name_maritial_status_male" style="min-width: 250px; height: 350px; max-width: 500px;">
			</div>
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%"><span itemprop="about">Maritial Status of Males</th>								
									<th style="width: 10%">Estimate (%)</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td><span itemprop="about">Never married</td>								
									<td>36.9</td>
								</tr>
								<tr>
									<td><span itemprop="about">Now married, except separated</td>								
									<td>47.7</td>
								</tr>
								<tr>
									<td><span itemprop="about">Separated</td>								
									<td>2.7</td>
								</tr>
								<tr>
									<td><span itemprop="about">Widowed</td>								
									<td>2.4</td>
								</tr>
								<tr>
									<td><span itemprop="about">Divorced</td>								
									<td>10.3</td>
								</tr>
								
								
							</tbody>
						</table>
					</div>		
				</div>
			</div>						
			<div class="col-xs-6">	
			<div  class="panel-body">					
			<div id="name_maritial_status_female" style="min-width: 250px; height: 350px; max-width: 500px;"></div>	
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%"><span itemprop="about">Maritial Status of females</th>								
									<th style="width: 10%">Estimate (%)</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td><span itemprop="about">Never married</td>								
									<td>30.7</td>
								</tr>
								<tr>
									<td><span itemprop="about">Now married, except separated</td>								
									<td>44.3</td>
								</tr>
								<tr>
									<td><span itemprop="about">Separated</td>								
									<td>3.8</td>
								</tr>
								<tr>
									<td><span itemprop="about">Widowed</td>								
									<td>9.2</td>
								</tr>
								<tr>
									<td><span itemprop="about">Divorced</td>								
									<td>12</td>
								</tr>
								
								
							</tbody>
						</table>
					</div>	
				</div>						
			</div>
			</div>
			</div>	
					
		</div>
		
		</div>
		
		
		

					
		<div itemscope itemtype="http://schema.org/Dataset">	
<div id = "fertility" class="panel panel-default">
		
			<div class="panel-heading">
				<h3 class="panel-title"><span itemprop="about">Fertility Data for Women in <span itemprop="spatial">Charleston-North Charleston </h3>
			</div>			
			<div  class="panel-body">
			<div class = "col-xs-12">		
			<p>	<span itemprop="about">Number of women 15 to 50 years old who had a birth in the past 12 months : <span class="label label-primary">8654</span></p>
			<p>	<span itemprop="about">Unmarried women (widowed, divorced, and never married) : <span class="label label-primary">40.3 %</span></p>
		
						
			<div class="col-xs-12">	
			<div  class="panel-body">					
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%"><span itemprop="about">Fertility</th>								
									<th style="width: 10%">Per 1000 Women</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td><span itemprop="about">Per 1,000 unmarried women</td>								
									<td>35</td>
								</tr>
								<tr>
									<td><span itemprop="about">Per 1,000 women 15 to 50 years old</td>								
									<td>49</td>
								</tr>
								<tr>
									<td><span itemprop="about">Per 1,000 women 15 to 19 years old</td>								
									<td>27</td>
								</tr>
								<tr>
									<td><span itemprop="about">Per 1,000 women 20 to 34 years old</td>								
									<td>84</td>
								</tr>
								<tr>
									<td><span itemprop="about">Per 1,000 women 35 to 50 years old</td>								
									<td>18</td>
								</tr>								
								
							</tbody>
						</table>
					</div>		
				</div>
			</div>						
			
					
		</div>	

					
		</div>
		</div>
		
		</div>
		
		

					
		<div itemscope itemtype="http://schema.org/Dataset">
<div id = "grandparents" class="panel panel-default">
	
			<div class="panel-heading">
				<h3 class="panel-title"><span itemprop="about">Grandparents responsible for own Grandchildren in <span itemprop="spatial">Charleston-North Charleston </h3>
			</div>			
			<div  class="panel-body">
			<div class = "col-xs-12">		
			<p>	<span itemprop="about">Number of grandparents living with own grandchildren under 18 years : <span class="label label-primary">16855</span></p>
			<p>	<span itemprop="about">Grandparents responsible for grandchildren : <span class="label label-primary">48.8 %</span></p>
			<p>	<span itemprop="about">Number of grandparents responsible for own grandchildren under 18 years : <span class="label label-primary">8223 </span></p>
			<p>	<span itemprop="about">Percentage of female grandparents responsible for own grandchildren under 18 years : <span class="label label-primary">65.2 %</span></p>
			<p>	<span itemprop="about">Percentage of male grandparents responsible for own grandchildren under 18 years : <span class="label label-primary">72.7 %</span></p>
									
			<div class="col-xs-12">	
			<div  class="panel-body">					
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%"><span itemprop="about">Years responsible for Grandchildren</th>								
									<th style="width: 10%">Estimate(%)</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td><span itemprop="about">Less than 1 year</td>								
									<td>8.8</td>
								</tr>
								<tr>
									<td><span itemprop="about">1 or 2 years</td>								
									<td>12.7</td>
								</tr>
								<tr>
									<td><span itemprop="about">3 or 4 years</td>								
									<td>7.7</td>
								</tr>
								<tr>
									<td><span itemprop="about">5 or more years</td>								
									<td>19.6</td>
								</tr>													
								
							</tbody>
						</table>
					</div>		
				</div>
			</div>						
			
					
		</div>	

					
		</div>
		</div>
		
		</div>
		
		

					
		<div itemscope itemtype="http://schema.org/Dataset">
	<div id = "schoolenrollment" class="panel panel-default">
		
			<div class="panel-heading">
				<h3 class="panel-title"><span itemprop="about">School Enrollment in <span itemprop="spatial">Charleston-North Charleston </h3>
			</div>			
			<div  class="panel-body">
			<div class = "col-xs-12">		
			<p>	Population 3 years and over enrolled in school : <span class="label label-primary">180382</span></p>
						
			<div class="col-xs-12">	
			<div  class="panel-body">		
			<div id="name_school_enrollment_by_grade" style="min-width: 375px; height: 450px; max-width: 500px;">
			</div>
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%"><span itemprop="about">School Enrollment</th>								
									<th style="width: 10%">Estimate (%)</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td><span itemprop="about">Nursery school, preschool</td>								
									<td>5.9</td>
								</tr>
								<tr>
									<td><span itemprop="about">Kindergarten</td>								
									<td>6.7</td>
								</tr>
								<tr>
									<td><span itemprop="about">Elementary school (grades 1-8)</td>								
									<td>38.2</td>
								</tr>
								<tr>
									<td><span itemprop="about">High School (grades 9-12)</td>								
									<td>18.6</td>
								</tr>
								<tr>
									<td><span itemprop="about">College or graduate school</td>								
									<td>30.6</td>
								</tr>
								
								
							</tbody>
						</table>
					</div>		
				</div>
			</div>						
			
					
		</div>	

					
		</div>
		</div>
		
		</div>
		
		

					
		<div itemscope itemtype="http://schema.org/Dataset">
<div id = "educationalatt" class="panel panel-default">
	
			<div class="panel-heading">
				<h3 class="panel-title"><span itemprop="about">Educational Attainment in <span itemprop="spatial">Charleston-North Charleston </h3>
			</div>			
			<div  class="panel-body">
			<div class = "col-xs-12">		
			<p>	Population 25 years and over : <span class="label label-primary">465296</span></p>
			<p>	Percent high school graduate or higher : <span class="label label-primary">88.5 %</span></p>
			<p>	Percent bachelors degree or higher : <span class="label label-primary">31.4 %</span></p>
						
			<div class="col-xs-12">	
			<div  class="panel-body">		
			<div id="name_educational_attainment_levels" style="min-width: 375px; height: 450px; max-width: 500px;">
			</div>
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%"><span itemprop="about">Educational Attainment levels</th>								
									<th style="width: 10%">Estimate (%)</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td><span itemprop="about">Less than 9th grade</td>								
									<td>3.9</td>
								</tr>
								<tr>
									<td><span itemprop="about">9th to 12th grade, no diploma</td>								
									<td>7.6</td>
								</tr>
								<tr>
									<td><span itemprop="about">High school graduate (includes equivalency)</td>								
									<td>25.8</td>
								</tr>
								<tr>
									<td><span itemprop="about">Some college, no degree</td>								
									<td>22.4</td>
								</tr>
								<tr>
									<td><span itemprop="about">Associates degree</td>								
									<td>8.8</td>
								</tr>
								<tr>
									<td><span itemprop="about">Bachelors degree</td>								
									<td>20.1</td>
								</tr>
								<tr>
									<td><span itemprop="about">Graduate or professional degree</td>								
									<td>11.2</td>
								</tr>
								
								
							</tbody>
						</table>
					</div>		
				</div>
			</div>						
			
					
		</div>	

					
		</div>
		</div>
		
		</div>
		
		

					
		<div itemscope itemtype="http://schema.org/Dataset">	
<div id = "veterans" class="panel panel-default">
	
			<div class="panel-heading">
				<h3 class="panel-title"><span itemprop="about">Veterans Status in <span itemprop="spatial">Charleston-North Charleston </h3>
			</div>			
			<div  class="panel-body">
			<div class = "col-xs-12">		
			<p>	<span itemprop="about">Civilian population 18 years and over : <span class="label label-primary">530539</span></p>
			<p>	<span itemprop="about">Civilian Veterans : <span class="label label-primary">12.6 %</span></p>
			</div>	
			</div>		
	
					
		</div>	
		
		</div>

					
		<div itemscope itemtype="http://schema.org/Dataset">
<div id = "birthplace" class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><span itemprop="about">Place of Birth data for <span itemprop="spatial">Charleston-North Charleston </h3>
			</div>			
			<div  class="panel-body">
			<div class = "col-xs-6">		
			<p>	Total Population in Charleston-North Charleston : <span class="label label-primary">697116</span>					
			</p>
			<div id="name_nat_vs_foreign" style="min-width: 175px; height: 250px; max-width: 300px;"></div>						
			
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%"><span itemprop="about">Native Vs Foreign Born</th>								
									<th style="width: 10%">Estimate (%)</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><span itemprop="about">Native</td>								
									<td>94.8</td>
								</tr>
								<tr>
									<td><span itemprop="about">Foreign born </td>								
									<td>5.2</td>
								</tr>													
								
							</tbody>
						</table>
					</div>					
		</div>
		
		<div class = "col-xs-6">
		<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%"><span itemprop="about">Native population breakdown</th>								
									<th style="width: 10%">Estimate (%)</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><span itemprop="about">Born in U.S- Same state of residence</td>								
									<td>52.4</td>
								</tr>
								<tr>
									<td><span itemprop="about">Born in U.S- different state of residence</td>								
									<td>41</td>
								</tr>
								<tr>
									<td><span itemprop="about">Born in Puerto Rico, U.S Island areas, or born abroad to American parent(s)</td>								
									<td>1.5</td>
								</tr>														
								
							</tbody>
						</table>
					</div>	
					</div>
					</div>
					</div>
					</div><div itemscope itemtype="http://schema.org/Dataset">
<div id = "citizenship" class="panel panel-default">		
			<div class="panel-heading">
				<h3 class="panel-title"><span itemprop="about">U.S Citizenship Status for foreign born population in <span itemprop="spatial">Charleston-North Charleston </h3>
			</div>			
			<div  class="panel-body">
			<div class = "col-xs-12">		
			<p>	Foreign born population : <span class="label label-primary">36013</span></p>
									
			<div class="col-xs-12">	
			<div  class="panel-body">		
			<div id="name_natural_us_citizen_vs_not_a_us_citizen" style="min-width: 250px; height: 350px; max-width: 500px;">
			</div>
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%"><span itemprop="about">Foreign born population-Citizenship Status</th>								
									<th style="width: 10%">Estimate (%)</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td><span itemprop="about">Naturalized U.S citizen </td>								
									<td>45.5</td>
								</tr>
								<tr>
									<td><span itemprop="about">Not a U.S citizen</td>								
									<td>54.5</td>
								</tr>
											
								
							</tbody>
						</table>
					</div>		
				</div>
			</div>						
			
					
		</div>	

					
		</div>
		</div>
		</div>
		

					
		<div itemscope itemtype="http://schema.org/Dataset">
<div id = "language" class="panel panel-default">
	
			<div class="panel-heading">
				<h3 class="panel-title"><span itemprop="about">Language spoken at home in <span itemprop="spatial">Charleston-North Charleston </h3>
			</div>			
			<div  class="panel-body">
			<div class = "col-xs-6">		
			<p>	Population 5 years and over in Charleston-North Charleston : <span class="label label-primary">650831</span>					
			</p>
			<div id="name_lang_spoken_at_home_bdown" style="min-width: 175px; height: 250px; max-width: 300px;"></div>						
			
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%"><span itemprop="about">English vs Other Languages</th>								
									<th style="width: 10%">Estimate (%)</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><span itemprop="about">English only</td>								
									<td>92.6</td>
								</tr>
								<tr>
									<td><span itemprop="about">Language other than English</td>								
									<td>7.4</td>
								</tr>													
								
							</tbody>
						</table>
					</div>					
		</div>
		
		<div class = "col-xs-6">
		<p>	Breakdown of non English languages with data on English speaking ability	</p>
		<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%"><span itemprop="about">Language Spoken</th>								
									<th style="width: 10%">Estimate (%)</th>
									<th style="width: 10%"><span itemprop="about">Can Speak English less than very well (%)</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><span itemprop="about">Spanish</td>								
									<td>4.5</td>
									<td>1.9</td>
								</tr>
								<tr>
									<td><span itemprop="about">European languages</td>								
									<td>1.5</td>
									<td>0.3</td>
								</tr>
								<tr>
									<td><span itemprop="about"> Asian and Pacific Islander languages</td>								
									<td>1.2</td>
									<td>0.5</td>
								</tr>									
								<tr>
									<td><span itemprop="about">Other languages</td>								
									<td>0.2</td>
									<td>0.1</td>
								</tr>														
								
							</tbody>
						</table>
					</div>	
					</div>
					</div>
					</div>
</div><div itemscope itemtype="http://schema.org/Dataset">
<div id = "ancestry" class="panel panel-default">

			<div class="panel-heading">
				<h3 class="panel-title"><span itemprop="about">Ancestry Data for population in <span itemprop="spatial">Charleston-North Charleston </h3>
			</div>			
			<div  class="panel-body">
			<div class = "col-xs-12">		
			<p>	Total population : <span class="label label-primary">697116</span>		
			<div class="col-xs-12">	
			<div  class="panel-body">					
			<div class="table-responsive">
						<table	class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%"><span itemprop="about">Ancestry</th>								
									<th style="width: 10%">Estimate(%)</th>
								</tr>
							</thead>
							<tbody>

								
								
								<tr>
									<td><span itemprop="about">American</td>								
									<td>13.5</td>
								</tr>
								<tr>
									<td><span itemprop="about">Arab</td>								
									<td>0.2</td>
								</tr>
								<tr>
									<td><span itemprop="about">Czech</td>								
									<td>0.2</td>
								</tr>
								<tr>
									<td><span itemprop="about">Danish</td>								
									<td>0.2</td>
								</tr>
								<tr>
									<td><span itemprop="about">Dutch</td>								
									<td>1</td>
								</tr>
								<tr>
									<td><span itemprop="about"> English</td>								
									<td>9</td>
								</tr>
								<tr>
									<td><span itemprop="about"> French (except Basque)</td>								
									<td>2.6</td>
								</tr>
								<tr>
									<td><span itemprop="about"> French Canadian</td>								
									<td>0.4</td>
								</tr>
								<tr>
									<td><span itemprop="about"> German</td>								
									<td>11.4</td>
								</tr>
								<tr>
									<td><span itemprop="about"> Greek</td>								
									<td>0.5</td>
								</tr>
								<tr>
									<td><span itemprop="about"> Hungarian</td>								
									<td>0.3</td>
								</tr>
								<tr>
									<td><span itemprop="about"> Irish</td>								
									<td>10.4</td>
								</tr>
								<tr>
									<td><span itemprop="about"> Italian</td>								
									<td>3.6</td>
								</tr>
								<tr>
									<td><span itemprop="about"> Lithuanian</td>								
									<td>0.1</td>
								</tr>
								<tr>
									<td><span itemprop="about"> Norwegian</td>								
									<td>0.3</td>
								</tr>
								<tr>
									<td><span itemprop="about"> Polish</td>								
									<td>1.7</td>
								</tr>
								
								<tr>
									<td><span itemprop="about"> Portuguese</td>								
									<td>0.2</td>
								</tr>
								<tr>
									<td><span itemprop="about"> Russian</td>								
									<td>0.6</td>
								</tr>
								<tr>
									<td><span itemprop="about"> Scotch-Irish</td>								
									<td>1.8</td>
								</tr>
								
								<tr>
									<td><span itemprop="about"> Scottish</td>								
									<td>2.6</td>
								</tr>
								
								<tr>
									<td><span itemprop="about"> Slovak</td>								
									<td>0.1</td>
								</tr>
								
								<tr>
									<td><span itemprop="about"> Subsaharan African</td>								
									<td>0.5</td>
								</tr>
								
								<tr>
									<td><span itemprop="about"> Swedish</td>								
									<td>0.5</td>
								</tr>
								
								<tr>
									<td><span itemprop="about"> Swiss</td>								
									<td>0.3</td>
								</tr>
								
								<tr>
									<td><span itemprop="about"> Ukrainian</td>								
									<td>0.2</td>
								</tr>
								
								<tr>
									<td><span itemprop="about"> Welsh</td>								
									<td>0.5</td>
								</tr>
								<tr>
									<td><span itemprop="about"> West Indian (excluding Hispanic origin groups)</td>								
									<td>0.3</td>
								</tr>
									
								
																		
								
							</tbody>
						</table>
					</div>		
				</div>
			</div>						
			
					
		</div>	

					
		</div>
		</div>	
		
		</div>
		

					
		<div itemscope itemtype="http://schema.org/Dataset">
<div id = "computers" class="panel panel-default">
		
			<div class="panel-heading">
				<h3 class="panel-title"><span itemprop="about">Computers and Internet use in <span itemprop="spatial">Charleston-North Charleston </h3>
			</div>			
			<div  class="panel-body">
			<div class = "col-xs-12">		
			<p>	Total Households : <span class="label label-primary">(X)</span></p>
			<p>	<span itemprop="about">Households with a Computer : <span class="label label-primary">(X) </span></p>
			<p>	<span itemprop="about">Households with a broadband internet subscription : <span class="label label-primary">(X) </span></p>
			</div>	
			</div>		
	
					
		</div>	
</div>
					
		</div>
		
	<div class="col-xs-2" ">
	
	<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Censtat-sidebar-1 -->
<ins class="adsbygoogle"
     style="display:inline-block;width:300px;height:600px"
     data-ad-client="ca-pub-3154845825068093"
     data-ad-slot="2257010960"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>
	</div>
	</div>

		
		