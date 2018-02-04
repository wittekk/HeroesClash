<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="header.jsp"%>
<title>HeroesClash</title>
</head>
<body>
<p style="font-size: 50px">${user.hero.name} LOBBY:</p>
<div class="container">
  <div class="row">
    <div class="col">
		<div class="card mb-4 box-shadow"><br>
			<div class="container">
			<h4>Hero: <strong>${user.name}</strong></h4>
			<h4>Type: <strong>${user.hero.name}</strong></h4>
			<h4>Born: <strong>${user.created}</strong></h4>
			<h4>Stats: <small>Wins: </small><strong>${user.win}</strong>,  <small>Loses: </small><strong>${user.lose}</strong></h4>			
			</div>
			<img class="card-img-top" style="width: 50%; height: 50%" src="${pageContext.request.contextPath}/resources/img/${user.hero.name}1.png">
			<div class="card-body">
				<div class="row">
					<div class="col-12 col-md-8">
					<h4>Skills: <strong>${user.hero.skills}</strong></h4> 
					<h4>Agility: <strong>${user.hero.agility}</strong></h4>  
					<h4>Strength: <strong>${user.hero.strength}</strong></h4> 
					</div>
					<div class="col-6 col-md-4">
					<h4>HP: </h4>
					<h1><strong class="zdrowie">${user.hero.hp}</strong></h1>
					</div>
				</div>
			</div>
		</div>	
	<p class="text-center"><a href="${pageContext.request.contextPath}/user/sleep">
	<button type="button" class="btn btn-success"><i class="fa fa-user-md" style="font-size:25px"></i>  Take a pill to gain +10 Hp</button>
	</a></p>		
    </div>    
	    <div class="col">
		    <div class="">
		    	<img class="card-img-top" style="width: 100%; height: 100%" src="${pageContext.request.contextPath}/resources/img/forest.png">		    	
		    	<p class="text-center"><a href="${pageContext.request.contextPath}/user/forest">
				<button type="button" class="btn btn-success">SEARCH THE FOREST FOR ITEMS</button>
				</a></p> 	
			</div>		
			<br>
			<p class="text-center"><a href="${pageContext.request.contextPath}/user/lookbattle">
			<button type="button" class="btn btn-secondary"><br><h1>LOOK FOR BATTLE!</h1>
			<i class="fa fa-users" style="font-size:50px"></i></button>
			</a></p>			 
		</div>
	</div>
</div>	
	
	. <a href="${pageContext.request.contextPath}/logout">Log out</a><br>

	<h2>Latest enemies conquest:</h2>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">Position:</th>
				<th scope="col">Enemy name:</th>
				<th scope="col">Hp left:</th>
				<th scope="col">Skills:</th>
				<th scope="col">Agility:</th>
				<th scope="col">strength:</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${curentuserenemys}" var="enemy" varStatus="loop">
				<tr>
					<th scope="row">${loop.index+1}</th>
					<td>${enemy.name}</td>
					<td>${enemy.hp}</td>
					<td>${enemy.skills}</td>
					<td>${enemy.agility}</td>
					<td>${enemy.strength}</td>
			</c:forEach>

		</tbody>
	</table>
	<%@ include file="footer.jsp"%>
</body>
</html>