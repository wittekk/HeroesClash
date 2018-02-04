<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="header.jsp"%>
<title>HeroesClash</title>
</head>
<body>
<div class="forest text-center">
	<p style="font-size: 50px">FOREST</p>
	<div class="container">
	  <div class="row infopromt">  
	    <div class="col">
		<br>	
			<div class="card mb-4 box-shadow"><br>
				<div class="container">
				<h4>Hero: <strong>${user.hero.name} ${user.name}</strong></h4>					
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
						<h1 class="zdrowie"><strong>${user.hero.hp}</strong></h1>
						</div>
					</div>
				</div>
			</div>			
	    </div>
    	<div class="col">
			<br>
	    	<div class="card mb-4 box-shadow"><br>
				<div class="container">
					<div class="">
				    	<br><h3>Znalazłeś:<br><br><br><strong>${find}</strong><br><br><br></h3>
					</div>		
				</div>
			</div>				
				<p class="text-center"><a href="${pageContext.request.contextPath}/user/forest">
				<button type="button" class="btn btn-success">SEARCH MORE</button>
				</a></p>
				<br>
				<p class="text-center"><a href="${pageContext.request.contextPath}/lobby">
				<button type="button" class="btn btn-success">RETURN TO LOBBY</button>
				</a></p>
	    	</div>	    	
		</div>		
	</div>
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