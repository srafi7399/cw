<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx" %>	
<tilesx:useAttribute name="current"/>

		<div class="row">
			<div class="col-xs-8">
				<nav class="navbar navbar-default">
					<div class="container-fluid">
						<div class="navbar-header">
							<a class="navbar-brand" href="#"><img src="${pageContext.request.contextPath}/images/logo1.png" alt="" ></a>
						</div>
						<div>
							<ul class="nav navbar-nav">
								<li class="${current =='home'?'active' : ''}"><a href="${pageContext.request.contextPath}/" >Home</a></li>	
								<li class="${current =='states'?'active': ''}"><a href="${pageContext.request.contextPath}/states">States Data</a></li>	
							
							
							<%-- <li class="${current =='content'?'active': ''}"><a href="${pageContext.request.contextPath}/content">Metros Data</a> --%>
								 <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Metros Data <span class="caret"></span></a>
                <ul class="dropdown-menu">                 
                  										
					
					<li><a href="/states/Alabama/metros-Alabama">Alabama</a></li>
					<li><a href="/states/Alaska/metros-Alaska">Alaska</a></li>
					<li><a href="/states/Arizona/metros-Arizona">Arizona</a></li>
					<li><a href="/states/Arkansas/metros-Arkansas">Arkansas</a></li>
					<li><a href="/states/California/metros-California">California</a></li>
					<li><a href="/states/Colorado/metros-Colorado">Colorado</a></li>
					<li><a href="/states/Connecticut/metros-Connecticut">Connecticut</a></li>
					<li><a href="/states/Delaware/metros-Delaware">Delaware</a></li>
					<li><a href="/states/District-of-Columbia/metros-District-of-Columbia">District of Columbia</a></li>
					<li><a href="/states/Florida/metros-Florida">Florida</a></li>
					<li><a href="/states/Georgia/metros-Georgia">Georgia</a></li>
					<li><a href="/states/Hawaii/metros-Hawaii">Hawaii</a></li>
					<li><a href="/states/Idaho/metros-Idaho">Idaho</a></li>
					<li><a href="/states/Illinois/metros-Illinois">Illinois</a></li>
					<li><a href="/states/Indiana/metros-Indiana">Indiana</a></li>
					<li><a href="/states/Iowa/metros-Iowa">Iowa</a></li>
					<li><a href="/states/Kansas/metros-Kansas">Kansas</a></li>
					<li><a href="/states/Kentucky/metros-Kentucky">Kentucky</a></li>
					<li><a href="/states/Louisiana/metros-Louisiana">Louisiana</a></li>
					<li><a href="/states/Maine/metros-Maine">Maine</a></li>
					<li><a href="/states/Maryland/metros-Maryland">Maryland</a></li>
					<li><a href="/states/Massachusetts/metros-Massachusetts">Massachusetts</a></li>
					<li><a href="/states/Michigan/metros-Michigan">Michigan</a></li>
					<li><a href="/states/Minnesota/metros-Minnesota">Minnesota</a></li>
					<li><a href="/states/Mississippi/metros-Mississippi">Mississippi</a></li>
					<li><a href="/states/Missouri/metros-Missouri">Missouri</a></li>
					<li><a href="/states/Montana/metros-Montana">Montana</a></li>
					<li><a href="/states/Nebraska/metros-Nebraska">Nebraska</a></li>
					<li><a href="/states/Nevada/metros-Nevada">Nevada</a></li>
					<li><a href="/states/New-Hampshire/metros-New-Hampshire">New Hampshire</a></li>
					<li><a href="/states/New-Jersey/metros-New-Jersey">New Jersey</a></li>
					<li><a href="/states/New-Mexico/metros-New-Mexico">New Mexico</a></li>
					<li><a href="/states/New-York/metros-New-York">New York</a></li>
					<li><a href="/states/North-Carolina/metros-North-Carolina">North Carolina</a></li>
					<li><a href="/states/North-Dakota/metros-North-Dakota">North Dakota</a></li>
					<li><a href="/states/Ohio/metros-Ohio">Ohio</a></li>
					<li><a href="/states/Oklahoma/metros-Oklahoma">Oklahoma</a></li>
					<li><a href="/states/Oregon/metros-Oregon">Oregon</a></li>
					<li><a href="/states/Pennsylvania/metros-Pennsylvania">Pennsylvania</a></li>
					<li><a href="/states/Rhode-Island/metros-Rhode-Island">Rhode Island</a></li>
					<li><a href="/states/South-Carolina/metros-South-Carolina">South Carolina</a></li>
					<li><a href="/states/South-Dakota/metros-South-Dakota">South Dakota</a></li>
					<li><a href="/states/Tennessee/metros-Tennessee">Tennessee</a></li>
					<li><a href="/states/Texas/metros-Texas">Texas</a></li>
					<li><a href="/states/Utah/metros-Utah">Utah</a></li>
					<li><a href="/states/Vermont/metros-Vermont">Vermont</a></li>
					<li><a href="/states/Virginia/metros-Virginia">Virginia</a></li>
					<li><a href="/states/Washington/metros-Washington">Washington</a></li>
					<li><a href="/states/West-Virginia/metros-West-Virginia">West Virginia</a></li>
					<li><a href="/states/Wisconsin/metros-Wisconsin">Wisconsin</a></li>
					<li><a href="/states/Wyoming/metros-Wyoming">Wyoming</a></li>
					<li><a href="/states/Puerto-Rico/metros-Puerto-Rico">Puerto Rico</a></li>
					 <li role="separator" class="divider"></li>
					         
                 
                </ul>
              </li>		
								
								<%-- <li class="${current =='content'?'active': ''}"><a href="${pageContext.request.contextPath}/content">Cities Data</a> --%>
								 <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Cities Data <span class="caret"></span></a>
                <ul class="dropdown-menu">    
					
						<li><a href="/states/Alabama/cities-Alabama">Alabama</a></li>
						<li><a href="/states/Alaska/cities-Alaska">Alaska</a></li>
						<li><a href="/states/Arizona/cities-Arizona">Arizona</a></li>
						<li><a href="/states/Arkansas/cities-Arkansas">Arkansas</a></li>
						<li><a href="/states/California/cities-California">California</a></li>
						<li><a href="/states/Colorado/cities-Colorado">Colorado</a></li>
						<li><a href="/states/Connecticut/cities-Connecticut">Connecticut</a></li>
						<li><a href="/states/Delaware/cities-Delaware">Delaware</a></li>
						<li><a href="/states/District-of-Columbia/cities-District-of-Columbia">District of Columbia</a></li>
						<li><a href="/states/Florida/cities-Florida">Florida</a></li>
						<li><a href="/states/Georgia/cities-Georgia">Georgia</a></li>
						<li><a href="/states/Hawaii/cities-Hawaii">Hawaii</a></li>
						<li><a href="/states/Idaho/cities-Idaho">Idaho</a></li>
						<li><a href="/states/Illinois/cities-Illinois">Illinois</a></li>
						<li><a href="/states/Indiana/cities-Indiana">Indiana</a></li>
						<li><a href="/states/Iowa/cities-Iowa">Iowa</a></li>
						<li><a href="/states/Kansas/cities-Kansas">Kansas</a></li>
						<li><a href="/states/Kentucky/cities-Kentucky">Kentucky</a></li>
						<li><a href="/states/Louisiana/cities-Louisiana">Louisiana</a></li>
						<li><a href="/states/Maine/cities-Maine">Maine</a></li>
						<li><a href="/states/Maryland/cities-Maryland">Maryland</a></li>
						<li><a href="/states/Massachusetts/cities-Massachusetts">Massachusetts</a></li>
						<li><a href="/states/Michigan/cities-Michigan">Michigan</a></li>
						<li><a href="/states/Minnesota/cities-Minnesota">Minnesota</a></li>
						<li><a href="/states/Mississippi/cities-Mississippi">Mississippi</a></li>
						<li><a href="/states/Missouri/cities-Missouri">Missouri</a></li>
						<li><a href="/states/Montana/cities-Montana">Montana</a></li>
						<li><a href="/states/Nebraska/cities-Nebraska">Nebraska</a></li>
						<li><a href="/states/Nevada/cities-Nevada">Nevada</a></li>
						<li><a href="/states/New-Hampshire/cities-New-Hampshire">New Hampshire</a></li>
						<li><a href="/states/New-Jersey/cities-New-Jersey">New Jersey</a></li>
						<li><a href="/states/New-Mexico/cities-New-Mexico">New Mexico</a></li>
						<li><a href="/states/New-York/cities-New-York">New York</a></li>
						<li><a href="/states/North-Carolina/cities-North-Carolina">North Carolina</a></li>
						<li><a href="/states/North-Dakota/cities-North-Dakota">North Dakota</a></li>
						<li><a href="/states/Ohio/cities-Ohio">Ohio</a></li>
						<li><a href="/states/Oklahoma/cities-Oklahoma">Oklahoma</a></li>
						<li><a href="/states/Oregon/cities-Oregon">Oregon</a></li>
						<li><a href="/states/Pennsylvania/cities-Pennsylvania">Pennsylvania</a></li>
						<li><a href="/states/Rhode-Island/cities-Rhode-Island">Rhode Island</a></li>
						<li><a href="/states/South-Carolina/cities-South-Carolina">South Carolina</a></li>
						<li><a href="/states/South-Dakota/cities-South-Dakota">South Dakota</a></li>
						<li><a href="/states/Tennessee/cities-Tennessee">Tennessee</a></li>
						<li><a href="/states/Texas/cities-Texas">Texas</a></li>
						<li><a href="/states/Utah/cities-Utah">Utah</a></li>
						<li><a href="/states/Vermont/cities-Vermont">Vermont</a></li>
						<li><a href="/states/Virginia/cities-Virginia">Virginia</a></li>
						<li><a href="/states/Washington/cities-Washington">Washington</a></li>
						<li><a href="/states/West-Virginia/cities-West-Virginia">West Virginia</a></li>
						<li><a href="/states/Wisconsin/cities-Wisconsin">Wisconsin</a></li>
						<li><a href="/states/Wyoming/cities-Wyoming">Wyoming</a></li>
						<li><a href="/states/Puerto-Rico/cities-Puerto-Rico">Puerto Rico</a></li>
					 <li role="separator" class="divider"></li>
                </ul>
              </li>		
								
							<%-- 	<li class="${current =='content'?'active': ''}"><a href="${pageContext.request.contextPath}/content">Counties Data</a> --%>
								 <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Counties Data <span class="caret"></span></a>
                <ul class="dropdown-menu">                  

					<li><a href="/states/Alabama/counties-Alabama">Alabama</a></li>
					<li><a href="/states/Alaska/counties-Alaska">Alaska</a></li>
					<li><a href="/states/Arizona/counties-Arizona">Arizona</a></li>
					<li><a href="/states/Arkansas/counties-Arkansas">Arkansas</a></li>
					<li><a href="/states/California/counties-California">California</a></li>
					<li><a href="/states/Colorado/counties-Colorado">Colorado</a></li>
					<li><a href="/states/Connecticut/counties-Connecticut">Connecticut</a></li>
					<li><a href="/states/Delaware/counties-Delaware">Delaware</a></li>
					<li><a href="/states/District-of-Columbia/counties-District-of-Columbia">District of Columbia</a></li>
					<li><a href="/states/Florida/counties-Florida">Florida</a></li>
					<li><a href="/states/Georgia/counties-Georgia">Georgia</a></li>
					<li><a href="/states/Hawaii/counties-Hawaii">Hawaii</a></li>
					<li><a href="/states/Idaho/counties-Idaho">Idaho</a></li>
					<li><a href="/states/Illinois/counties-Illinois">Illinois</a></li>
					<li><a href="/states/Indiana/counties-Indiana">Indiana</a></li>
					<li><a href="/states/Iowa/counties-Iowa">Iowa</a></li>
					<li><a href="/states/Kansas/counties-Kansas">Kansas</a></li>
					<li><a href="/states/Kentucky/counties-Kentucky">Kentucky</a></li>
					<li><a href="/states/Louisiana/counties-Louisiana">Louisiana</a></li>
					<li><a href="/states/Maine/counties-Maine">Maine</a></li>
					<li><a href="/states/Maryland/counties-Maryland">Maryland</a></li>
					<li><a href="/states/Massachusetts/counties-Massachusetts">Massachusetts</a></li>
					<li><a href="/states/Michigan/counties-Michigan">Michigan</a></li>
					<li><a href="/states/Minnesota/counties-Minnesota">Minnesota</a></li>
					<li><a href="/states/Mississippi/counties-Mississippi">Mississippi</a></li>
					<li><a href="/states/Missouri/counties-Missouri">Missouri</a></li>
					<li><a href="/states/Montana/counties-Montana">Montana</a></li>
					<li><a href="/states/Nebraska/counties-Nebraska">Nebraska</a></li>
					<li><a href="/states/Nevada/counties-Nevada">Nevada</a></li>
					<li><a href="/states/New-Hampshire/counties-New-Hampshire">New Hampshire</a></li>
					<li><a href="/states/New-Jersey/counties-New-Jersey">New Jersey</a></li>
					<li><a href="/states/New-Mexico/counties-New-Mexico">New Mexico</a></li>
					<li><a href="/states/New-York/counties-New-York">New York</a></li>
					<li><a href="/states/North-Carolina/counties-North-Carolina">North Carolina</a></li>
					<li><a href="/states/North-Dakota/counties-North-Dakota">North Dakota</a></li>
					<li><a href="/states/Ohio/counties-Ohio">Ohio</a></li>
					<li><a href="/states/Oklahoma/counties-Oklahoma">Oklahoma</a></li>
					<li><a href="/states/Oregon/counties-Oregon">Oregon</a></li>
					<li><a href="/states/Pennsylvania/counties-Pennsylvania">Pennsylvania</a></li>
					<li><a href="/states/Rhode-Island/counties-Rhode-Island">Rhode Island</a></li>
					<li><a href="/states/South-Carolina/counties-South-Carolina">South Carolina</a></li>
					<li><a href="/states/South-Dakota/counties-South-Dakota">South Dakota</a></li>
					<li><a href="/states/Tennessee/counties-Tennessee">Tennessee</a></li>
					<li><a href="/states/Texas/counties-Texas">Texas</a></li>
					<li><a href="/states/Utah/counties-Utah">Utah</a></li>
					<li><a href="/states/Vermont/counties-Vermont">Vermont</a></li>
					<li><a href="/states/Virginia/counties-Virginia">Virginia</a></li>
					<li><a href="/states/Washington/counties-Washington">Washington</a></li>
					<li><a href="/states/West-Virginia/counties-West-Virginia">West Virginia</a></li>
					<li><a href="/states/Wisconsin/counties-Wisconsin">Wisconsin</a></li>
					<li><a href="/states/Wyoming/counties-Wyoming">Wyoming</a></li>
					<li><a href="/states/Puerto-Rico/counties-Puerto-Rico">Puerto Rico</a></li>                 
                  <li role="separator" class="divider"></li>
                  
                </ul>
              </li>		
        					
													
								<li class="${current =='content'?'active': ''}"><a href="${pageContext.request.contextPath}/content">US Population 2010-2014</a></li>
								
						
						</div>
					</div>
				</nav>
			</div>
			<div class = "col-xs-4">
								<script>
  (function() {
    var cx = '011245945743919040848:kfpqewvofvi';
    var gcse = document.createElement('script');
    gcse.type = 'text/javascript';
    gcse.async = true;
    gcse.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') +
        '//cse.google.com/cse.js?cx=' + cx;
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(gcse, s);
  })();
</script>
<gcse:search></gcse:search>
</div>
		</div>
		
		

	<script>	
		$(document).ready(function() {	
			console.log(document.title);
			if (document.title === 'Unites States Population 2010-2014') {
				console.log("Loading....Data");
				loadPopulationData("United States");
			}

		});
	</script>
	  
	

