<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>

<%@	taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="header.jsp"%>
<title>HeroesClash</title>
</head>

<body class="text-center">
	<p style="font-size:50px">HEROES CLASH</p>	
	<div class="container-fluid">
		<p style="text-align:center"><img alt="" src="${pageContext.request.contextPath}/resources/img/herosign.png" style="width: 30%; height: 30%"></p>		
	</div>
	<div class="container-fluid">
		<form:form modelAttribute="user" method="post">
			<form:hidden path="id" />			
			<div class="row">
	  			<div class="col-md-2 offset-md-5">								
					<form:input path="name" class="form-control input" placeholder="Hero name" style="line-height:1em"/>
					<br>			
					<form:input path="password" class="form-control input" id="password" placeholder="Password" type="password" style="line-height:1em"/>
					<br>
					<form:button type="submit" class="btn btn-sm btn-dark btn-block">Let's get in</form:button>
				</div>
			</div>
		</form:form>
	</div>
	<br>
	<br>
	<h2>Ranking of heros</h2>	
	<table class="table">
		<thead>
			<tr>				
				<th scope="col">Position:</th>
				<th scope="col">Hero:</th>
				<th scope="col">Type:</th>
				<th scope="col">Wins:</th>
				<th scope="col">Loses:</th>
				<th scope="col">Date of Birth:</th>
				<th scope="col">Last visit:</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${usersall}" var="singleUser" varStatus="loop">
			<tr>
				<th scope="row">${loop.index+1}</th>
				<td>${singleUser.name}</td>
				<td>${singleUser.hero.name}</td>
				<td>${singleUser.win}</td>
				<td>${singleUser.lose}</td>
				<td>${singleUser.created}</td>
				<td>${singleUser.updated}</td>
			</c:forEach>

		</tbody>
	</table>
<%@ include file="footer.jsp"%>
</body>
</html>