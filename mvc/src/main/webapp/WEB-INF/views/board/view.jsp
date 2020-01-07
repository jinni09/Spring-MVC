<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	function replace(url) {
	    url= url.replace(/&/g,"%26"); 
	    url= url.replace(/\+/g,"%2B");
	    return url;
	}

	function rpSubmit(number) {
		var url = window.location.href;
		if(number == null || number == "" || number == "null") {
			if(confirm("로그인 하시겠습니까?")) {
				location.href="login?url=" + replace(url) + "";
			} else {
				return false;
			}
		}else {
			var fmt2 = /^\s\s*$/;
			if (fmt2.test(refrm.re_content.value) || refrm.re_content.value == "") {
				alert("댓글을 입력해 주세요.");
				refrm.re_content.value="";
				counter.innerHTML = "0 / 300 자";
				refrm.re_content.focus();
				return false;
			}else {
				return true;
			}
		}
		return false;
	}
	
	function deleteRpChk(re_no, no, pageNum) {
		if(confirm("해당 댓글을 삭제하시겠습니까?")) {
			location.href="deleteReply?re_no="+re_no+"&no="+no+"&pageNum="+pageNum;
		}else {
			return;
		}
	}
	
	function delChk() {
		if(confirm("해당 글을 삭제하시겠습니까?")) {
			location.href="delete?no=${board.no}&pageNum=${pageNum}";
		}else {
			return;
		}
	}
	
	$(document).ready(function(){
		$(".reply_up").hide();
		$(".btnupup").hide();
		$('.btnup').click(function(){
			$("form").each(function() {
				this.reset();
			});
			$(".up").hide();
			$('.btnup').show();
			$(".btnupup").hide();
			$(this).parent().parent().parent().nextAll(".reply_up").toggle("slow");
			$(this).hide();
			$(this).next().show();
			$(this).parent().parent().parent().nextAll(".reply_up").find("textarea").focus();
			var upup_content = $(this).parent().parent().parent().nextAll(".reply_up").find("textarea").val().length;
			$(this).parent().parent().parent().nextAll(".reply_up").find("textarea").next().next().text(upup_content + " / 300 자");
			$(this).parent().parent().parent().nextAll(".reply_up").find("input").click(function(){
				var fmt2 = /^\s\s*$/;
				var a = $(this).prev().val();
				if (fmt2.test(a) || a == "") {
					alert("댓글을 입력해 주세요.");
					$(this).prev().val("");
					$(this).prev().focus();
					$(this).next().text("0 / 300 자");
				}else {
					$(this).parent().submit();
				}
			});
		});
		$('.btnupup').click(function(){
			$(this).parent().parent().parent().nextAll(".reply_up").toggle("slow");
			$(this).hide();
			$(this).prev().show();
		});
	});
	
	function re_contentChk(obj, maxLen) {
	    var strValue = obj.value;
	    var strLen = strValue.length;
	    var totalLen = 0;
	    var len = 0;
	    var oneChar = "";
	    var str2 = "";
	
	    for (var i = 0; i < strLen; i++) {
	    	totalLen++;
	        // 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
	        if (totalLen <= maxLen) {
	            len = i + 1;
	        }
	    }
		
	    var counter = document.getElementById("counter");
		counter.innerHTML = totalLen + " / " + maxLen + " 자";
	    
	    // 넘어가는 글자는 자른다.
	    if (totalLen > maxLen) {
	        alert(maxLen + "자까지만 입력할 수 있습니다.");
	        str2 = strValue.substr(0, len);
	        obj.value = str2;
	        re_contentChk(obj, maxLen);
	    }
	}
	
	function up_contentChk(obj, maxLen) {
	    var strValue = obj.value;
	    var strLen = strValue.length;
	    var totalLen = 0;
	    var len = 0;
	    var oneChar = "";
	    var str2 = "";
	
	    for (var i = 0; i < strLen; i++) {
	    	oneChar = strValue.charAt(i);
	        totalLen++;
	        // 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
	        if (totalLen <= maxLen) {
	            len = i + 1;
	        }
	    }
	    
	    var counter3 = obj.nextSibling.nextSibling.nextSibling.nextSibling;
	    counter3.innerHTML = totalLen + " / " + maxLen + " 자";

	    // 넘어가는 글자는 자른다.
	    if (totalLen > maxLen) {
	        alert(maxLen + "자까지만 입력할 수 있습니다.");
	        str2 = strValue.substr(0, len);
	        obj.value = str2;
	        up_contentChk(obj, maxLen);
	    }
	}
