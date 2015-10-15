<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<c:set value="${requestScope.isActivated }" var="isActivated"></c:set>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>Login Page - VTube</title>

		<meta name="description" content="User login page" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="assets/css/bootstrap.css" />
		<link rel="stylesheet" href="assets/css/font-awesome.css" />

		
		<!-- sweet alert -->
		<link rel="stylesheet" type="text/css" href="assets/css/sweetalert/sweetalert.css">
		<script src="assets/js/sweetalert/sweetalert.min.js"></script>
		
	</head>

	<body >
	<div class="container">
		<c:choose>
		 <c:when test="${isActivated==1 }">
		 	<c:redirect url="login"></c:redirect>
		 </c:when>
		 <c:otherwise>
		 	<div class="alert alert-error">
				<button type="button" class="close" data-dismiss="alert">
					<i class="ace-icon fa fa-times"></i>
				</button>
				<strong>Activation denied!</strong>
				<br>
			</div>
		 </c:otherwise>
		</c:choose>
	</div>
	
	</body>
</html>
