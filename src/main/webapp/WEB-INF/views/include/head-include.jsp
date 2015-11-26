

<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="http://code.highcharts.com/modules/data.js"></script>
<script src="http://code.highcharts.com/modules/exporting.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.2/handlebars.js"></script> -->


	

<script type="text/javascript">
var chartView='PopEstimatesAll';
var chartName='United States';
 /*  $(document).ready(function () {
	loadPopulationData("United States");
	
	
});    
   */
   var nameofCommenter;
   var emailOfCommenter;
   var comments;
   
   function postComments(nameofCommenter,emailOfCommenter,comments)
   {
	   
	   console.log('Posting Comment');
   }
  
	function loadPopulationData(nameofchart) {
		chartName=nameofchart;
		$.ajax({
			url : 'population',
			type : "GET",
			data : {
				name : nameofchart
			},
			headers: {
		        'typeofchart':chartView,
		        'nameofchart':chartName,
		          },
			dataType : "json",
			contentType : "application/json"
		}).success(function(data) {
			
			var typeOfChartToDisplay='bar';
			var processed_json ;
			var categoriesD ;		
			var seriesFinal = new Array();
			var chartTitle;
			var dataArray = new Array();
			dataArray=JSON.stringify(data);			
		
			if(nameofchart=='All Regions')
				{
				typeOfChartToDisplay='column';
				}
			
			$.each(data, function(idx, obj) {
				
				$(obj).each(function(key, value){
		            		            
		            if (chartView=='PopEstimatesAll') {
		            	
		            	 var seriesData = {
		 				        name: '',
		 				        data: []
		 			 };
						chartTitle='Population Estimates for '+nameofchart	
						categoriesD= new Array();
						processed_json= new Array();
						
						processed_json.push(obj.POPESTIMATE2010);
						categoriesD.push("2010");
						processed_json.push(obj.POPESTIMATE2011);
						categoriesD.push("2011");
						processed_json.push(obj.POPESTIMATE2012);
						categoriesD.push("2012");
						processed_json.push(obj.POPESTIMATE2013);
						categoriesD.push("2013");
						processed_json.push(obj.POPESTIMATE2014);
						categoriesD.push("2014");
						seriesData.name=value.NAME;
						seriesData.data=processed_json; 
						seriesFinal.push(seriesData);
						
										   
					}
		            else if (chartView=='PopEstimatesNum') {
						chartTitle='Numeric Change in population for '+nameofchart
						 var seriesData = {
						        name: '',
						        data: []
					 };
						
						categoriesD= new Array();
						processed_json= new Array();
						processed_json.push(obj.NPOPCHG_2010);
						categoriesD.push("2010");
						processed_json.push(obj.NPOPCHG_2011);
						categoriesD.push("2011");
						processed_json.push(obj.NPOPCHG_2012);
						categoriesD.push("2012");
						processed_json.push(obj.NPOPCHG_2013);
						categoriesD.push("2013");
						processed_json.push(obj.NPOPCHG_2014);
						categoriesD.push("2014");
						seriesData.name=value.NAME;
						seriesData.data=processed_json;
						seriesFinal.push(seriesData);
						
					}
					else if (chartView=='PopEstimatesPer')
						{
						chartTitle='Percentage change in Population for '+nameofchart
						 var seriesData = {
						        name: '',
						        data: []
					 };
						
						categoriesD= new Array();
						processed_json= new Array();
						processed_json.push(obj.PPOPCHG_2010);
						categoriesD.push("2010");
						processed_json.push(obj.PPOPCHG_2011);
						categoriesD.push("2011");
						processed_json.push(obj.PPOPCHG_2012);
						categoriesD.push("2012");
						processed_json.push(obj.PPOPCHG_2013);
						categoriesD.push("2013");
						processed_json.push(obj.PPOPCHG_2014);
						categoriesD.push("2014");
						seriesData.name=value.NAME;
						seriesData.data=processed_json;
						seriesFinal.push(seriesData);
						
						}
				});			
							
			});
			
			
			$('#ActualPane').highcharts({
		        chart: {
		            type: typeOfChartToDisplay
		        },
		        title: {
		            text: chartTitle
		        },
		        subtitle: {
		            text: 'Source:- US Govt Census'
		        },
		        xAxis: {		        	
		        		categories:categoriesD                    
                },
                
		        yAxis: {
		         
		            title: {
		                text: 'Population'
		            }
		        },
		        tooltip: {
		            headerFormat: '<span style="font-size:12px">{point.key}</span><table>',
		            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
		                '<td style="padding:0"><b>{point.y:.1f} </b></td></tr>',
		            footerFormat: '</table>',
		            shared: true,
		            useHTML: true
		        },
		        plotOptions: {
		            column: {
		                pointPadding: 0.2,
		                borderWidth: 0,		                
		            },
		        series: {
	                colorByPoint: true,
	                dataLabels: {
	                    enabled: true,
	                    inside:true
	                }
	            }
		        	
		        },		        
                series:seriesFinal,
		    });
			
			
			
			 
		})

	}
</script>

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-61118421-1', 'auto');
  ga('send', 'pageview');

</script>
    <style type="text/css">

      /* Sticky footer styles
      -------------------------------------------------- */

      html,
      body {
        height: 100%;
        /* The html and body elements cannot have any padding or margin. */
      }

      /* Wrapper for page content to push down footer */
      #wrap {
        min-height: 10%;
        height: auto !important;
        height: 100%;
        /* Negative indent footer by it's height */
        margin: 0 auto -60px;
      }

      /* Set the fixed height of the footer here */
      #push,
      #footer {
        height: 60px;
      }
      #footer {
        background-color: #f5f5f5;
      }

      /* Lastly, apply responsive CSS fixes as necessary */
      @media (max-width: 767px) {
        #footer {
          margin-left: -20px;
          margin-right: -20px;
          padding-left: 20px;
          padding-right: 20px;
        }
      }


    

    </style>