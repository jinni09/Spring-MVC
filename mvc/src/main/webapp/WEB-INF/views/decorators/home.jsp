<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	$(document).ready(function() {
	});
</script>

	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			
			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="<%=request.getContextPath()%>/resources/img/space.jpg" alt="Los Angeles" style="width: 100%;">
					<div class="carousel-caption">
						<h3>Los Angeles</h3>
						<p>LA is always so much fun!</p>
					</div>
				</div>
				<div class="item">
					<img src="<%=request.getContextPath()%>/resources/img/space.jpg" alt="Chicago" style="width: 100%;">
					<div class="carousel-caption">
						<h3>Chicago</h3>
						<p>Thank you, Chicago!</p>
					</div>
				</div>
				<div class="item">
					<img src="<%=request.getContextPath()%>/resources/img/space.jpg" alt="New York" style="width: 100%;">
					<div class="carousel-caption">
						<h3>New York</h3>
						<p>We love the Big Apple!</p>
					</div>
				</div>
			</div>
	
			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> 
				<span class="sr-only">Previous</span>
			</a> 
			<a class="right carousel-control" href="#myCarousel" data-slide="next"> 
				<span class="glyphicon glyphicon-chevron-right"></span> 
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>

	<div class="container">
	<!-- Example row of columns -->
		<div class="row">
			<div class="col-md-4">
				<h2>Heading</h2>
				<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
				<p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
			</div>
			<div class="col-md-4">
				<h2>Heading</h2>
				<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
				<p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
			</div>
			<div class="col-md-4">
				<h2>Heading</h2>
				<p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
				<p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
			</div>
		</div>
	</div>