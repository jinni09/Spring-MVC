<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../session/sessionChk.jsp" %>

<script type="text/javascript">
	$(document).ready(function() {
		var fileCount = ${fileCount};
		
		if(fileCount > 4) {
			$(".filetable").hide();
		};
		var count = 0;
		
		$("#filelist").on('click', '.filedel', function(){
			$(".filetable").show();
			$(this).parent().parent().remove();
			count++;
			var filedelIndex = count - 1;
			var filedelId = $(this).attr("id");
			$('#filedellist').append(
				'<input type="hidden" name="filedellist['+ filedelIndex +']" value="'+filedelId+'">'
			);
		});
		
		$('#addFile').click(function() {
			var fileIndex = $('#fileview tr').length;
			var totalcount = 5 - fileCount + count;
			if(fileIndex < totalcount) {
				$('#fileview').append(
					'<tr><td>'+
					'<input type="file" name="files['+ fileIndex +']" style="margin-bottom: 3px;"/></td>'+
					'<td><button type="button" style="font-size: 5px; padding: 1px 2px 2px 2px; id="fileremove['+ fileIndex +']" class="btn btn-sm btn-default fileremove">'+
					'<i class="glyphicon glyphicon-remove"></i></button>'+
					'</td></tr>'
				);
			}else {
				alert("파일 첨부는 5개까지 할 수 있습니다.");
			}
		});
		$("#fileview").on('click', '.fileremove', function(){
			$(this).parent().parent().remove();
		});
	});
	
	function subjectChk(obj, maxByte) {
	    var strValue = obj.value;
	    var strLen = strValue.length;
	    var totalByte = 0;
	    var len = 0;
	    var oneChar = "";
	    var str2 = "";
	
	    for (var i = 0; i < strLen; i++) {
	        oneChar = strValue.charAt(i);
	        if (escape(oneChar).length > 4) {
	            totalByte += 3;
	        }else if(escape(oneChar) == '%0A') {
	        	totalByte += 2;
	        }else if(escape(oneChar) >= 'u4E00' && escape(oneChar) <= 'u9FFF') {
	        	totalByte += 3;
	        }else {
	            totalByte++;
	        }
	
	        // 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
	        if (totalByte <= maxByte) {
	            len = i + 1;
	        }
	    }
		
	    // 넘어가는 글자는 자른다.
	    if (totalByte > maxByte) {
	    	alert("제목은 한글 기준 100자 까지만 쓸 수 있습니다.");
	        str2 = strValue.substr(0, len);
	        obj.value = str2;
	        subjectChk(obj, maxByte);
	    }
	}

	function contentChk(obj, maxByte) {
	    var strValue = obj.value;
	    var strLen = strValue.length;
	    var totalByte = 0;
	    var len = 0;
	    var oneChar = "";
	    var str2 = "";
	
	    for (var i = 0; i < strLen; i++) {
	        oneChar = strValue.charAt(i);
	        if (escape(oneChar).length > 4) {
	            totalByte += 3;
	        }else if(escape(oneChar) == '%0A') {
	        	totalByte += 2;
	        }else if(escape(oneChar) >= 'u4E00' && escape(oneChar) <= 'u9FFF') {
	        	totalByte += 3;
	        }else {
	            totalByte++;
	        }
	
	        // 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
	        if (totalByte <= maxByte) {
	            len = i + 1;
	        }
	    }
		
	    var counter = document.getElementById("counter");
		counter.innerHTML = totalByte;
	    
	    // 넘어가는 글자는 자른다.
	    if (totalByte > maxByte) {
	        alert("내용은 " + maxByte + " byte 까지만 쓸 수 있습니다.");
	        str2 = strValue.substr(0, len);
	        obj.value = str2;
	        contentChk(obj, maxByte);
	    }
	}
	
	function chk() {
		
		var fmt2 = /^\s\s*$/;
		
		if (fmt2.test(frm.subject.value) || frm.subject.value == "") {
			alert ("제목을 입력하세요");
			frm.subject.value="";
			frm.subject.focus();
			return false;
		}
		
		if (fmt2.exec(frm.content.value) || frm.content.value == "") {
			alert ("내용을 입력하세요");
			frm.content.value="";
			frm.content.focus();
			return false;
		}
		return true;
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
					<li class="active">Write</li>
				</ol>
			</div>
		</div>

		<div class="panel panel-default panel-table">
			<form action="write" name="frm" method="post" enctype="multipart/form-data" role="form" onsubmit="return chk()">
				<input type="hidden" name="m_no" value="${m_no}">
				<input type="hidden" name="no" value="${board.no}">
				<input type="hidden" name="pageNum" value="${pageNum}">
				<div style="padding: 25px 25px 0px 25px;">
					<div class="w_nick">
						작성자 : <b>${m_nick}</b>
					</div>
					<div class="form-group">
						<label><input type="text" class="form-control" name="subject"
							id="subject" oninput="subjectChk(this, 300)" maxlength="1000" placeholder="제목을 입력해 주세요."
							autofocus="autofocus" value="${board.subject}" required></label>
					</div>
					<div class="form-group">
						<textarea class="form-control" name="content"
							id="content" rows="10" oninput="contentChk(this, 3000)" maxlength="3001" placeholder="내용을 입력해 주세요." required>${board.content}</textarea>
						<div class="text-right"><span id="counter">0</span>/3000 byte</div>
					</div>
				</div>
				<c:if test="${fileCount ne 0}">
					<div class="form-group file">
						<table id="filelist">
							<c:forEach var="file" items="${fileList}">
							<tr class="text-left">
								<td class="text-left">
			                        <i class="glyphicon glyphicon-floppy-disk" style="color: #030066;"></i>
			                        <font size="2px" color="black">${file.f_original_name}</font>
			                        <font size="2px">(${file.f_size} byte)</font>
			                        <button type="button" style="font-size: 5px; padding: 1px 2px 2px 2px;" id="${file.f_no}" class="btn btn-sm btn-default filedel">
									<i class="glyphicon glyphicon-remove"></i></button>
			                    </td>
		                    </tr>
		                    </c:forEach>
	                    </table>
					</div>
				</c:if>
				<div class="form-group file">
					<input id="addFile" type="button" value="파일추가" class="btn btn-sm btn-default" style="margin-bottom: 10px;"/>
					<table id="fileview" class="filetable">
						<tr>
							<td><label><input type="file" name="files[0]" id="filename" style="margin-bottom: 3px;" /></label></td>
							<td><button type="button" id="fileremove[0]" class="btn btn-sm btn-default fileremove">
							<i class="glyphicon glyphicon-remove"></i></button></td>
						</tr>
					</table>
				</div>
				<div class="panel-footer text-center">
					<span>
						<button type="submit" class="btn btn-sm btn-default" style="margin-right: 5px;">확인</button>
						<a href="javascript:history.go(-1);" class="btn btn-sm btn-default">취소</a>
					</span>
				</div>
			</form>
		</div>
	</div>
