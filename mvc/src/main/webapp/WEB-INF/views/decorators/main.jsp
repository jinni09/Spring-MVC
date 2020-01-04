<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1"> <!-- 모바일 브라우저의 뷰포트 크기 조절 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spring MVC</title>
</head>
<body>

	<jsp:include page="top.jsp" />
	
	<c:if test="${empty pgm}">
		<span>
			<jsp:include page="home.jsp" />
		</span>
	</c:if>
	<c:if test="${not empty pgm}">
		<span>
			<jsp:include page="${pgm}" />
		</span>
	</c:if>
	
	<jsp:include page="bottom.jsp" />

</body>
</html>