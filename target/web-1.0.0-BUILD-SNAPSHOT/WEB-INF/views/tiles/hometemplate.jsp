<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="google-site-verification" content="VNpGNvQU9hUV3r34Z_TaXoWJCqRikB8MJln1TAauGrU" />
<meta name="msvalidate.01" content="29B12AA60A1EBF1828929BEFC9F4A915" />
<meta name="description" content="<tiles:insertAttribute name="title" ignore="true"></tiles:insertAttribute>"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/WEB-INF/views/include/head-include.jsp" />
<title><tiles:insertAttribute name="title" ignore="true"></tiles:insertAttribute>
</title>
</head>
<body>

	<div>
		<tiles:insertAttribute name="header"></tiles:insertAttribute>
	</div>	
	<div>
		<tiles:insertAttribute name="homecontent"></tiles:insertAttribute>
	</div>
	<div>
		<tiles:insertAttribute name="aboutus"></tiles:insertAttribute>
	</div>
	<div>
		<tiles:insertAttribute name="privacy"></tiles:insertAttribute>
	</div>
	<div>
		<tiles:insertAttribute name="contactus"></tiles:insertAttribute>
	</div>
	<div>
		<tiles:insertAttribute name="comments"></tiles:insertAttribute>
	</div>
	<div>			
		<tiles:insertAttribute name="footer"></tiles:insertAttribute>
	</div>
</body>
</html>