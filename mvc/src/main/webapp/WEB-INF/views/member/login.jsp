<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	$(function() {
		$('#email').keyup(function() {
			$('#msg1').html("<font></font>");
			$('#msg2').html("<font></font>");
		});
	});
</script>
          
	<div class="container">
		<form class="form-signin" action="login" method="post">
			<h2 class="form-signin-heading">Sign in</h2>
			<label for="email" class="sr-only">Email address</label> 
			<input type="email" id="email" name="email" class="form-control" placeholder="Email address" required autofocus>
			<c:if test="${not empty msg1}">
				<span id="msg1"><font color="red"> ${msg1}</font></span>
			</c:if>
			<label for="password" class="sr-only">Password</label> 
			<input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
			<c:if test="${not empty msg2}">
				<span id="msg2"><font color="red"> ${msg2}</font></span>
			</c:if>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
			<button class="btn btn-lg btn-default btn-block" type="button" style="margin-top:10px;"onclick="location.href='join'; return false;">Sign up</button>
		</form>
	</div>
