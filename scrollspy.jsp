
<style type="text/css">
/* Custom Styles */
ul.nav-tabs {
	width: 140px;
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
          console.log("Loaded ");
          drawchart('male_female');
          drawchart('race');
          drawchart('hispanic');
          });
   
    function drawchart(chartId)
        {
            console.log("received to render"+chartId);
            var chart1;
        
            chart1 = new Highcharts.Chart({
         chart: {
             renderTo: chartId,
             type: 'bar'
         },
         title: {
             text: 'Fruit Consumption'
         },
         xAxis: {
             categories: ['Apples', 'Bananas', 'Oranges']
         },
         yAxis: {
             title: {
                 text: 'Fruit eaten'
             }
         },
         series: [{
             name: 'Jane',
             data: [1, 0, 4]
         }, {
             name: 'John',
             data: [5, 7, 3]
         }]
     });
        }
        
    </script>    
  
<div class="container">
  
    <div class="row">
        <div class="col-xs-3" id="myScrollspy">
            <ul class="nav nav-tabs nav-stacked affix-top" data-spy="affix" data-offset-top="125">
                <li class="active"><a href="#section-1">Sex and Age</a></li>
                <li><a href="#section-2">Race</a></li>
                <li><a href="#section-3">Hispanic or Latino</a></li>
               
            </ul>
        </div>
        <div class="col-xs-9">
            <h3 id="section-1">Sex and Age</h3>
             <p>Male vs Female percentage breakdown in San Jose  </p>    
            <p>Total population of San Jose:  <span class="label label-primary">122011</span></p>
                    
			<div id="male_female" style="min-width: 150px; height: 250px; max-width: 600px; margin: 0 auto"></div>
               <hr>

	 <p>Male vs Female percentage for population that is 18 years and over </p>  
     <p>Total population 18 years and over :  <span class="label label-primary">240,438,180</span></p>
           
          
            
            <hr>
            <h3 id="section-2">Race</h3>
            
            <div id="race" style="min-width: 150px; height: 250px; max-width: 600px; margin: 0 auto"></div>
               <hr>
          
           
            
            <hr>
            <h3 id="section-3">Hispanic or Latino and Race</h3>
            <div id="hispanic" style="min-width: 150px; height: 250px; max-width: 600px; margin: 0 auto"></div>
               <hr>
           
           
            <hr>
       
        </div>
    </div>
</div>
                                			                            			