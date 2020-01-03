<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a href="/mvc" class="navbar-brand">Top.jsp</a>
			</div>
			<div class="navbar-collapse collapse" id="navbar">
				<ul class="nav navbar-nav">
					<li><a href="board">Board</a></li>
				</ul>
				<ul class="nav navbar-nav">
					<li class="disabled"><a href="menu2">Menu2</a></li>
				</ul>
				<ul class="nav navbar-nav">
					<li class="disabled"><a href="menu3">Menu3</a></li>
				</ul>
				<c:set var="m_no" value="${sessionScope.m_no}"></c:set>
				<c:if test="${empty m_no}">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="login">Sign in</a></li>
						<li><a href="join">Sign up</a></li>
					</ul>
				</c:if>
				<c:if test="${not empty m_no}">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="logout">Sign out</a></li>
					</ul>
				</c:if>
			</div>
		</div>
	</nav>
