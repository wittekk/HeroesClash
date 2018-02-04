<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="header.jsp"%>
<title>HeroesClash</title>
</head>
<body class="text-center">
	<div class="win">
		<br>
		<br>		
		<br>
		<br>
		<br>
		<br>
		<br>
		<br> 
		<p style="font-size: 200px">YOU WIN!</p>
				
		<a href="${pageContext.request.contextPath}/lobby">
			<button type="button" class="btn btn-warning"><h1>BACK TO LOBBY</h1></button>			
		</a>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
	</div>	
<%@ include file="footer.jsp"%>
</body>
</html>