</script>

	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header"><a href="board">Board</a>
					<small>게시판</small>
				</h3>
				<ol class="breadcrumb">
					<li><a href="/mvc">Home</a></li>
					<li><a href="board">Board</a></li>
					<li class="active">View</li>
				</ol>
			</div>
		</div>

		<div class="panel panel-default panel-table">
			<div class="panel-heading">
				<div class="row">
					<div class="col col-xs-6">
					</div>
					<div class="col col-xs-6 text-right">
						<c:if test="${sessionScope.m_no == null}">
							<a href="board?pageNum=${pageNum}&searchType=${searchType}&searchTxt=${searchTxt}" class="btn btn-sm btn-default" style="margin-top:2px;">목록</a>
						</c:if>
						<c:if test="${sessionScope.m_no == board.m_no}">
							<a href="board?pageNum=${pageNum}&searchType=${searchType}&searchTxt=${searchTxt}" class="btn btn-sm btn-default" style="margin-right: 5px;">목록</a>
							<a href="write?no=${board.no}&pageNum=${pageNum}" class="btn btn-sm btn-default" style="margin-right: 5px;">수정</a>
							<a href="javascript:delChk()" class="btn btn-sm btn-default">삭제</a>
						</c:if>
					</div>
				</div>
			</div>
			<div>
				<table class="table table-striped table-bordered table-list">
					<c:if test="${not empty board}">
						<tr>
							<th width="20%">제목</th>
							<td class="text-left" style="word-wrap:break-word;">${board.subject}</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td class="text-left">${board.m_nick}</td>
						</tr>
						<tr>
							<th>조회수</th>
							<td class="text-left">${board.readcount}</td>
						</tr>
						<c:if test="${null eq board.up_date}">
							<tr>
								<th>작성일</th>
								<td class="text-left">${board.reg_date}</td>
							</tr>
						</c:if>
						<c:if test="${null ne board.up_date}">
							<tr>
								<th>작성일</th>
								<td class="text-left">${board.reg_date}</td>
							</tr>
							<tr>
								<th>최근 수정일</th>
								<td class="text-left">${board.up_date}</td>
							</tr>
						</c:if>
						<tr>
							<th>첨부파일</th>
							<td class="text-left">
								<c:forEach var="file" items="${fileList}">
			                        <a href="filedown?fileName=${file.f_stored_name}" class="fileview">${file.f_original_name}</a> 
			                        (${file.f_size} byte)<br>
			                    </c:forEach>
			                    <c:if test="${empty fileList}">
			                    	<span class="noFile">첨부된 파일이 없습니다.</span>
			                    </c:if>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="text-left content">${board.content}</td>
						</tr>
					</c:if>
					<c:if test="${empty board}">
						<tr>
							<td colspan="2">데이터가 없습니다.</td>
						</tr>
					</c:if>
				</table>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="panel panel-default panel-table re_panel">
			<h5 class="re_header">${replyCount} Comments:</h5>
			<c:if test="${not empty reList}">
			<c:forEach var="re" items="${reList}">
			<div>
				<div class="testimonials">
					<div class="carousel-info">
						<div class="pull-left">
							<span class="testimonials-name">${re.m_nick}</span>
							<span class="testimonials-post">${re.re_reg_date}</span>
						</div>
						<div class="pull-right">
							<span class="testimonials-menu">
							<c:if test="${re.m_no == sessionScope.m_no}">
							<a class="a_link btnup">수정</a>
							<a class="red_link btnupup">수정취소</a>
							 | 											
							<a class="a_link" onclick="deleteRpChk(${re.re_no},${board.no},${pageNum})">삭제</a>
							</c:if>
							</span>
						</div>
					</div>
					<blockquote class="content">
						<span id="contentreset">${re.re_content}</span>
					</blockquote>
					<div class="reply_up">
						<blockquote>
							<form action="updateReply">
								<input type="hidden" name="m_no" value="${sessionScope.m_no}">
								<input type="hidden" name="re_no" value="${re.re_no}">											
								<input type="hidden" name="no" value="${board.no}">
								<input type="hidden" name="pageNum" value="${pageNum}">
								<c:if test="${sessionScope.m_no > 0}">
									<textarea rows="3" oninput="up_contentChk(this, 300)" name="re_content" 
									required>${re.up_content}</textarea>&nbsp;&nbsp;<input type="button" class="btn reply_btn btn-default" value="수정">
									<div class="text-right" style="margin-right: 105px;" id="counter2"></div>
								</c:if>
							</form>
						</blockquote>
					</div>
				</div>
			</div>
			</c:forEach>
			</c:if>
			<c:if test="${empty reList}">
			<div class="testimonials">
				<blockquote>
				<p>
					등록된 댓글이 없습니다.
				</p>
				</blockquote>
			</div>
			</c:if>
			
			<div class="reply_w">
				<form action="writeReply" name="refrm" onsubmit="return rpSubmit(${sessionScope.m_no})">
				<input type="hidden" name="m_no" value="${sessionScope.m_no}">
				<input type="hidden" name="no" value="${board.no}">
				<input type="hidden" name="pageNum" value="${pageNum}">
				<c:if test="${sessionScope.m_no == null}">					
				<textarea rows="3" maxlength="300" id="re_content" name="re_content" placeholder="로그인이 필요한 서비스입니다." 
					onclick="return rpSubmit(${sessionScope.m_no})"></textarea>&nbsp;&nbsp;<input type="submit" class="btn reply_btn btn-default" value="등록">
				</c:if>
				<c:if test="${sessionScope.m_no > 0}">					
				<textarea style="border:solid 1px; width:88%; vertical-align:top;" rows="3" cols="80" oninput="re_contentChk(this, 300)" id="re_content" 
					name="re_content" placeholder="댓글을 입력해 주세요." required></textarea>&nbsp;&nbsp;<input type="submit" class="btn reply_btn btn-default" value="등록">
				<div class="text-right"><span id="counter" style="margin-right: 95px;">0 / 300 자</span></div>
				</c:if>
				</form>
			</div>
		</div>
	</div>
