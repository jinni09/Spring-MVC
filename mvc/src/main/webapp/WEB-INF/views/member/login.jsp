<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	function login() {
		$.ajax({
			type : "POST",
			url : "login",
			cache : false,
			data : $("#login").serialize(),
			dataType: "text",
			success : function(data){
				if(data == "success") {
					location.href = "/mvc";
				} else {
					$("#m_passwd").val("");
					$("#m_passwd").focus();
					$("#msg").html("<font>가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.</font>");
				}
			},
			error: function(xhr, status, error){
				console.log(error);
			}
		});
	}
</script>
          
	<div class="container">
		<form class="form-signin" method="post" id="login">
			<h2 class="form-signin-heading">Sign in</h2>
			<label for="m_email" class="sr-only">Email address</label> 
			<input type="email" id="m_email" name="m_email" class="form-control" placeholder="Email address" required autofocus>
			<label for="m_passwd" class="sr-only">Password</label> 
			<input type="password" id="m_passwd" name="m_passwd" class="form-control" placeholder="Password" required>
			<div id="msg"></div>
			<button class="btn btn-lg btn-primary btn-block" type="button" onclick="login(); return false;">Sign in</button>
			<button class="btn btn-lg btn-default btn-block" type="button" style="margin-top:10px;"onclick="location.href='join'; return false;">Sign up</button>
		</form>
	</div>
