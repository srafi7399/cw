<div id="ContentPane" class="col-sm-8"
	style="background-color: lavender;">

	<ul class="nav nav-pills">
		<li data-toggle="pill" id="PopEstimatesTab" class="active"><a
			href="#"
			onclick="chartView='PopEstimatesAll'; loadPopulationData(chartName); return false;">Resident
				Population Estimates</a></li>
		<li><a data-toggle="pill" id="NumEstimatesTab" href="#"
			onclick="chartView='PopEstimatesNum'; loadPopulationData(chartName); return false;">Numeric
				Change in Resident Population </a></li>


		<li><a data-toggle="pill" id="PerEstimatesTab" href="#"
			onclick=" chartView='PopEstimatesPer'; loadPopulationData(chartName);  return false;">Percentage
				Change in Resident Population</a></li>
	</ul>
	<div id="ActualPane" class="form-group"></div>

</div>