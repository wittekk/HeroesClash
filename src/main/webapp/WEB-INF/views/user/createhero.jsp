<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="header.jsp"%>
<title>HeroesClash</title>
</head>
<body class="text-center">
	<p style="font-size: 50px">CREATE YOUR HERO</p>
	<br>
	
	<div class="container">
		<div class="row">		
			<div class="col-sm"><p class="text-center"><a href="${pageContext.request.contextPath}/user/hero/soldier">
			<img class="createimg" alt="" src="${pageContext.request.contextPath}/resources/img/SOLDIER.png" style="width: 70%; height: 70%">			
			</a><br><h3>SOLDIER</h3>
			<h5>Skills:90 Agility: 120 Strength: 150</h5>			
			</p></div>
						
			<div class="col-sm"><p class="text-center"><a href="${pageContext.request.contextPath}/user/hero/wizard">
			<img  class="createimg" alt="" src="${pageContext.request.contextPath}/resources/img/WIZARD.png" style="width: 75%; height: 75%">
			</a><br><h3>WIZARD</h3>
			<h5>Skills:150 Agility: 90 Strength: 120</h5>
			</p></div>
			
			<div class="col-sm">><p class="text-center"><a href="${pageContext.request.contextPath}/user/hero/athlete">
			<img class="createimg" alt="" src="${pageContext.request.contextPath}/resources/img/ATHLETE.png" style="width: 80%; height: 80%">
			</a><br><h3>ATHLETE</h3>
			<h5>Skills:120 Agility: 150 Strength: 90</h5>
			</p></div>						
		</div>
		<h1>CHOOSE YOUR TYPE</h1>
	</div><br>
<br>
<br>
<br>
<br>
	<a href="${pageContext.request.contextPath}/">Log out</a>
	<br>
<br>
<br>
<br>
<%@ include file="footer.jsp"%>
</body>
</html>