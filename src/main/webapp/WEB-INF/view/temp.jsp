<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>

	<head>
	
	<title> Strona glowna</title>
	
	<!-- reference our style sheet -->
	
	<link type="text/css"
			rel="stylesheet"
			href="${pageContext.request.contextPath}/resources/css/background.css" />
	
	<link type="text/css"
			rel="stylesheet"
			href="${pageContext.request.contextPath}/resources/css/main-panel.css" />
			
	</head>
			
<body>
	
	<div class="container">
	
		<div id="ban" class="banner">
			<img width=100% height=100: src="<c:url value="/resources/images/banner.png"/>"/>
    	</div>
	    
	    <div class="header">
		    	<h2>STRONA GLOWNA APLIKACJI</h2>
	    </div>
	    
		<div class="asideContent">
	
			<div class="aside">

				<dl>
					<dt><a href="/login/loginOk">Strona glowna</a></dt>
					<dt><a href="/person/showPerson">Pokaz osoby</a></dt>
					<dt><a href="/login/showLogin">Ostatnie logowania</a></dt>
					<dt><a href="/measurement/showMeasurement">Dostepne pomiary</a></dt>
					
					<br><br><br>
					
					<dt><a href="/person/showFormForAdd">Dodaj uzytkownika</a></dt>
					<dt><a href="/">Wyloguj</a></dt>

				</dl>
		    </div>
		    
		    <div id="outer" class="content">
				<div id="inner">
					<label id="tekstDiv">Czesc glowna systemu</label>


					<!-- Add a logout button -->
					<form:form action="${pageContext.request.contextPath}/logout"
							   method="POST">

						<input type="submit" value="Logout" />

					</form:form>



				</div>	
		    </div>
	    
	    </div>
	    
	    <div class="footer">
			<h4>Copyright � Damian Polchlopek. All Rights Reserved.</h4>
	    </div>


	</div>

	
</body>


</html>
