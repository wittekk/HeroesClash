<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="header.jsp"%>
<title>HeroesClasheClash</title>
</head>
<body class="text-center lose">
	<div class="lose">
		<br>		
		<p style="font-size: 200px">YOU LOSE!</p>			
		
		<img class="card-img-top" style="width: 30%; height: 30%" src="${pageContext.request.contextPath}/resources/img/lose.png">
		<br>
		<a href="${pageContext.request.contextPath}/lobby">
			<button type="button" class="btn btn-warning"><h1>BACK TO LOBBY</h1></button>			
		</a>
	</div>	
<%@ include file="footer.jsp"%>	
</body>
</html>