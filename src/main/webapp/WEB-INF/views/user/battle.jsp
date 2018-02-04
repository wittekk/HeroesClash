<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="header.jsp"%>
<title>HeroesClash</title>
</head>
<body>
<p style="font-size: 50px">REDY FOR BATTLE?</p>
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
    </div>    
	    <div class="col">
	    	<br>
	    	<br>
	    	<br>
	    	<br>
	    	<br>
	    	<br>
	    	<br>
	    	<br>
	    	<br>	    		    	
	    	<p class="text-center"><a href="${pageContext.request.contextPath}/user/fight">
			<button type="button" class="btn btn-danger"><h1>FIGHT!</h1>
			</button></a></p>
				    		    	
	    	 
		</div>
		<div class="col">
		    <div class="card mb-4 box-shadow"><br>
			<div class="container">			
			<br>
			<h4>Enemy: <strong>${enemy.name}</strong></h4>			
			<br>
			<br>			
			</div>		
			
			<img class="card-img-top" style="width: 50%; height: 50%" src="${pageContext.request.contextPath}/resources/img/ENEMY${enemyfoto}.png">
			
			<div class="card-body">
				<div class="row">
					<div class="col-12 col-md-8">
					<h4>Skills: <strong>${enemy.skills}</strong></h4> 
					<h4>Agility: <strong>${enemy.agility}</strong></h4>  
					<h4>Strength: <strong>${enemy.strength}</strong></h4> 
					</div>
					<div class="col-6 col-md-4">
					<h4>HP: </h4>
					<h1><strong class="zdrowie">${enemy.hp}</strong></h1>
					</div>
				</div>
			</div>			 
		</div>
	</div>
</div>	
<br> 
<p class="text-center"><a href="${pageContext.request.contextPath}/lobby">
<button type="button" class="btn btn-warning"><h3>RUN AWAY!</h3>
</button></a></p>
<br>
<br>
<br>
<br>
<br>
<%@ include file="footer.jsp"%>	
</body>
</html>