<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="header.jsp"%>
<title>HeroesClash</title>
</head>
<body>
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
			
			<img class="card-img-top" style="width: 50%; height: 50%" src="${pageContext.request.contextPath}/resources/img/${user.hero.name}.png">
			
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
	<button type="button" class="btn btn-success">Take a pill to gain +10 Hp</button>
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



<h1>FIGHT: </h1>
	<br>Id: ${user.id}
	<br>User: ${user.name}
	<br>Czas narodzin: ${user.created}
	<br>Hero: ${hero.name}
	<br>Życie: ${hero.hp}
	<br>Umiejętności: ${hero.skills}
	<br>Zwinność: ${hero.agility}
	<br>Siła: ${hero.strength}
	<br>
	<br>
	<br>Enemy: ${enemy.name}
	<br>Życie: ${enemy.hp}
	<br>Umiejętności: ${enemy.skills}
	<br>Zwinność: ${enemy.agility}
	<br>Siła: ${enemy.strength}
	
	
	
	
	<br> --
	<a href="${pageContext.request.contextPath}/user/fight">FIGHT!</a>
	<br> --
	<a href="${pageContext.request.contextPath}/lobby">RUN AWAY!</a>
<%@ include file="footer.jsp"%>
</body>
</html>