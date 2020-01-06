<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
	function locate(pageNum){
		var searchType = document.getElementById("searchType");
		var searchTxt = document.getElementById("searchTxt");
		location.href="board?pageNum="+pageNum+"&searchType="+searchType.value+"&searchTxt="+searchTxt.value;
	}
	
	$(document).ready(function() {
		var searchType = document.getElementById("searchType");
		var searchTxt = document.getElementById("searchTxt");
		var sendData = 'pageNum='+${pb.nowPage}+'&searchType='+searchType.value+'&searchTxt='+searchTxt.value;
		$('#exceldown').click(function() {
			$.ajax({
				 url: 'exceldown',
				 data: sendData,
				 success: function(){
					 alert("D:드라이브에 엑셀 파일 생성 성공.");
				 }
			});
		});
	});
</script>
	
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header"><a href="board">Board</a>
					<small>게시판</small>
				</h3>
				<ol class="breadcrumb">
					<li><a href="main">Home</a></li>
					<li class="active">Board</li>
				</ol>
			</div>
		</div>
		
		<div class="panel panel-default panel-table">
			<div class="panel-heading">
				<div class="row">
					<div class="col col-xs-6">
						Page ${pb.nowPage} of ${pb.totalPage}
					</div>
					<div class="col col-xs-6 text-right">
						<button type="button" id="exceldown" class="btn btn-sm btn-success" style="margin-right: 5px;">엑셀다운 <em class="glyphicon glyphicon-floppy-save"></em></button>
						<a href="writeForm?pageNum=${pb.nowPage}" class="btn btn-sm btn-primary">글작성 <em class="glyphicon glyphicon-edit"></em></a>	
					</div>
				</div>
			</div>
			<div>
				<table class="table table-striped table-bordered table-list table-hover">
					<thead>
						<tr>
							<th width="4%"></th>
							<th width="30%">제목</th>
							<th width="10%">글쓴이</th>
							<th width="7%">작성일</th>
							<th width="5%">조회수</th>
							<th width="4%">파일</th>
						</tr>
					</thead>
					<tbody>
					<c:set var="no" value="${pb.no}" />
					<c:forEach var="brd" items="${list}">
					<tr>
						<td>${no}</td>
						<td class="text-left">
							<c:if test="${brd.sublength > 25}">
							<a href="view?no=${brd.no}&pageNum=${pb.nowPage}&searchType=${searchType}&searchTxt=${searchTxt}"><c:out value="${fn:substring(brd.subject,0,25)}"/>...</a></c:if>
							<c:if test="${brd.sublength < 25}">
							<a href="view?no=${brd.no}&pageNum=${pb.nowPage}&searchType=${searchType}&searchTxt=${searchTxt}">${brd.subject}</a>
							</c:if>
							<c:if test="${brd.replycount > 0}">
							<a href="view?no=${brd.no}&pageNum=${pb.nowPage}&searchType=${searchType}&searchTxt=${searchTxt}"><font style="font-weight: 900; color: #2196f3;">[${brd.replycount}]</font></a>
							</c:if>
						</td>
						<td>${brd.m_nick}</td>
						<c:set var="today" value="<%=new java.util.Date()%>" />
						<fmt:formatDate var="now" pattern="yyyyMMdd" value="${today}" />
						<fmt:parseDate var="regDate" pattern="yyyy-MM-dd HH:mm:ss" value="${brd.reg_date}" />
						<fmt:formatDate var="reg" pattern="yyyyMMdd" value="${regDate}" />
						<c:if test="${now eq reg}">
							<fmt:formatDate var="date" pattern="HH:mm" value="${regDate}" />
						</c:if>
						<c:if test="${now ne reg}">
							<fmt:formatDate var="date" pattern="yyyy-MM-dd" value="${regDate}" />
						</c:if>
						<td>${date}</td>
						<td>${brd.readcount}</td>
						<c:set var="fileCount" value="${bs.fileCount(brd.no)}"> </c:set>
						<td>
							<c:if test="${fileCount > 0}">
							&nbsp;<i class="glyphicon glyphicon-floppy-disk" style="color: #030066;"></i>&nbsp;
							</c:if>
						</td>
					</tr>
					<c:set var="no" value="${no-1}"></c:set>
					</c:forEach>
					<c:if test="${empty list}">
						<tr>
							<td colspan="6">데이터가 없습니다.</td>
						</tr>
					</c:if>
					</tbody>
				</table>
			</div>
			<div class="panel-footer text-center">
				<div class="row">
					<div class="col">
						<ul class="pagination">
							<c:if test="${pb.startPage > pb.pagePerBlock}">
							<li><a href="javascript:locate(1)">««</a></li>						
							<li><a href="javascript:locate(${pb.nowPage-1})">«</a></li>
							</c:if>
						</ul>
						<ul class="pagination">
							<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage}">
								<c:if test="${i eq pb.nowPage}">
									<li><a href="#"><b class="b2">${i}</b></a></li>
								</c:if>
								<c:if test="${i ne pb.nowPage}">
									<li><a href="javascript:locate(${i})">${i}</a></li>
								</c:if>
							</c:forEach>
						</ul>
						<ul class="pagination">
							<c:if test="${pb.totalPage > pb.endPage}">
							<li><a href="javascript:locate(${pb.nowPage+1})">»</a></li>
							<li><a href="javascript:locate(${pb.totalPage})">»»</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		<div class="searchDiv">
			<div class="navbar-form">
				<div class="form-group">
					<select class="form-control input-lg" id="searchType">
						<c:if test="${searchType eq 'all'}">
							<option value="all" selected="selected">제목 + 내용</option>
						</c:if>
						<c:if test="${searchType ne 'all'}">
							<option value="all">제목 + 내용</option>
						</c:if>
							
						<c:if test="${searchType eq 'subject'}">
							<option value="subject" selected="selected">제목</option>
						</c:if>
						<c:if test="${searchType ne 'subject'}">
							<option value="subject">제목</option>
						</c:if>
						
						<c:if test="${searchType eq 'content'}">	
							<option value="content" selected="selected">내용</option>
						</c:if>
						<c:if test="${searchType ne 'content'}">
							<option value="content">내용</option>
						</c:if>
							
						<c:if test="${searchType eq 'm_nick'}">
							<option value="m_nick" selected="selected">글쓴이</option>
						</c:if>
						<c:if test="${searchType ne 'm_nick'}">
							<option value="m_nick">글쓴이</option>
						</c:if>
					</select>
					<label><input type="text" id="searchTxt" class="form-control searchTxt" placeholder="Search" value="${searchTxt}"></label>
				</div>
				<button type="submit" class="btn btn-default searchBtn" onclick="locate(1)"><i class="glyphicon glyphicon-search fa-1x"></i></button>
			</div>
		</div>
	</div>
