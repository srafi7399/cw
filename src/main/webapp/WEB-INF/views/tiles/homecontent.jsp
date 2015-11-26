<!-- Carousel
================================================== -->
<div id="myCarousel" class="carousel slide">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="item active">
      <img src="${pageContext.request.contextPath}/images/city1.jpg" style="width:100%" class="img-responsive">
      <div class="container">
        <div class="carousel-caption">
          <h1>Detailed and Informative Profiles of over 5000 places in the United States including all the States, Counties, Cities, Metros and Micros</h1>
        
        </div>
      </div>
    </div>
    <div class="item">
      <img src="${pageContext.request.contextPath}/images/city5.jpg" class="img-responsive">
      <div class="container">
        <div class="carousel-caption">
          <h1>Social and Demographic Data including data on Race, Relationships, Education Attainment, School Enrollment etc.</h1>      
         
        </div>
      </div>
    </div>
    <div class="item">
      <img src="${pageContext.request.contextPath}/images/city4.jpg" class="img-responsive">
      <div class="container">
        <div class="carousel-caption">
          <h1>Informative profiles with Graphs and Charts of over 5000 places which illustrate data in exquisite detail. </h1>             
        </div>
      </div>
    </div>
  </div>
  <!-- Controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="icon-prev"></span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="icon-next"></span>
  </a>  
</div>

<script type="text/javascript">
  var $ = jQuery.noConflict();
  $(document).ready(function() { 
      $('#myCarousel').carousel({ interval: 5000, cycle: true });
  }); 
</script>
<!-- /.carousel -->
<style type="text/css">
.carousel-caption {
   position: absolute;
   top:-40px
}
</style>

		
			
