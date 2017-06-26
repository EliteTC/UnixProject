
<%@ page language="java" contentType="text/html;charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>UnixProject</title>

	<!--<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->
	<link rel="stylesheet" type="text/css"
		  href="<c:url value="/sources/libraries/bootstrap/css/bootstrap.min.css"/>">

	<link rel="stylesheet" type="text/css"
		  href="<c:url value="/sources/libraries/css/navblocks.css"/>">
	<link rel="stylesheet" type="text/css"
		  href="<c:url value="/sources/libraries/css/modal.css"/>">
	<link
			href="<c:url value="/sources/libraries/bootstrap/fonts/glyphicons-halflings-regular.woff"/>">
	<link rel="stylesheet" type="text/css"
		  href="<c:url value="/sources/libraries/jquery-ui/css/jquery-ui.css"/>">
	<script
			src="<c:url value="/sources/libraries/jquery/jquery.min.js"/>">
	</script>
	<script type="text/javascript"
			src="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"/> ">

	</script>

	<link
			href="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" />"
			type="text/css" rel="stylesheet" />


	<link href="<c:url value="https://fonts.googleapis.com/css?family=Source+Serif+Pro" />" rel="stylesheet">

	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
			integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
			crossorigin="anonymous"></script>
	<script
			src="<c:url value="/sources/libraries/bootstrap/js/bootstrap.min.js"/>"></script>
	<script src="https://d3js.org/d3.v4.js"></script>

	<script type="text/javascript" src="http://botmonster.com/jquery-bootpag/jquery.bootpag.js"></script>



</head>
<body class="font-serif ">

<nav class="navbar navbar-inverse white" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>

			</button>
		</div>

		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-center">
				<li ><a href="/home" target="_top"><h4 class=" fontsize">Home</h4></a></li>
				<li><a href="/allmarkers" target="_top"><h4 class="fontsize">Places on Map</h4></a> </li>
				<sec:authorize access="hasRole('ROLE_USER')">
					<li><a href="/user/${userId}" target="_top"><h4 class=" fontsize">My posts</h4></a></li>
				</sec:authorize>
				<li><a href="/allposts" target="_top"><h4 class=" fontsize">Blog</h4></a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right black">
				<sec:authorize access="isAnonymous()">
					<li ><a href="#" target="_self" class="black" onclick="document.getElementById('loginForm').style.display='block';document.getElementById('text-carousel').style.display='none'"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Sign in</a></li>
				</sec:authorize>
				<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
					<li ><a href="#" class="black" ><span class="glyphicon glyphicon-user" aria-hidden="true"/> <sec:authentication property="principal.username"/></a></li>
					<li ><a href="<c:url value="/logout" />" class="black">  Sign out</a></li>

				</sec:authorize>
			</ul>
		</div>
	</div>

</nav>
<div class="container-fluid modal col-sm-12 col-xs-12"  id="loginForm"  >

	<form class="center modal-content"  action="<c:url value='/login' />" method='POST' >
		<span onclick="document.getElementById('loginForm').style.display='none'" class="close" title="Close Modal">&times;</span>
		<div class="form-group ">
			<label for="usernameL">Login</label>
			<input type="text" class="form-control" id="usernameL" name="login" placeholder="Username">
		</div>
		<div class="form-group ">
			<label for="passwordL">Password</label>
			<input type="password" class="form-control" id="passwordL" placeholder="Password" name="password">
		</div>
		<button id="logInbtn" type="submit" class="paddingB form-control btn btn-success btn-lg text-center">Sign in</button>
		<div><br><p>Not registered yet?<a href="#" id="llinkoncreae" target="_self" class="black" onclick="document.getElementById('registrationForm').style.display='block'" style="width:auto;"> Create an account.</a></p></div>

	</form>
</div>

<div class="container modal col-sm-12 col-xs-12" id="registrationForm">

	<form method="post" class="center modal-content">
		<span onclick="document.getElementById('registrationForm').style.display='none'" class="close" title="Close Modal">&times;</span>
		<div class="form-group ">
			<label for="usernameR">Username</label>
			<input type="text" class="form-control" id="usernameR" name="usernameR" placeholder="Username">
		</div>
		<div class="form-group ">
			<label for="login">Login</label>
			<input type="text" class="form-control" id="login" name="login" placeholder="login">
		</div>
		<div class="form-group ">
			<label for="passwordR">Pasword</label>
			<input type="password" class="form-control" id="passwordR" name="passwordR" placeholder="Password">
		</div>
		<button type="submit" class="paddingB form-control btn btn-success btn-lg text-center" onclick="sendtoDB()">Join now</button>

	</form>

</div>
